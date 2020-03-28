### GETTING VARIABLES FROM .env

if test -f ".env"; then  
  set -o allexport
  source .env
  set +o allexport  
fi


### INSTALLING DEPENDENCIES
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


### SETTING UP SSH
echo root:$instancepw | chpasswd
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc

nohup /usr/sbin/sshd -D & 

sleep 10

### SETTING UP NGROK
nohup ./ngrok authtoken $authtoken && ./ngrok tcp 22 & 

sleep 10

### GETTING SSH COMMANDS
url=$(curl "http://localhost:4040/api/tunnels" | jq '.tunnels[0].public_url' | cut -d'"' -f2)
host=$(echo $url | sed 's\:[0-9].*\\g' | sed 's\tcp://\\g')
port=$(echo $url | sed 's\.*io:\\g')
echo "SSH command:"
echo "ssh -p${port} root@${host}"

echo "SSH command fith fwding"
fwdport=8898
echo "ssh -p${port} -L ${fwdport}:localhost:${fwdport} root@${host}"

### RUNNING JUPYTER LAB
echo "RUNNING JUPYTER LAB"

jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port=8898





