# Vim Quick Reference

## Plugin Management (vim-plug)

| Command | Description |
|---------|-------------|
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused plugins |
| `:PlugStatus` | Check plugin status |
| `:PlugDiff` | Review changes from last update |
| `:PlugUpgrade` | Upgrade vim-plug itself |

## File Navigation

| Key Binding | Command | Description |
|-------------|---------|-------------|
| `Ctrl+n` | `:NERDTreeToggle` | Toggle file explorer |
| `Ctrl+p` | `:Files` | Fuzzy find files |
| `Ctrl+b` | `:Buffers` | List and switch buffers |
| `Ctrl+f` | `:Rg` | Search text in files (ripgrep) |

### NERDTree Commands (when focused)

| Key | Action |
|-----|--------|
| `o` | Open file/directory |
| `i` | Open in horizontal split |
| `s` | Open in vertical split |
| `t` | Open in new tab |
| `m` | Show menu (add/delete/move files) |
| `R` | Refresh tree |
| `?` | Toggle help |

## Window Navigation

| Key Binding | Description |
|-------------|-------------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to down window |
| `Ctrl+k` | Move to up window |
| `Ctrl+l` | Move to right window |

## Code Quality (ALE)

| Key Binding | Command | Description |
|-------------|---------|-------------|
| `,f` | `:ALEFix` | Auto-fix current file |
| | `:ALEInfo` | Show ALE configuration |
| | `:ALEGoToDefinition` | Jump to definition |
| | `:ALEHover` | Show documentation |
| `]e` | | Jump to next error |
| `[e` | | Jump to previous error |

### ALE Signs

- `✘` - Error
- `⚠` - Warning

## Editing

| Key Binding | Description |
|-------------|-------------|
| `jj` | Escape from insert mode |
| `,,<space>` | Clear search highlighting |
| `:sudow` | Save file with sudo |

## Comments (NERDCommenter)

| Key Binding | Description |
|-------------|-------------|
| `<leader>cc` | Comment out lines |
| `<leader>cu` | Uncomment lines |
| `<leader>c<space>` | Toggle comments |
| `<leader>cs` | Sexy comment |

*(Leader key is `,` by default)*

## Snippets (UltiSnips)

| Key Binding | Description |
|-------------|-------------|
| `<tab>` | Expand snippet or jump forward |
| `<shift-tab>` | Jump backward |

## Git (Fugitive)

| Command | Description |
|---------|-------------|
| `:Git` or `:G` | Git command |
| `:Git status` | Show git status |
| `:Git diff` | Show diff |
| `:Git blame` | Show blame |
| `:Git commit` | Commit changes |
| `:Git push` | Push to remote |
| `:Gwrite` | Stage current file |
| `:Gread` | Checkout current file |

## Surround (vim-surround)

| Command | Description |
|---------|-------------|
| `cs"'` | Change surrounding " to ' |
| `ds"` | Delete surrounding " |
| `ysiw"` | Surround word with " |
| `yss"` | Surround line with " |
| `vS"` | Surround selection with " (visual mode) |

## Search and Replace

| Command | Description |
|---------|-------------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |
| `:noh` or `,<space>` | Clear highlighting |

## Sessions

| Command | Description |
|---------|-------------|
| `:SaveSession name` | Save session |
| `:OpenSession name` | Open session |
| `:DeleteSession name` | Delete session |
| `:ViewSession` | View saved sessions |

Sessions are auto-saved by default in `~/.vim/session/`

## FZF Commands

| Command | Description |
|---------|-------------|
| `:Files` | Find files |
| `:GFiles` | Git files |
| `:Buffers` | Open buffers |
| `:Rg [pattern]` | Search in files |
| `:Lines` | Search lines in open buffers |
| `:BLines` | Search lines in current buffer |
| `:History` | Recently opened files |
| `:Commands` | Available commands |
| `:Helptags` | Help tags |

### FZF Navigation (in FZF window)

| Key | Action |
|-----|--------|
| `Ctrl+j/k` | Navigate down/up |
| `Ctrl+n/p` | Navigate next/previous |
| `Enter` | Select |
| `Ctrl+t` | Open in tab |
| `Ctrl+x` | Open in split |
| `Ctrl+v` | Open in vsplit |
| `Esc` | Close FZF |

## File Type Specific

### Python
- Auto-format on save: Set `let g:ale_fix_on_save = 1` in vimrc
- Linters: flake8, pylint, mypy
- Fixers: black, isort

### Rust
- Auto-format on save: `let g:rustfmt_autosave = 1` (enabled by default)
- Linters: cargo, rustc
- Fixer: rustfmt

### Markdown
- Spell check enabled by default
- Folding disabled

## Useful Vim Commands

| Command | Description |
|---------|-------------|
| `:e filename` | Edit file |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:vs filename` | Vertical split |
| `:sp filename` | Horizontal split |
| `:tabnew` | New tab |
| `:tabn` / `:tabp` | Next/previous tab |
| `:help command` | Get help |

## Customization

Edit `~/.vim/vimrc.modern` to customize settings.

After making changes, reload with:
```vim
:source ~/.vimrc
```

Or restart vim.
