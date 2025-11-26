#!/bin/bash
echo "Starting Jewel: AI-Powered Web Scraper..."

# Railway sets $PORT environment variable automatically
UI_PORT=${PORT:-4000}  # Use Railway's PORT or default to 4000
UI_HOST="0.0.0.0"

# Check if we should run UI or main.py
if [ "$1" = "ui" ] || [ -z "$1" ]; then
    echo "Starting Streamlit UI on ${UI_HOST}:${UI_PORT}"
    exec streamlit run ui.py --server.port=${UI_PORT} --server.address=${UI_HOST}
else
    echo "Running main.py with arguments: $@"
    exec python main.py "$@"
fi  