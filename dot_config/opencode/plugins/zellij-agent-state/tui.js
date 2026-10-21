// OpenCode V2 CLI plugin: https://opencode.ai/v2/docs/build/plugins/cli
//
// Tells ~/.local/bin/zellij-agent-state what the session shown in this
// terminal is doing: working, waiting for you, done or failed. Only runs inside
// zellij. Subagent sessions are ignored, so a subagent finishing does not mark
// the turn done.

import { spawn } from "node:child_process"
import { homedir } from "node:os"
import { join } from "node:path"
import { createEffect, createRoot, untrack } from "solid-js"

const BIN = join(homedir(), ".local", "bin", "zellij-agent-state")
const PID = String(process.pid)

function run(args) {
  try {
    const child = spawn(BIN, args, { stdio: "ignore" })
    child.on("error", () => {})
  } catch {
    // Reporting must never break opencode.
  }
}

export default {
  id: "zellij-agent-state",
  async setup(ctx) {
    if (!process.env.ZELLIJ_SESSION_NAME) return

    let last = ""
    const report = (state, message = "") => {
      if (state === last) return
      last = state
      run(state === "clear" ? ["clear", PID] : ["set", state, PID, message])
    }

    const shown = () => {
      const route = ctx.ui.router.current()
      return route.type === "session" ? route.sessionID : undefined
    }

    const stop = ctx.data.listen(({ details: event }) => {
      const data = event.data ?? {}
      const sessionID = data.sessionID || data.form?.sessionID
      if (!sessionID || sessionID !== shown()) return
      if (ctx.data.session.get(sessionID)?.parentID) return
      switch (event.type) {
        case "session.execution.started":
        case "permission.replied":
        case "form.replied":
        case "form.cancelled":
          report("working")
          break
        case "permission.asked":
          report("waiting", data.message || data.action || "")
          break
        case "form.created":
          report("waiting", data.form?.title || "")
          break
        case "session.execution.succeeded":
          report("done")
          break
        case "session.execution.interrupted":
          report("clear")
          break
        case "session.execution.failed":
          report("error", data.error?.message || "")
          break
      }
    })

    // Switching to another session (or home) resets the state to that session's.
    // Only the route is tracked, so a status change cannot override a report.
    let selected
    const dispose = createRoot((dispose) => {
      createEffect(() => {
        const sessionID = shown()
        if (sessionID === selected) return
        selected = sessionID
        const running = sessionID && untrack(() => ctx.data.session.status(sessionID)) === "running"
        report(running ? "working" : "clear")
      })
      return dispose
    })

    return () => {
      dispose()
      stop()
      report("clear")
    }
  },
}
