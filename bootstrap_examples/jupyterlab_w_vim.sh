## installing nodejs (dependency for juptyerlab extension)
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y nodejs

## installing jupyterlab and vim extension
python3 -m pip install jupyterlab==1.2.4
jupyter labextension install jupyterlab_vim

### RUNNING JUPYTER LAB
echo "RUNNING JUPYTER LAB"
jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port=8898


