<!-- vim-markdown-toc GFM -->

* [Overview](#overview)
    * [Requirement](#requirement)
        * [M4Pro](#m4pro)
        * [M4](#m4)
* [M4Pro](#m4pro-1)
    * [Accessories](#accessories)
    * [Gaming](#gaming)
        * [Wine](#wine)
        * [Whisky (Wine wrapper for macOS)](#whisky-wine-wrapper-for-macos)
        * [portingkit](#portingkit)
        * [Kegworks (previously wineskin?)](#kegworks-previously-wineskin)
        * [CrossOver](#crossover)
    * [Coding](#coding)
    * [Utilities](#utilities)
* [M4](#m4-1)
    * [Accessories](#accessories-1)
    * [NAS](#nas)
* [Note](#note)
    * [Graphical API](#graphical-api)
    * [Translation Layers](#translation-layers)
        * [Windows dll to Linux/macOS](#windows-dll-to-linuxmacos)
        * [Linux to Linux](#linux-to-linux)
        * [CPU Architecture](#cpu-architecture)
        * [Graphical API](#graphical-api-1)
    * [Misc](#misc)

<!-- vim-markdown-toc -->

# Overview

My plan to transfer daily work and gaming pc from windows to mac mini M4.
Plan to buy two minis, one is M4Pro with upgraded cpu/gpu and 48GB RAM, 1999USD or 67900NTD.
Another is basic M4 mini witout any upgarde, 199USD or 19999NTD   
M4Pro will be used daily and M4 will be setup as homelab.  

- M4Pro: upgrade M4Pro, 48GB RAM, keep 512GB SSD
- M4: basic

## Requirement

### M4Pro

- daily normal use, surfing, shopping...
- coding, terminal and VSCode
- gaming, games all came from Steam. 

### M4

- NAS
- cloud AI computing
- ...???

# M4Pro

## Accessories

- Hub : taobao, UGREEN
- SSD : WDSN580X 2TB black 4530NTD, <a href="https://www.momoshop.com.tw/goods/GoodsDetail.jsp?i_code=10452240" target="_blank">momo product link</a>
- SSD disk box, taobao UGREEN

<a href="https://www.reddit.com/r/macmini/comments/1gj3ies/you_can_buy_the_mac_mini_with_the_smallest/" target="_blank">able to directly install apps on mac at macOS15</a>

## Gaming

### Wine

- <a href="https://github.com/Gcenx/macOS_Wine_builds" target="_blank">github</a>

### Whisky (Wine wrapper for macOS)

- Free and open source, but support less apps and may not be updated to Wine 
- <a href="https://github.com/Whisky-App/Whisky" target="_blank">github</a>
- <a href="https://docs.getwhisky.app/" target="_blank">Whisky wiki</a>
- <a href="https://www.reddit.com/r/macgaming/comments/1glc0m7/how_to_downgrade_steam_inside_of_whisky_to_get/" target="_blank">downgrade steam version in Whisky</a>

### portingkit

- <a href="https://www.portingkit.com/benefits" target="_blank">main page</a>

### Kegworks (previously wineskin?)

- <a href="https://github.com/Kegworks-App?view_as=public" target="_blank">github</a>

### CrossOver

- <a href="https://www.codeweavers.com/store" target="_blank">store page</a>
- 74 USD per month, 494 USD lifetime
- After one year time window, the app can still work but cannot receive further update
- renew at a lower price

## Coding

- Vim, macVim
- VSCode
- terminal : <a href="https://sw.kovidgoyal.net/kitty/" target="_blank">kitty</a>
- shell : zsh
- window manager : tmux
- package manager : brew
- python package manager : uv

## Utilities

- downloader : yt-dlp, <a href="https://github.com/yt-dlp/yt-dlp" target="_blank">github</a>
- screen shot : 
- video player : IINA
- file manager
- browser : chrome
- file sync : syncthing

# M4

## Accessories

- HDD : WD40EZAX blue 2990NTD, <a href="https://www.momoshop.com.tw/goods/GoodsDetail.jsp?i_code=13357989" target="_blank">momo product link</a>
- HDD external box : taobao UGREEN

## NAS

# Note

didn't expect these terms would get so confusing

## Graphical API

- API between game and hardware
- DirectX 11/12/10..., developed by Microsoft
- OpenGL, Open Graphics Library, replaced by Vulkan
- Vulkan, developed by AMD and others
- Metal, developed by Apple

## Translation Layers

- Summary: 
    - x86 -> Arm (Rosetta 2)
    - Windows dll (Wine and others based on Wine)
- Graphic summary: 
    - CrossOver: Direct3D ->(DXVK/VKD3D) Vulkan ->(MoltenVK) Metal
    - GPTK: Direct3D ->(D3DMetal) Metal 
    - latest CrossOver can use D3DMetal now

### Windows dll to Linux/macOS

- Wine: Windows API translation layer
- GPTK (Game Porting Toolkit)
    - translate in real time
    - GPTK combines Wine with Apple's D3DMetal which supports DirectX 11 and 12 
- Proton: based on Wine. Translate Windows API calls to Linux, but Proton also combined DXVK and others
- CrossOver
    - pre-translate?
    - not support DX12?

### Linux to Linux 

- Steam Linux runtime: make sure native linux games compatible on different distributions of Linux
- luxtorpeda: like steam linux runtime

### CPU Architecture

- box86: ARM to x86
- Rosetta 2 : x86 to ARM by apple

### Graphical API

- DXVK: DX to Vulkan, use Vulkan to simulate Direct3D
- VKD3D: same as DXVK
- MoltenVK: Vulkan to Metal, used by CrossOver

## Misc

- Winetricks
    - setup Wine
