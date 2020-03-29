## Google Collab SSH Tunnel Bootstrap + Jupyter Lab Launch
- Run this script and enjoy a free GPU/High Memory machine courtesy of Google.
- Adapted from this [stackoverflow answer](https://stackoverflow.com/questions/48459804/how-can-i-ssh-to-google-colaboratory-vm/53252985#53252985) which was adapted from this [gist](https://gist.github.com/creotiv/d091515703672ec0bf1a6271336806f0)
- This is useful if:
  - You want a more robust dev env then just the jupyter lab notebooks. (i use this to run juptyer lab instances)
  - You have low memory on your computer so even running Google Collab in browser is very slow.
  

## Usage:
- Create an [NGROK](http://ngrok.com) account 
- Create file `.env` file with the following fields and upload it to your collab notebook:
  - `authtoken`
    - Your NGROK auth token 
  - `instancepw`
    - SSH password you use for your instance
### Launching an Instance 
- run ```!bash bootup.sh```
- Use ssh commands outputted in the collab notebook cell.
### Launching an Instance with bootstrap script
- run ```!bash bootup.sh [PATH TO BOOTSTRAP SCRIPT]```
- Use ssh command outputted in the collab notebook cell. 

## TODO:
- Add support for using google drive file system. 
- Add bootstrap for Spark dev
- Look into ways to mitigate collab notebook shutdown


