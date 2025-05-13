local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")

dapui.setup()
require("nvim-dap-virtual-text").setup({ commented = true })

-- Usa o executável "python" do ambiente Conda ativado
dap_python.setup("python")  -- usa o que estiver em $PATH

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>dc", dap.continue, opts)
vim.keymap.set("n", "<leader>do", dap.step_over, opts)
vim.keymap.set("n", "<leader>di", dap.step_into, opts)
vim.keymap.set("n", "<leader>ds", dap.step_out, opts)
vim.keymap.set("n", "<leader>dq", dap.terminate, opts)
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)

-- (opcional) rodar arquivo atual
vim.keymap.set("n", "<leader>dr", function()
  dap.run({
    type = "python",
    request = "launch",
    name = "Launch current file",
    program = vim.fn.expand("%:p"),
    pythonPath = "python", -- chama o python do Conda
  })
end, opts)
