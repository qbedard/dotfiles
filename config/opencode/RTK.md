# RTK - Rust Token Killer

Bash commands in this environment are automatically rewritten by an RTK
plugin to use token-optimized output (60-90% savings). The rewriting is
transparent -- you run `git status` and it executes `rtk git status`.

## Key behavior

- Command output is **compact and authoritative**. Do not retry a command
  expecting more verbose output -- the condensed format is all that will
  be returned.
- If you need details not present in the compact output, use dedicated
  tools (Read, Grep, LSP) instead of re-running the same CLI command
  with different flags.
- If you genuinely need full native output, use `rtk proxy <cmd>` to
  bypass RTK filtering entirely. Prefer dedicated tools first.
- Common CLI tools are rewritten: git, kubectl, docker, cloud CLIs, and
  others. The exact set is managed by RTK and may expand over time.

## Meta commands (use rtk directly)

- `rtk gain` -- show token savings analytics
- `rtk gain --history` -- command usage history with savings
- `rtk discover` -- analyze session history for missed savings
- `rtk proxy <cmd>` -- run a command without RTK filtering (debugging)
