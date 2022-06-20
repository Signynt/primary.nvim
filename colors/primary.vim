" clear cache so this reloads changes.
" useful for development
" lua package.loaded['primary'] = nil
" lua package.loaded['primary.theme'] = nil
" lua package.loaded['primary.colors'] = nil
" lua package.loaded['primary.util'] = nil
lua package.loaded['primary.config'] = nil

lua require('primary').colorscheme()
