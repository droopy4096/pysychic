#!/bin/env python

from flask import Flask
from flask import request, abort
import subprocess
from urllib.parse import urlparse

app = Flask(__name__)

def is_safe_url(target):
    test_url = urlparse(target)
    return test_url.scheme in ('http', 'https')

@app.errorhandler(400)
def nope(error):
    return "Nope {}".format(error), 400


@app.route("/")
def hello_world():
    url= request.args.get("q","https://duckduckgo.com")
    if is_safe_url(url):
        print("{}".format(url))
        subprocess.call(["xdg-open", url])
        return "Yessir"
    else:
        abort(400)
