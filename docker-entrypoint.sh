#!/usr/bin/env bash

exec gunicorn -b 0.0.0.0:8000 twentyonegists.wsgi:application 
