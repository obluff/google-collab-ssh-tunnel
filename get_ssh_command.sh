url=$(curl "http://localhost:4040/api/tunnels" | jq '.tunnels[0].public_url' | cut -d'"' -f2)
host=$(echo $url | sed 's\:[0-9].*\\g' | sed 's\tcp://\\g')
port=$(echo $url | sed 's\.*io:\\g')
echo "SSH command:"
echo "ssh -p${port} root@${host}"

echo "SSH command fith fwding"
fwdport=8898
echo "ssh -p${port} -L ${fwdport}:localhost:${fwdport} root@${host}"

