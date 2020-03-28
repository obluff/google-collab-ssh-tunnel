## Google Collab SSH Tunnel Bootstrap
- Run this script and enjoy a free GPU/High Memory machine courtesy of Google.
- Adapted from this [stackoverflow answer](https://stackoverflow.com/questions/48459804/how-can-i-ssh-to-google-colaboratory-vm/53252985#53252985)
  - Which was adapted from this [gist](https://gist.github.com/creotiv/d091515703672ec0bf1a6271336806f0)

## USAGE::
- Create file `.env` file with the following fields and upload it to your collab notebook:
  - `authtoken`
    - Your NGROK auth token 
  - `instancepw`
    - SSH password you use for your instance
- run ```!bash bootup.sh```
- Take the SSH commands outputted from the cell and forward in 
- SSH into the machine (or use the jupyter lab instance that runs in the code)





