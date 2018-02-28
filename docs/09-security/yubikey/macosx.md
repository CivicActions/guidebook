# YubiKey Support for macOS

This is the macOS specific documentation for [YubiKey](README.md).

## Setup

The following link describes setting up your Yubikey on macOS, as well as a second factor for machine login and creating a GPG key (for encrypting files or signing things like GitHub commits). 

[https://github.com/jeffmaher/yubikey-macos-setup/blob/master/README.md](https://github.com/jeffmaher/yubikey-macos-setup/blob/master/README.md)

## Away detection ideas

Exceptions to the "idle timeout lock" can be made if you are on your home network and feel that it is secure. Adapt the below script if you only want to lock your screen when you are away from home.

Assuming `~/bin/` is in your `$PATH`, and you want to see if a file is on a Windows server, create executable file `~/bin/out-lock`:

```
#!/bin/sh
MOUNT="$HOME/mountain"
# Checks if server is mounted.
if [ ! -d "$MOUNT" ]
then
  SERVER_IP="192.168.1.1"
  SHARE_NAME="share"
  USERNAME="admin"
  PASSWORD="password"
  FILE="home.txt"
  mount_smbfs //$USERNAME:$PASSWORD@$SERVER_IP/$SHARE_NAME $MOUNT
fi
contents=$(cat $MOUNT/$FILE)
hash=`echo -n $contents | shasum -a 256`
cuthash=`echo $hash | cut -c1-64`
if [ "$cuthash" != "7147a8f255f49cb7693dcd19b6b46e139680d48a03e0a075ea237deb7e6bacc9" ]
then
  # Lock Screen
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
fi
```

The "cron" or launchctl file located at $HOME/Library/LaunchAgents/com.dan.outlock.plist might look like this to run every 15 minutes:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.dan.outlock</string>

  <key>ProgramArguments</key>
  <array>
    <string>/bin/out-lock</string>
  </array>

  <key>Nice</key>
  <integer>1</integer>

  <key>StartInterval</key>
  <integer>900</integer>

  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

## YubiKey removal lock

*tbd...*
