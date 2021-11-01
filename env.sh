#!/bin/sh

set -e

venv_location=${HOME}"/.venv/gazula-env"
pip_executable="${venv_location}""/bin/pip"
ansible_playbook_executable="${venv_location}""/bin/ansible-playbook"

# Exit if python3 does not exist.
if ! type "python3" > /dev/null; then
    echo "python3 not found. Exiting..."
    exit 1
fi

# Create the virtual environment used by this repo, if needed.
if [ ! -x "${venv_location}""/" ]; then
    echo "Creating python virtual environment in ""${venv_location}"
    python3 -m venv "${venv_location}"
fi

# Install all required packages, if needed.
if "${pip_executable}" freeze -r requirements.txt 2>&1 | grep -q "not installed"; then
    echo "Installing required python packages in virtual environment"
    "${pip_executable}" install -r requirements.txt
fi

# Finally, time to run the playbook.
"${ansible_playbook_executable}" --ask-become-pass -i inventory env.yml