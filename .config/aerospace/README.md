# AeroSpace setup overview

This setup gives common apps a permanent named workspace. Opening an app usually sends it to its assigned workspace, and most workspace shortcuts also launch the app when needed.

`Hyper` means `Control + Option + Shift + Command`.

## Workspaces

| Workspace | Apps and purpose | Default display | Switch | Move focused window |
| --- | --- | --- | --- | --- |
| `browser` | Brave and Chrome | Main display | `Hyper + W` | `Alt + Shift + W` |
| `terminal` | Warp | Main display | ``Command + ` `` | `Alt + Shift + T` |
| `editor` | Zed and WebStorm | Main display | `Hyper + E` | `Alt + Shift + E` |
| `ai` | Codex | Main display | `Hyper + 4` | `Alt + Shift + 4` |
| `slack` | Slack | Main display | `Hyper + S` | `Alt + Shift + S` |
| `media` | Spotify, Podcasts, and Sonos | Main display | `Hyper + D`, `U`, or `O` | `Alt + Shift + D` |
| `mail` | Spark, Notes, and Notion | Main display | `Hyper + M` or `Hyper + N` | `Alt + Shift + M` |
| `figma` | Figma | Secondary display | `Hyper + 0` | `Alt + Shift + 0` |
| `safari` | Safari | Secondary display | `Hyper + I` | `Alt + Shift + I` |
| `secondary` | Temporary parking on the second external display | Secondary display | `Hyper + X` | `Alt + Shift + X` |
| `macbook` | Temporary parking on the built-in display | MacBook display | `Hyper + B` | `Alt + Shift + B` |

The main workspaces follow whichever monitor macOS marks as the main display. Figma, Safari, and `secondary` prefer the secondary external monitor, with sensible fallbacks when fewer displays are connected. The `macbook` workspace always targets the built-in screen.

## Everyday window controls

| Action | Shortcut |
| --- | --- |
| Focus left, down, up, or right | `Alt + H/J/K/L` |
| Focus previous or next window | `Alt + [` / `Alt + ]` |
| Focus next window with one hand | `Alt + R` |
| Move window left, down, up, or right | `Alt + Shift + H/J/K/L` |
| Move window to the next monitor | `Alt + Shift + N` |
| Resize focused window | `Alt + -` / `Alt + =` |
| Balance window sizes | `Alt + 0` |
| Toggle fullscreen | `Alt + Shift + F` |
| Toggle floating and tiling | `Alt + Shift + G` |
| Restore every app to its assigned workspace | `Alt + Shift + R` |
| Jump back to the previous workspace | `Hyper + Tab` |

Moving a window to a workspace or monitor follows the window, but leaves the mouse pointer where it is.

## Layouts

Horizontal tiling is the default, so windows sit next to each other. The `mail` workspace uses a horizontal accordion layout because Spark, Notes, and Notion often share it.

| Layout action | Shortcut |
| --- | --- |
| Horizontal tiles | `Alt + /` |
| Horizontal accordion | `Alt + ,` |
| Toggle tiles and accordion | `Alt + Shift + ,` |

Windows have 12-pixel gaps. Accordion windows keep 30 pixels visible so each window remains easy to select.

## Service mode

Press `Alt + Shift + ;` to enter service mode. Most commands run once and return to normal mode.

| Then press | Action |
| --- | --- |
| `Esc` | Reload the AeroSpace configuration |
| `R` | Flatten and reset the current workspace layout |
| `F` | Toggle floating and tiling |
| `H` / `L` | Focus the monitor to the left or right |
| `Shift + H/L` | Move the focused window to the left or right monitor |
| `Alt + Shift + H/J/K/L` | Join the window with a neighboring container |
| `Backspace` | Close every window except the focused one |
| `Up` / `Down` | Change volume |
| `Shift + Down` | Mute |

## Automatic behavior

AeroSpace starts at login and opens Brave, Chrome, Warp, Codex, Slack, Spotify, and Spark. New windows from configured apps automatically move to their workspace.

Finder, System Settings, Activity Monitor, and Raycast stay floating. `Hyper + G` opens Downloads in a floating Finder window.

The configuration lives in `~/.config/aerospace/aerospace.toml`.
