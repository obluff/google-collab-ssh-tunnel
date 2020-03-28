if test -f ".env"; then  
  set -o allexport
  source .env
  set +o allexport  
fi
echo $authtoken
./ngrok authtoken $authtoken && ./ngrok tcp 22 & 
