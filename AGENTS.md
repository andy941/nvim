# AGENTS.md

## Build, Lint, and Test Commands

- **Development Shell:**  
  - Start: `nix develop -c $SHELL` (see `lua/config/templates/devShell.nix`)
- **Linting:**  
  - Lua: Uses `nvim-lint` (see `lua/config/nvim-lint.lua`), optionally `luacheck`
  - Markdown, Quarto, etc.: Custom formatters via `lua/config/formatter.lua`
- **Formatting:**  
  - Lua: `stylua`  
  - Python: `yapf` (default), optionally `black`  
  - Rust: `rustfmt`  
  - C/C++: `clang-format`  
  - R: `styler`  
  - Nix: `nixfmt`
- **Testing:**  
  - Uses [neotest](https://github.com/nvim-neotest/neotest) with adapters for Python, Rust, etc.
  - **Run nearest test:**  
    - In Lua: `require("neotest").run.run()`  
    - For a file: `require("neotest").run.run(vim.fn.expand("%"))`
  - **Single test:** Place cursor on test and run `require("neotest").run.run()`
- **Docker Build:**  
  - `nix build .#<system>.prod` (see `devShell.nix`)

## Code Style Guidelines

- **Imports:**  
  - Use explicit `require` statements; group standard libraries first, then local modules.
- **Formatting:**  
  - Indent with 2 spaces (see `settings.lua`)
  - Use formatters as configured in `formatter.lua`
- **Types:**  
  - Prefer explicit types in Lua when possible; use type annotations in Python/Rust.
- **Naming Conventions:**  
  - Use `snake_case` for variables/functions, `PascalCase` for classes/types.
  - Prefix private functions with `_` if needed.
- **Error Handling:**  
  - Use idiomatic error handling for each language (e.g., `pcall` in Lua, `try/except` in Python, `Result` in Rust).
- **Comments:**  
  - Add space after comment markers; use block comments for documentation.
- **General:**  
  - UTF-8 encoding, no swap files, tabs/spaces as per `settings.lua`.
  - Avoid global state; prefer local scope and modules.
- **Keybindings:**  
  - Custom keymaps for formatting and commenting (see `formatter.lua`, `comment.lua`).
