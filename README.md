# Run Packer
In a nvim session:
``` vim
:PackerInstall
```
# Treesitter setup
Wait for Treesitter to download and compile the parsers, It should happen automatically the first time you open the nvim session.
If it doesn't start automatically force it with:
```
:TSupdate
```
# Install Language servers 
### C/C++
``` bash
sudo pamac install llvm
```
> MacOS: 
you might have to add `export PATH=$PATH:/usr/local/opt/llvm/bin/` to your shell config file.

### python
``` bash
npm i -g pyright
```
### bash
``` bash
npm i -g bash-language-server
```
### Docker
``` bash
npm i -g docker-language-server-nodejs
```
### R 
in an R session:
``` r
install.packages('languageserver')
```
### Lua
``` bash
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

### Latex
You need TexLive and `latexmk` in your PATH.
install the rust cargo:
> remember to add `~/.cargo/bin/` directory to your PATH.
``` bash
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```
Most likely the luaindent command will not work out of the box:
`Can't locate YAML/Tiny.pm in @INC (you may need to install the YAML::Tiny module)..........`
You might need to run this:
``` bash
sudo cpan Unicode::GCString
sudo cpan App::cpanminus
sudo cpan YAML::Tiny
sudo perl -MCPAN -e 'install "File::HomeDir"'
```

# Telescope speed improvement
- Install [fd](https://github.com/sharkdp/fd) for better file finding 
- Install  [ripgrep](https://github.com/BurntSushi/ripgrep) to enable live_grep functionality
``` bash
pamac install fd ripgrep
```

