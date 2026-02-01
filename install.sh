#!/bin/sh

if ! getent group slock >/dev/null 2>&1; then
    echo "Creating slock group..."
    groupadd -r slock
fi

if ! getent passwd slock >/dev/null 2>&1; then
    echo "Creating slock user..."
    useradd -r -g slock -d /nonexistent -s /usr/sbin/nologin slock
fi

gpasswd -a slock shadow

make clean
make
make install

echo "slock installed successfully"
