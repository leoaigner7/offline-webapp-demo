import os, yaml
from flask import Flask, render_template

# Konfiguration laden
CONFIG_FILE = os.environ.get("CONFIG_FILE", "config/app.yaml")
with open(CONFIG_FILE, "r", encoding="utf-8") as f:
    cfg = yaml.safe_load(f)

HOST = cfg.get("server", {}).get("host", "0.0.0.0")
PORT = int(cfg.get("server", {}).get("port", 8082))
TITLE = cfg.get("app", {}).get("title", "Offline Webapp Demo")

app = Flask(__name__, template_folder="../templates")

@app.route("/")
def index():
    return render_template("index.html", title=TITLE)

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    # PROD: kein debug
    app.run(host=HOST, port=PORT, debug=False)
