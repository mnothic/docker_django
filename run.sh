#!/usr/bin/env bash

cd $APP_DIR
gunicorn -b 0.0.0.0:8000 --pythonpath 'twentyonegists' twentyonegists.wsgi:application