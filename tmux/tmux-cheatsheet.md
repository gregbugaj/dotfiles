# Tmux Cheatsheet

Prefix: `Ctrl-a`

## General

| Key | Action |
|-----|--------|
| `C-a C-a` | Send literal Ctrl-a to application |
| `C-a r` | Reload config |
| `C-a :` | Command mode |

## Windows

| Key | Action |
|-----|--------|
| `C-a c` | New window (in current path) |
| `C-a n` | Next window (default) |
| `C-a p` | Previous window (default) |
| `C-a C-n` | Next window |
| `C-a C-p` | Previous window |
| `C-a C-l` | Next window (vim-style) |
| `C-a C-h` | Previous window (vim-style) |
| `C-a 1-9` | Go to window N |
| `C-a T` | Move current window to position 1 |
| `C-a ,` | Rename window |
| `C-a &` | Kill window |

## Panes

| Key | Action |
|-----|--------|
| `C-a |` | Split horizontally (in current path) |
| `C-a -` | Split vertically (in current path) |
| `C-a h` | Select pane left |
| `C-a j` | Select pane down |
| `C-a k` | Select pane up |
| `C-a l` | Select pane right |
| `C-a H` | Resize pane left (10) |
| `C-a J` | Resize pane down (5) |
| `C-a K` | Resize pane up (5) |
| `C-a L` | Resize pane right (10) |
| `C-a x` | Kill pane |
| `C-a z` | Toggle pane zoom |
| `C-a !` | Convert pane to window |
| `C-a q` | Show pane numbers |

## Sessions

| Key | Action |
|-----|--------|
| `C-a s` | Session picker (sessionx) |
| `C-a d` | Detach |
| `C-a $` | Rename session |
| `C-a (` | Previous session |
| `C-a )` | Next session |

## Mouse

| Key | Action |
|-----|--------|
| `C-a m` | Enable mouse |
| `C-a M` | Disable mouse |

Mouse is enabled by default.

## Synchronize Panes

| Key | Action |
|-----|--------|
| `C-a S` | Toggle sync input to all panes |

When enabled, keystrokes are sent to ALL panes in the current window simultaneously.

**Use cases:**
- Run same command on multiple servers
- Edit same file in multiple environments
- Tail logs across multiple machines

**Workflow:**
1. Split window into multiple panes (`C-a |` or `C-a -`)
2. SSH into different servers in each pane
3. Press `C-a S` to enable sync
4. Type commands - they appear in all panes
5. Press `C-a S` again to disable

## Copy Mode

| Key | Action |
|-----|--------|
| `C-a [` | Enter copy mode |
| `q` | Exit copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `/` | Search forward |
| `?` | Search backward |

## Plugins

### TPM (Plugin Manager)

| Key | Action |
|-----|--------|
| `C-a I` | Install plugins |
| `C-a U` | Update plugins |
| `C-a Alt-u` | Uninstall removed plugins |

### Resurrect (Session Save/Restore)

| Key | Action |
|-----|--------|
| `C-a C-s` | Save session |
| `C-a C-r` | Restore session |

### SessionX

| Key | Action |
|-----|--------|
| `C-a s` | Open session picker |

## Utilities

| Key | Action |
|-----|--------|
| `C-a u` | Open URL picker (urlview) |

## Command Line

```bash
tmux                    # Start new session
tmux new -s name        # New named session
tmux ls                 # List sessions
tmux attach             # Attach to last session
tmux attach -t name     # Attach to named session
tmux kill-session -t n  # Kill session
```
