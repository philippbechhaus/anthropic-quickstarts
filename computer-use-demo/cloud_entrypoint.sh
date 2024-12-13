#!/bin/bash
set -e

# Add password protection to VNC
x11vnc -storepasswd "$NOVNC_PASSWORD" /etc/x11vnc.pass

# Modified startup with security
./start_all.sh
./novnc_startup.sh -sslOnly

# Start Streamlit with authentication
export STREAMLIT_AUTH_ENABLED=true
python -m streamlit run computer_use_demo/streamlit.py

# Monitor processes
supervisord -c /etc/supervisor/conf.d/supervisord.conf 