// Reports the state of this opencode session to zellij, for the zjstatus bar
// and macOS notifications. See ~/.local/bin/zellij-agent-state.
export default {
  id: "zellij-agent-state",
  async server() {
    return {}
  },
  setup() {},
}
