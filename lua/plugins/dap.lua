return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local wk = require("which-key")
        wk.register({
            d = {
                name = "debug",
                c = { dap.continue, "Continue" },
                s = { dap.step_over, "Step over" },
                i = { dap.step_into, "step Into" },
                o = { dap.step_out, "step Out" },
                b = { dap.toggle_breakpoint, "toggle Breakpoint" },
                l = { dap.run_last, "run the Last debug session again" }
            },
        }, { prefix = "<leader>" })
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "js-debug-adapter",
                args = {
                    "${port}"
                }
            }
        }
        dap.configurations.typescript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
        }
        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
        }
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }
        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c
    end
}
