# Arch Config Showcase

Welcome to my custom Arch Linux configuration! This setup is designed for speed, minimalism, and productivity. Below you'll find screenshots and highlights of the key features that make this config unique. The base install script was forked from [SolDoesTech's HyprV4](https://github.com/SolDoesTech/HyprV4).

---

## 🚀 Features

- **Minimal & Clean Desktop**  
    Enjoy a distraction-free workspace with a sleek, modern look.

- **Custom Dotfiles**  
    All configuration files are organized for easy management and portability.

- **Optimized Performance**  
    Tweaked for fast boot times and low resource usage.

- **Tiling Window Manager**  
    Efficient workflow with keyboard-driven navigation.

- **Theming & Appearance**  
    Consistent Dracula color theme and fonts (I recommend Monolisa) across all applications.

- **Productivity Tools**  
    Pre-configured (kity) terminal, editor, and utilities for developers.

---

## 📦 Main Packages

This config is powered by the following key packages:

- **Hyprland** – Dynamic tiling Wayland compositor
- **Waybar** – Customizable status bar for Wayland
- **Kitty** – Fast, feature-rich GPU terminal emulator
- **Starship** – Minimal, customizable shell prompt
- **Dunst** – Lightweight notification daemon
- **Thunar** – Simple and fast file manager
- **Rofi** – Application launcher and window switcher
- **Neovim** – Modern, extensible text editor
- **PipeWire** – Audio and video server for Linux
- **NetworkManager** – Network configuration and management
- **Git** – Version control system

---

## 📸 Screenshots

### 1. Desktop Overview
![Desktop Overview](/examples/desktop.png)

### 2. Terminal Setup
![Terminal Setup](/examples/terminal.png)

### 3. Window Manager
![Window Manager](/examples/tyling.png)

### 4. Application Launcher
![Application Launcher](/examples/launcher.png)

---

## 📦 Installation

Clone this repository and follow this instructions to set up your environment.

```bash
git clone https://github.com/carlos-lorenzo/arch-config.git
cd arch-config
chmod chmod u+x set-hypr.sh
./set-hypr.sh
```

---
## ⌨️​ Keybinds

Here are the main keyboard shortcuts configured in this setup:

| Shortcut                | Action                                 |
|-------------------------|----------------------------------------|
| <kbd>SUPER</kbd> + <kbd>K</kbd>        | Open terminal (Kitty)                |
| <kbd>SUPER</kbd> + <kbd>Q</kbd>        | Close active window                  |
| <kbd>SUPER</kbd> + <kbd>L</kbd>        | Lock the screen                      |
| <kbd>SUPER</kbd> + <kbd>M</kbd>        | Show logout window                   |
| <kbd>SUPER</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd> | Exit Hyprland (force quit)           |
| <kbd>SUPER</kbd> + <kbd>E</kbd>        | Open file manager (Thunar)           |
| <kbd>SUPER</kbd> + <kbd>V</kbd>        | Toggle floating window               |
| <kbd>SUPER</kbd> + <kbd>Space</kbd>    | Launch app launcher (Wofi)           |
| <kbd>SUPER</kbd> + <kbd>P</kbd>        | Toggle pseudotiling (dwindle)        |
| <kbd>SUPER</kbd> + <kbd>J</kbd>        | Toggle split (dwindle)               |
| <kbd>SUPER</kbd> + <kbd>S</kbd>        | Screenshot selection                 |
| <kbd>ALT</kbd> + <kbd>V</kbd>          | Clipboard manager                    |
| <kbd>SUPER</kbd> + <kbd>W</kbd>        | Open VS Code                         |
| <kbd>SUPER</kbd> + <kbd>C</kbd>        | Open Chrome                          |
| <kbd>SUPER</kbd> + <kbd>O</kbd>        | Change wallpaper                     |
| <kbd>SUPER</kbd> + <kbd>Arrow Keys</kbd> | Move window focus                    |
| <kbd>SUPER</kbd> + <kbd>1-0</kbd>      | Switch workspace                     |
| <kbd>SUPER</kbd> + <kbd>Shift</kbd> + <kbd>1-0</kbd> | Move window to workspace             |
| <kbd>SUPER</kbd> + <kbd>Scroll</kbd>   | Cycle through workspaces             |
| <kbd>SUPER</kbd> + <kbd>Drag</kbd>     | Move/resize windows                  |

*`SUPER` is usually the <kbd>Windows</kbd> key.*

---
## 🙌 Contributing

Feel free to open issues or submit pull requests to improve this config!

---

## 📄 License

This project is licensed under the MIT License.

---

*Showcase your workflow and make Arch your own!*