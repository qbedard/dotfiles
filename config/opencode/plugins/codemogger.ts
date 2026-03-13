import type { Plugin } from "@opencode-ai/plugin"

// Codemogger auto-indexing plugin for OpenCode.
//
// On session start (in git repos): indexes the codebase for semantic
// and keyword search via the codemogger MCP server.
// On file edits: debounced incremental reindex to keep the index fresh.
//
// The index is stored at <project>/.codemogger/index.db — add
// .codemogger/ to your project's .gitignore.

const REINDEX_DEBOUNCE_MS = 2000

export const CodemoggerPlugin: Plugin = async ({ $ }) => {
  try {
    await $`which npx`.quiet()
  } catch {
    console.warn("[codemogger] npx not found in PATH — plugin disabled")
    return {}
  }

  const isGitRepo = async (): Promise<boolean> => {
    try {
      await $`git rev-parse --git-dir`.quiet()
      return true
    } catch {
      return false
    }
  }

  let reindexTimer: ReturnType<typeof setTimeout> | undefined

  return {
    event: async ({ event }) => {
      if (event.type === "session.created") {
        if (!(await isGitRepo())) return
        $`npx -y codemogger index .`.quiet().nothrow()
      }

      if (event.type === "file.edited") {
        clearTimeout(reindexTimer)
        reindexTimer = setTimeout(() => {
          $`npx -y codemogger reindex .`.quiet().nothrow()
        }, REINDEX_DEBOUNCE_MS)
      }
    },
  }
}
