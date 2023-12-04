" Auto command configurations

" Format Rust files on save
autocmd BufWritePre *.rs lua vim.lsp.buf.format()

