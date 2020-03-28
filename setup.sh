if test -f ".env"; then  
  set -o allexport
  source .env
  set +o allexport  
fi
echo $authtoken
apt-get install jq
wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -qq -n ngrok-stable-linux-amd64.zip
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null

echo root:$instancepw | chpasswd
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc

/usr/sbin/sshd -D & 
./ngrok authtoken $authtoken && ./ngrok tcp 22 &

echo "this finished holla"
url=$(curl "http://localhost:4040/api/tunnels" | jq '.tunnels[0].public_url' | cut -d'"' -f2)
host= $(echo $t | sed 's\:[0-9].*\\g' | sed 's\tcp://\\g')
port= $(echo $url | sed 's\.*io:\\g')
echo "SSH command:"
echo "ssh -p${port} root@${host}"
python3 -m pip install jupyterlab
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y nodejs
