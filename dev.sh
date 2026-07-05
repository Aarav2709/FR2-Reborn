#!/usr/bin/env bash

cat << EOF
   _             _       _          
  /_\  _ __  ___| |_ _ _(_)_ _  ___ 
 / _ \| '  \/ -_)  _| '_| | ' \/ -_)
/_/ \_\_|_|_\___|\__|_| |_|_||_\___|
                                    
EOF

# Load .env, it's annoying to do by hand
set -a && source .env && set +a

if command -v flatpak >/dev/null 2>&1 && flatpak info org.getzola.zola >/dev/null 2>&1; then
  exec flatpak run org.getzola.zola "$@"
elif command -v zola >/dev/null 2>&1; then
  exec zola "$@"
else
  exit 1
fi
