---
title: Securing Your Workspace
---

Notes on securing your workspace (linux, Mac or Windows) for various platforms and applications.

## Introduction

## High Level Security Guidelines

-   Screen lock
-   Strong password
-   Disk encryption
-   Separate browser profile for work
-   No smart devices that are always listening

### Mac

### Windows

### Linux

#### Screen lock when idle or lid closed (X server)

After a period of inactivity and (for laptops) when you close the lid, the screen must blank (or be replaced with a background image).

##### Screen lock with xss-lock

This uses [xss-lock](http://manpages.ubuntu.com/manpages/xenial/man1/xss-lock.1.html) (the brains behind the venerable xscreensaver function) and [i3lock](http://i3wm.org/i3lock/) as the screen locker, but you can substitute this with another locker such as [xsecurelock](https://github.com/google/xsecurelock). xss-lock subscribes to the systemd-events `suspend`, `hibernate`, `lock-session`, and `unlock-session` with appropriate actions (run locker and wait for user to unlock or kill locker). xss-lock also reacts to DPMS events and runs or kills the locker in response. (See also: [Power Management with xss-lock](https://wiki.archlinux.org/index.php/Power_management#xss-lock))

If your system is already set up to sleep after a timeout and suspend when you close the lid, this may be all you need.

Start xss-lock when you start your window manager, passing it the name of the screen locker you want to use. So you could put this in your ~/.xinitrc file:

```bash
xss-lock -- i3lock -n -c 000000
```

Or if running the i3 windor manager, put this in your ~/.i3/config file:

```bash
exec --no-startup-id xss-lock -- i3lock -n -c 000000
```

##### Screen lock with xautolock

This uses [xsecurelock](https://github.com/google/xsecurelock) (recommended screen lock) together with [xautolock](https://linux.die.net/man/1/xautolock) (simple away command runner tool) to lock the screen after 10 minutes when away from home network. It also suspends after 30 mins, adds a hot corner to block locking (useful if watching a video, for example) and adds a notification (using `dunst` and `notify-send`) before locking. Note that pretty much all of these pieces are optional (you could use `gnome-screensaver` or `xscreensaver` for away detection for instance), but using `xsecurelock` for locking is strongly recommended since other lock screens have had vulnerabilities.

Install packages as needed (`dunst` and `libnotify` optional -- you may already have a notification system):

###### Arch xautolock setup

```bash
pacaur -S xsecurelock-git xautolock dunst libnotify
```

Next make sure dunst (if using for notifications) and xautolock (if using) are started on X login.
For example, you can adapt the following to start when your window manager starts, e.g., add to `~/.xinitrc`:

```bash
dunst &
xautolock -time 10 -corners -000 -locker "/usr/bin/xsecurelock auth_pam_x11 saver_blank" -killtime 30 -killer "systemctl suspend" -notify 30 -notifier "notify-send -- 'Locking screen in 30 seconds'" &
```

##### Away detection ideas

Exceptions to the "idle timeout lock" can be made if you are on your home network and feel that it is secure. Adapt the below script if you only want to lock your screen when you are away from home.

Assuming `~/bin/` is in your `$PATH`, create executable file `~/bin/out-lock` and replace `xsecurelock` or `i3lock` above with `~/bin/out-lock`:

```bash
#!/bin/sh
# Not home (you will need to adjust to some reliable/secure test for your home network)
# In this case, an internal NAT addressable file home.txt has the given sha256sum value
# if ! curl -s "http://192.168.1.99/home.txt" | sha256sum | grep 6094dd1d56b9d8638bc0e8e630683787151b81320d81568d97ec8daecb370bca > /dev/null; then
# Less secure, but likely good enough for most cases, check the MAC address of your router
if ! arp 192.168.1.1 | grep 48:5d:36:4c:d5:51 &> /dev/null; then
  # Not already locked.
  if ! pidof xsecurelock > /dev/null; then
    # Lock screen.
    /usr/bin/xsecurelock auth_pam_x11 saver_blank
  fi
fi
```
