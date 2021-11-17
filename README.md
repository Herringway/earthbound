# earthbound

This is a very WIP (Work-In-Progress) attempt by Herringway at decompiling Earthbound (Mother 2) and porting it. The project currently is **not** in a state that can produce a ROM.


### How to compile:

NOTE: THIS WILL NOT WORK AS THERE ISN'T ENOUGH CODE YET!!!

**Debian/Ubuntu and derivatives**:

```bash
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt install dub git
$ git clone https://github.com/Herringway/earthbound
$ cd earthbound
$ dub build
```

**Arch Linux using pacman**:

```bash
$ sudo pacman -Syu
$ sudo pacman -S dub git
$ git clone https://github.com/Herringway/earthbound
$ cd earthbound
$ dub build
```

**Fedora, openSUSE, and other distros that use zypper**:

```bash
$ sudo zypper refresh
$ sudo zypper update
$ sudo zypper in dub git
$ git clone https://github.com/Herringway/earthbound
$ cd earthbound
$ dub build
```
