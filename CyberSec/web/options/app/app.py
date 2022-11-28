from flask import Flask, render_template, request, make_response

app = Flask(__name__)

# Routes

@app.route("/", methods=["GET", "OPTIONS"])
def index():
    if request.method == "GET":
        resp = make_response(render_template("index.html"))
        resp.set_cookie("21232f297a57a5a743894a0e4a801fc3", "68934a3e9455fa72420237eb05902327")
        return resp
    if request.method == "OPTIONS":
        resp =  make_response(render_template("options.html"))
        resp.set_cookie("21232f297a57a5a743894a0e4a801fc3", "68934a3e9455fa72420237eb05902327")
        return resp

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
    if not request.cookies.get("21232f297a57a5a743894a0e4a801fc3") == "b326b5062b2f0e69046810717534cb09":
        return render_template("admin.html")
    else:
        return {"URL": "https://dpaste.org/pZATZ/raw"}

# Error handlers

@app.errorhandler(404)
def not_found(e):
    return render_template("404.html"), 404

@app.errorhandler(500)
def server_error(e):
    return render_template("500.html"), 500