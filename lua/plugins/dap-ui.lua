return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup({
      layouts = { {
        elements = { {
          id = "breakpoints",
          size = 0.2
        }, {
          id = "stacks",
          size = 0.8
        } },
        position = "left",
        size = 40
      }, {
        elements = { {
          id = "watches",
          size = 0.2
        }, {
          id = "scopes",
          size = 0.8
        } },
        position = "right",
        size = 40
      }, {
        elements = { {
          id = "repl",
          size = 1
        } },
        position = "bottom",
        size = 10
      } },
    }
    )
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
