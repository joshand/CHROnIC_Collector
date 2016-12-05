__author__ = 'Josh Anderson'
__email__ = 'joshand@cisco.com'

from flask import Flask
import subprocess

app = Flask(__name__)

@app.route('/')
def hello():
    return "Healthy"

@app.route('/restart')
def restart():
    subprocess.Popen(["python3", "-u", "/root/app.py"])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5005, debug=True)
