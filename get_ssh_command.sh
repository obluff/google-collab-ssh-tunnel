url=$(curl "http://localhost:4040/api/tunnels" | jq '.tunnels[0].public_url' | cut -d'"' -f2)
host= $(echo $t | sed 's\:[0-9].*\\g' | sed 's\tcp://\\g')
port= $(echo $url | sed 's\.*io:\\g')
echo "SSH command:"
echo "ssh -p${port} root@${host}"

echo "SSH command fith fwding"
port=8898
echo "ssh -p${port} -L ${port}:localhost:${port} root@${host}"

