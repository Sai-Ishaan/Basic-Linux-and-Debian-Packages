from flask import Flask, render_template 
import psutil
import plotly.graph_objs as go
import plotly.io as pio
import time
from flask_socketio import SocketIO, emit
import threading

app = Flask(__name__)
socketio = SocketIO(app)
@app.route('/')
def index():
    return render_template('index.html')

def get_cpu_usage():
    return psutil.cpu_percent(interval=1)

def get_network_usage():
        net_io = psutil.net_io_counters()
        return net_io.bytes_sent, net_io.bytes_recv

def monitor_resources():
        cpu_usage = get_cpu_usage()
        bytes_sent, bytes_recv = get_network_usage()
        
        socketio.emit('update_data', {'cpu':cpu_usage, 'network_in':bytes_recv, 'network_out':bytes_sent})
        time.sleep(1)
               

@socketio.on('connect')
def handle_connect():
    emit('connected', {'data':'Connected'})
    threading.Thread(target=monitor_resources).start()
               
if __name__ == '__main__':
    socketio.run(app,debug=True)               
