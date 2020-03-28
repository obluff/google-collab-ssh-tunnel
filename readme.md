## Google Collab SSH Tunnel Bootstrap
- run this script and enjoy a free GPU / high memory machine courtesy of google 
- adapted from this stackoverflow code
  - https://stackoverflow.com/questions/48459804/how-can-i-ssh-to-google-colaboratory-vm/53252985#53252985

## USAGE::
- create file `.env` file with the following fields:
  - `authtoken`
    - your NGROK auth token 
  - instancepw
    - ssh password you use for your instance
- upload that to your collab notebook
  - **TODO** add snippits to do this
    - google drive method
    - files.upload method
- run ```!bash bootstrap.sh```




