from flask import Flask, jsonify
import os

app = Flask(__name__)


@app.route('/')
def home():
    return 'Welcome to Flask Application! v1.0.2'


@app.route('/api/hello')
def hello_api():
    return jsonify({
        'message': 'Hello from Flask API!',
        'status': 'success'
    })


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
