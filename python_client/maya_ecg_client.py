import maya.cmds as cmds
import socket

HOST = "127.0.0.1"
PORT = 30001

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))
sock.setblocking(False)

last_val = 0.0

def updateHeartbeat(*args):
    global last_val
    ctrl = "heart_geo"  # replace with your mesh name

    try:
        data = sock.recv(1024).decode().strip()
        if data:
            last_val = float(data.split('\n')[-1])
    except:
        pass

    scale = 1 + max(0, last_val) * 0.4
    cmds.setAttr(ctrl + ".scaleX", scale)
    cmds.setAttr(ctrl + ".scaleY", scale)
    cmds.setAttr(ctrl + ".scaleZ", scale)

cmds.scriptJob(e=("idle", updateHeartbeat))