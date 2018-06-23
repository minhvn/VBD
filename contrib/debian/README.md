
Debian
====================
This directory contains files used to package dashd/idf-qt
for Debian-based Linux systems. If you compile dashd/idf-qt yourself, there are some useful files here.

## dash: URI support ##


idf-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install idf-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your idf-qt binary to `/usr/bin`
and the `../../share/pixmaps/dash128.png` to `/usr/share/pixmaps`

idf-qt.protocol (KDE)

