# save this as app.py, more testing
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!"