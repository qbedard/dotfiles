require("lspsaga").init_lsp_saga({
  use_saga_diagnostic_sign = false,
  -- error_sign = "",
  -- warn_sign = "",
  -- infor_sign = "",
  -- hint_sign = "➤",
  code_action_prompt = { enable = false },
})

vim.cmd("highlight! link DiagnosticHint GruvboxAqua")
vim.cmd("highlight! link DiagnosticInformation GruvboxBlue")
vim.cmd("highlight! link DiagnosticTruncateLine GruvboxGray")
vim.cmd("highlight! link LspDiagnosticsFloatingError Error")
vim.cmd("highlight! link LspDiagnosticsFloatingWarn WarningMsg")
vim.cmd("highlight! link LspDiagnosticsFloatingInfor GruvboxBlue")
vim.cmd("highlight! link LspDiagnosticsFloatingHint GruvboxAqua")
vim.cmd("highlight! link LspSagaAutoPreview GruvboxFg3")
vim.cmd("highlight! link LspSagaBorderTitle GruvboxOrangeBold")
vim.cmd("highlight! link LspSagaCodeActionBorder GruvboxFg2")
vim.cmd("highlight! link LspSagaCodeActionContent GruvboxAquaBold")
vim.cmd("highlight! link LspSagaCodeActionTitle GruvboxOrangeBold")
vim.cmd("highlight! link LspSagaCodeActionTruncateLine GruvboxGray")
vim.cmd("highlight! link LspSagaDefPreviewBorder GruvboxFg2")
vim.cmd("highlight! link LspSagaDiagnosticBorder GruvboxPurple")
vim.cmd("highlight! link LspSagaDiagnosticHeader GruvboxFg3")
vim.cmd("highlight! link LspSagaDiagnosticTruncateLine GruvboxPurple")
vim.cmd("highlight! link LspSagaDocTruncateLine GruvboxGray")
vim.cmd("highlight! link LspSagaFinderSelection GruvboxGreenBold")
vim.cmd("highlight! link LspSagaHoverBorder GruvboxBlue")
vim.cmd("highlight! link LspSagaLspFinderBorder GruvboxBlue")
vim.cmd("highlight! link LspSagaRenameBorder GruvboxBlue")
vim.cmd("highlight! link LspSagaRenamePromptPrefix GruvboxAqua")
vim.cmd("highlight! link LspSagaShTruncateLine GruvboxGray")
vim.cmd("highlight! link LspSagaSignatureHelpBorder GruvboxAqua")
vim.cmd("highlight! link ProviderTruncateLine GruvboxGray")
vim.cmd("highlight! link SagaShadow GruvboxBg1")
vim.cmd("highlight! link TargetWord GruvboxRed")
