
function load_dotenv {
    if test -f ".env"; then
      set -o allexport
      source .env
      set +o allexport
    fi
}

function install_dependencies {
    apt-get install jq
    apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null
    wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    unzip -qq -n ngrok-stable-linux-amd64.zi
}

function setup_ssh {
    echo root:$instancepw | chpasswd
    mkdir -p /var/run/sshd
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
    echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
    echo "export LD_LIBRARY_PATH" >> /root/.bashrc
    nohup /usr/sbin/sshd -D > sshd_log.out &
}

function start_ngrok {
    nohup ./ngrok authtoken $authtoken && ./ngrok tcp 22 > ngrok_log.out &
}

function print_ssh_commands {
    url=$(curl "http://localhost:4040/api/tunnels" | jq '.tunnels[0].public_url' | cut -d'"' -f2)
    host=$(echo $url | sed 's\:[0-9].*\\g' | sed 's\tcp://\\g')
    port=$(echo $url | sed 's\.*io:\\g')
    echo "SSH command:"
    echo "ssh -p${port} root@${host}"
    echo "SSH command with fwding"
    fwdport=8898
    echo "ssh -p${port} -L ${fwdport}:localhost:${fwdport} root@${host}"
}

load_dotenv
install_dependencies
setup_ssh
start_ngrok
print_ssh_commands

bash $1


