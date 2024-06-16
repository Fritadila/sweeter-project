set -eu

export PYTHONUNBUFFERED=true

VIRTUALENV=.data/venv

if [ ! -d $VIRTUALENV ]; then
  python3 -m venv $VIRTUALENV
fi

if [ ! -f $VIRTUALENV/bin/pip ]; then
  curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | $VIRTUALENV/bin/python
fi

# Print debug information
echo "Python interpreter path: $VIRTUALENV/bin/python3"
ls -l $VIRTUALENV/bin/python3  # Check if the interpreter exists

# Install dependencies
$VIRTUALENV/bin/pip install -r requirements.txt

# Run the application
$VIRTUALENV/bin/python3 app.py
