#!/bin/sh

set -o errexit
set -o nounset

python manage.py compilemessages
exec gunicorn base.wsgi --bind 0.0.0.0:8000 --max-requests=10000 --max-requests-jitter=400 --workers=2 --timeout=60 --reload
