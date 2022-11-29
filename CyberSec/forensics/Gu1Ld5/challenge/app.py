from flask import Flask, render_template, send_file

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/bot.js")
def bot():
    return send_file("bot.js")

@app.route("/robots.txt")
def robots():
    return send_file("robots.txt")