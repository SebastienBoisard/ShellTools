#!/bin/bash
#title           :python_notebook.sh
#description     :python_notebook activates the right Anaconda Python environment (Python 2 or Python 3) and 
#                 starts the Jupyter notebook with the visible ip address (to use the notebook from outside a VM).
#author		 :Sébastien Boisard
#date            :2016.11.01
#version         :0.1    
#usage		 :bash python_notebook.sh
#bash_version    :4.3.30(1)-release
#==============================================================================

# Get the visible ip address
IP_ADDRESS=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`

# Ask if the notebook has to use the Python 2 kernel (no is the default answer)
read -p "Want to use Python2? (y/[n]) " -n 1 -r

# Move to a new line
echo

# Test the answer ('=~' allows the use of regex in an if statement)
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Activate Python 2 environment
    source activate env_python2
    echo "   => Python 2 environement activated"
else 
    # Python 3 is the default envionment so nothing to activate
    echo "   => Python 3 environement activated"
fi

# Add a new line
echo

# Launch Jupyter
jupyter notebook --ip=$IP_ADDRESS --no-browser


# Deactivation Python 2 environment
source deactivate env_python2
