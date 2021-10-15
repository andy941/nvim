# Install Language servers 
### C/C++
``` bash
sudo pamac install llvm
```
Check that clangd is in your PATH, On MacOS is most probably not.
## python
``` bash
npm i -g pyright
```
## bash
``` bash
npm i -g bash-language-server
```
## Docker
``` bash
npm i -g docker-language-server-nodejs
```
## R 
in an R session:
``` r
install.packages('languageserver')
```

# Telescope speed improvement
- [ ] Install [fd](https://github.com/sharkdp/fd) for better file finding 
- [ ] Install  [ripgrep](https://github.com/BurntSushi/ripgrep) to enable live_grep functionality
``` bash
pamac install fd ripgrep
```
