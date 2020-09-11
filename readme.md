## Easy Google Collab SSH Tunnel 
- Run this script and enjoy a free GPU/High Memory machine courtesy of Google.
- Adapted from this [stackoverflow answer](https://stackoverflow.com/questions/48459804/how-can-i-ssh-to-google-colaboratory-vm/53252985#53252985) which was adapted from this [gist](https://gist.github.com/creotiv/d091515703672ec0bf1a6271336806f0)
- This is useful if:
  - You want a Free GPU
  - You want a more robust dev env than the collab notebooks. (i use this to run juptyer lab instances)
  - You have low memory on your computer so even running Google Collab in browser is very slow.
  
## Usage:
- Create an [NGROK](http://ngrok.com) account 
- Create file `.env` file with the following fields and upload it to your collab notebook:
```
authtoken=NGROK AUTH TOKEN
instancepw=SSH INSTANCE PASSWORD
```
### Launching an Instance 
- Open up a collab notebook and clone this repository
- To launch an SSH instance
   - run ```!bash bootup.sh```
- To launch an SSH instance with a bootstrap script.
   - run ```!bash bootup.sh [PATH TO BOOTSTRAP SCRIPT]```
- Use ssh commands outputted in the collab notebook cell.


## TODO:
- Add support for using google drive file system. 
- Add bootstrap for Spark dev
- Look into ways to mitigate collab notebook shutdown
- Add example collab notebook

