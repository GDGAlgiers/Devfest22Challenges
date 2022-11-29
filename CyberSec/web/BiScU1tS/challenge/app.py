from flask import Flask, render_template, request, make_response, send_file
from hashlib import md5
from base64 import b64encode

app = Flask(__name__)
"e3VzZXI6YWRtaW4sbWQ1KHVzZXIpOjIxMjMyZjI5N2E1N2E1YTc0Mzg5NGEwZTRhODAxZmMzfQ=="


@app.route("/")
def index():
    cookie = request.cookies.get("user")
    if (
        cookie
        == b64encode(
            b"{user:admin,md5(user):" + md5(b"admin").hexdigest().encode() + b"}"
        ).decode()
    ):
        return send_file("flag.txt")
    response = make_response(render_template("index.html"))
    response.set_cookie(
        "user",
        b64encode(
            b"{user:guest,md5(user):" + md5(b"guest").hexdigest().encode() + b"}"
        ),
    )
    return response
