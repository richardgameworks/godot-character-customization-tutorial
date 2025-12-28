# 🎮 Godot 2D Character Creator Tutorial

Source code repository for the Richard Gameworks YouTube tutorial series on building a fully modular, pixel art Character Creator using the Godot game engine.

**Godot Engine • GDScript • License**

---

## 📺 About This Tutorial

This repository contains the complete source code for a dynamic 2D Character Creation tool built with **Godot Engine 4.5** and **GDScript**. Perfect for learning game development concepts like scene management, dynamic resource loading, signal-based architecture, and character animation systems!

🎥 **Watch the full tutorial series on [Richard Gameworks YouTube Channel](https://www.youtube.com/playlist?list=PLfLRcdsmWP2T0F2lNNyboAHUh3nt6YU4T)**

---

## ✨ Features

### 🎨 Character Customization
- **Hair Color**: Full color picker with unlimited color options
- **Skin Tones**: 10 diverse skin tone options (porcelain, fair, light, beige, olive, tan, medium, bronze, brown, dark)
- **Armor Types**: 3 different armor styles (cloth, leather armor, full armor)
- **Weapons**: 3 weapon choices (stick, sword, golden sword)
- **Character Name**: Customizable name displayed above the character

### 🎲 Smart Features
- **Randomize Button**: Instantly generate random character combinations
- **Save/Load System**: Persist your character designs with JSON file storage
- **Real-time Preview**: See changes instantly as you customize
- **Interactive Character**: Move your character around with WASD/Arrow keys to see animations in action
- **Directional Animations**: Character displays idle and run animations in 4 directions (up, down, left, right)

### 🏗️ Technical Highlights
- **Modular Architecture**: Clean separation of concerns with dedicated panel components
- **Signal-Based Communication**: Event-driven design for responsive UI updates
- **Dynamic Resource Loading**: Runtime texture swapping for character parts (armor, weapons)
- **Color Modulation**: Real-time color changes for hair and skin tones
- **AnimatedSprite2D System**: Multi-layered sprite system with synchronized animations
- **Custom UI Styling**: Beautiful themed interface with custom panel styles
- **Global Singleton**: Centralized data management for shared resources

---

## 🚀 Quick Start

### Prerequisites
- **Godot Engine 4.5** or later ([Download here](https://godotengine.org/download))
- Basic familiarity with Godot (optional, tutorial covers everything!)

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/richardgameworks/godot-character-customization-tutorial.git
   ```

2. **Open in Godot**
   - Launch Godot Engine
   - Click "Import" and select the project folder
   - Click "Import & Edit"

3. **Run the project**
   - Press `F5` or click the "Play" button
   - The character creator will launch in a new window
   - Use **WASD** or **Arrow Keys** to move your character around

---

## 📁 Project Structure

```
godot-character-customization-tutorial/
├── assets/
│   ├── spritesheets/player/     # Character sprite assets
│   │   ├── armor/               # Armor variants (cloth, leather_armor, armor)
│   │   ├── body/                # Body sprites
│   │   ├── eyes/                # Eye sprites
│   │   ├── hair/                # Hair sprites
│   │   ├── head/                # Head sprites
│   │   └── weapon/              # Weapon variants (stick, sword, golden_sword)
│   ├── sprite_frames/           # SpriteFrame resources
│   ├── fonts/                   # Custom fonts
│   └── styles/                  # UI styling resources
├── main/
│   ├── main.gd                  # Main scene controller
│   ├── main.tscn                # Main scene
│   ├── player/
│   │   ├── player.gd            # Player character logic
│   │   └── player.tscn          # Player scene
│   └── interface/
│       ├── hair_color_panel/    # Hair color customization
│       ├── skin_tone_panel/     # Skin tone selection
│       ├── selection_panel/     # Reusable selection UI (armor/weapon)
│       ├── name_panel/          # Character name input
│       └── save_load_panel/     # Save/load functionality
├── global.gd                    # Global singleton (skin tones data)
└── character_save.json          # Character save file
```

---

## 🎯 What You'll Learn

This tutorial covers essential game development concepts:

### Core Godot Concepts
- **Scene Management**: Parent-child relationships and scene instancing
- **Node Architecture**: Understanding Godot's node-based system
- **Resource Management**: Loading and swapping textures at runtime
- **AnimatedSprite2D**: Multi-layered animated sprite systems
- **Input Handling**: Button interactions, keyboard input, and character movement
- **Color Modulation**: Dynamic color changes for visual customization

### GDScript Programming
- **Class-based Design**: Creating reusable, modular components with `class_name`
- **Signal System**: Event-driven programming with custom signals
- **Data Structures**: Working with Dictionaries and Arrays
- **File I/O**: Saving and loading character data with JSON
- **Singleton Pattern**: Global autoload scripts for shared data
- **Export Variables**: Configuring components in the editor

### UI/UX Development
- **Control Nodes**: Building responsive interfaces with PanelContainer, VBoxContainer, etc.
- **Custom Styling**: Creating beautiful themes and styles
- **Layout Management**: Container nodes and responsive design
- **User Experience**: Intuitive character creation workflows
- **Dynamic UI Generation**: Creating UI elements programmatically

### Character Animation
- **Directional Animations**: Handling 4-directional movement (up, down, left, right)
- **Animation States**: Switching between idle and run animations
- **Sprite Synchronization**: Keeping multiple sprite layers in sync
- **Frame Management**: Preserving animation state during texture swaps

---

## 🎮 Controls

- **WASD** or **Arrow Keys**: Move character around
- **Mouse**: Interact with UI panels
- **Color Picker**: Select any color for hair
- **Skin Tone Buttons**: Click to change skin tone
- **Arrow Buttons**: Navigate through armor and weapon options
- **Randomize Button**: Generate random character
- **Save/Load Buttons**: Persist your character design

---

## 💾 Save System

Character data is saved to `character_save.json` in the project root. The save file includes:
- Character name
- Hair color (as hex string)
- Skin tone
- Selected armor
- Selected weapon

The character automatically loads on startup if a save file exists.

---

## 📚 Additional Resources

- [Godot Documentation](https://docs.godotengine.org/): Official Godot learning resources
- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html): Complete GDScript language guide
- [Godot Community](https://godotengine.org/community): Connect with other Godot developers

---

## 🎨 Assets

The character sprites used in this tutorial are a modified version of the free [Swordsman 1–3 Level Pixel Top-Down Sprite Character Pack](https://craftpix.net/freebies/free-swordsman-1-3-level-pixel-top-down-sprite-character-pack/) from **CraftPix.Net**. The original assets have been adapted and restructured to work with the modular character customization system demonstrated in this tutorial.

---

## 🙏 Acknowledgments

- **Godot Engine Team** for creating an amazing game engine
- **CraftPix.Net** for providing the free character sprite assets
- **Community Contributors** who help improve this tutorial

---

## ⭐ Support

If you found this tutorial helpful, please give it a **star**! ⭐

🎥 **Watch on YouTube** • 📖 **Read the Docs** • 💬 **Join the Community**

---

**Made by Richard Gameworks**

