# app.py
from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def get_time():
    response = {
        "timestamp": datetime.utcnow().isoformat(),
        "ip": request.headers.get("X-Forwarded-For", request.remote_addr)
    }
    return jsonify(response)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)