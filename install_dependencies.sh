## installing jq to parse json
apt-get install jq

## installing openssh
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null

## installing ngrok
wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -qq -n ngrok-stable-linux-amd64.zip

## installing nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y nodejs

## installing jupyterlab and vim extension
python3 -m pip install jupyterlab==1.2.4
jupyter labextension install jupyterlab_vim




