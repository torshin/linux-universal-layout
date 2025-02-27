
From: https://www.csslayer.info/wordpress/fcitx-dev/how-to-use-a-missing-keyboard-layout-in-fcitx-5/

# How to use a missing keyboard layout in Fcitx 5
Posted on March 12, 2021 by csslayer	

When Fcitx read the layout information, it read from xkeyboard-config, mostly like to be /usr/share/X11/xkb/rules/evdev.xml on your system. But unfortunately, there might be missing data in this file and you should report the bug to bugs.freedesktop.org for missing data.

But what if you want to use the layout right now without waiting for the bugfix for xkeyboard-config?

Here’s an easy way to do it at user level.

For example, if you use setxkbmap -layout br -variant abnt2 to setup your keyboard input method, but you find this entry is not currently in evdev.xml files, then you can do:

1. Create a configuration for input method
Pleasse notice, the file name matters, it should be named by keyboard-[layout]-[variant].conf
The file name for this layout should be ~/.local/share/fcitx5/inputmethod/keyboard-br-abnt2.conf

[InputMethod]
Name=br-abnt2
Icon=input-keyboard
LangCode=pt_BR
Addon=keyboard
Configurable=True
Label=br

The “Name=” section in the file doesn’t really matter, you can put anything meaningful to you. LangCode= and Label= also doesn’t really matter.

2. Restart fcitx 5 to make it reload the data.

3. Open config tool to add it to the list.

4. Move it to the first place in the list, and you will get a popup that ask you: whether you want to fix the config to make the system layout configuration matches the first input method. You may click yes to set it. Because evdev.xml does not have the corresponding entry, you’ll not be able configure the system layout the regular way.

Then you should be able to use the layout just like using the setxkbmap command, enjoy!
