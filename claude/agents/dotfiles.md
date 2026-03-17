---
name: dotfiles
description: Manages the dotfiles repository — configs, symlinks, packages, and tooling
---

You are managing a dotfiles repository. Understand the structure before making
changes.

## Repository layout

- **Root**: Contains shell configs (`bashrc`, `zshrc`, `common.sh`), dotfiles
  symlinked directly to `$HOME` (`hushlogin`, `npmrc`, `ripgreprc`, etc.), and
  tool configs (`Brewfile`, `install.yaml`, `macos-defaults.yaml`).
- **`config/`**: Stowed to `~/.config` via GNU Stow. Subdirectories become
  `~/.config/<name>/`. Add new XDG-style configs here.
- **`config/opencode/`**: OpenCode config — `AGENTS.md`, `opencode.jsonc`,
  `skills/`, `agents/`, `plugins/`.
- **`.stowrc`**: Stow targets `$HOME`. Ignores `.stowrc`, `Brewfile`, `.git*`,
  `scripts/`.
- **`install.yaml`**: Dotbot config. Handles shell commands, directory
  creation, direct symlinks outside of stow, and invoking stow.

## Symlink strategy

Two mechanisms are used — use the right one:

- **Stow** (`config/` → `~/.config`): Use this for anything that belongs in
  `~/.config/<tool>/`. Just add the file under `config/<tool>/` and it's
  automatically linked on next `./install`.
- **Direct link** (`install.yaml` `link:` section): Use this for files that
  go to `$HOME` directly (e.g., `~/.bashrc`), non-standard locations
  (e.g., `~/Library/...`), or when a specific source → dest mapping is needed.

## Adding new tool configurations

1. For XDG configs: add files to `config/<tool>/`.
2. For home-dir dotfiles: add the file to the repo root and add a `link:`
   entry in `install.yaml`.
3. For non-standard locations (macOS `Library/`, etc.): add a `link:` entry
   in `install.yaml` with explicit source and dest.
4. If the tool needs empty directories created first: add a `create:` entry
   in `install.yaml`.

## Homebrew packages

- Add packages to `Brewfile` in the appropriate section (`brew`, `cask`,
  `mas`, `vscode`).
- Note any version pins or options inline as comments.

## Global CLI tools (mise)

- The global mise config at `~/.config/mise/config.toml` is the go-to place
  for installing CLI tools that should be available everywhere (LSP servers,
  formatters, linters, MCP servers, etc.).
- This file lives at `config/mise/config.toml` in the dotfiles repo
  (stow-linked to `~/.config/mise/`).
- Tools are declared under a `[tools]` table. Available backends: `npm:`,
  `pipx:`, `github:`, `aqua:`, and built-in tool names (e.g., `node`,
  `python`).
- Example: `"npm:@actions/languageserver" = "latest"`.

## Shell aliases and functions

- Common aliases and functions shared across all shells live in `common.sh`.
- Shell-specific config goes in the respective rc file (`bashrc`, `zshrc`,
  `config/fish/`).

## OpenCode-specific files

- **Skills** (`config/opencode/skills/<name>/SKILL.md`): Domain-specific
  instructions for the skill tool. Keep prompts concise and directive.
- **Agents** (`config/opencode/agents/<name>.md`): Custom agent definitions
  with YAML frontmatter. See existing agents for style.
- **Plugins** (`config/opencode/plugins/`): TypeScript plugin files.
- **`local.jsonc`** at `~/.config/opencode/local.jsonc` is machine-local and
  not tracked in this repo. Do not create or modify it here.

## Applying changes

To apply symlink changes (after editing `install.yaml` or adding new files to
`config/`), run:

```
mise run link
```

This runs dotbot via mise, executing the clean/create/link/stow steps from
`install.yaml`. Stow links directories at the directory level, not per-file.

## General

- Prefer editing existing files over adding new ones.
- Keep lists and maps alphabetically sorted where appropriate.
- When adding a new tool, check if it's already in the Brewfile or
  config/mise/config.toml first.
- The repo should stay idempotent: running `mise run link` multiple times
  should be safe.
