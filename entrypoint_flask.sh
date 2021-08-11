#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.
set -euo pipefail
conda activate test_flask
exec gunicorn --bind=0.0.0.0:9998 serve:app --reload