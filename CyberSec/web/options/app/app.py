from flask import Flask, render_template, request

app = Flask(__name__)

# Routes

@app.route("/", methods=["GET", "OPTIONS"])
def index():
    if request.method == "GET":
        return render_template("index.html")
    if request.method == "OPTIONS":
        return render_template("options.html")

@app.route("/pizza", methods=["GET"])
def pizza():
    return render_template("pizza.html")

@app.route("/cheeseburger", methods=["GET"])
def cheeseburger():
    return render_template("cheeseburger.html")

@app.route("/frenchfries", methods=["GET"])
def frenchfries():
    return render_template("frenchfries.html")

@app.route("/tacos", methods=["GET"])
def tacos():
    return render_template("tacos.html")

@app.route("/karantika", methods=["GET"])
def karantika():
    return {"URL": "https://dpaste.org/pZATZ/raw"}

# Error handlers

@app.errorhandler(404)
def not_found(e):
    return render_template("404.html"), 404

@app.errorhandler(500)
def server_error(e):
    return render_template("500.html"), 500