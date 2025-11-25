# Digital Heart Twin and Real-Time ECG-Based Animation Using MATLAB and Maya

## Introduction <br>
This project implements a Digital Heart Twin that responds to real-time ECG signals.  
The workflow integrates Autodesk Maya for 3D modeling, shading, lighting, and animation with MATLAB for generating synthetic ECG waveforms.  
A TCP/IP communication bridge built using Python allows ECG amplitudes to drive the heart’s contraction and relaxation motion inside Maya.  
This project demonstrates real-time biomedical visualization using the core principles of Graphics & Visual Computing (GVC).

<br>

## Main Goal <br>
The main goal of this project is to create a functional digital twin of the human heart that animates in real-time using ECG waveform data—without relying on premade rigs or simulation systems. The visualization uses only Maya, MATLAB, and Python scripting.

<br>

# Setup

## 1. Installing pip packages <br>
Before running the project, install the required Python dependencies.  
Make sure you are using Python 3.7+.
#### List of Packages
    numpy
    matplotlib
    scipy
    pyopengl

#### Install packages:
    pip3 install -r requirements.txt

#### If installing packages for Maya:
    mayapy -m pip install numpy

<br>

## 2. Start MATLAB ECG Server <br>
#### Navigate to your MATLAB ECG folder:
    cd matlab_code/

#### Run the streaming server:
    ecg_tcp_server

Expected output:
    MATLAB ECG server running on port 30001...
    Streaming ECG data...

If MATLAB shows:
    Undefined function or variable 'complete'

Make sure all wave files (p_wav.m, qrs_wav.m, t_wav.m, etc.) are in the same directory.

<br>

## 3. Connect Maya to the ECG Stream <br>
Open Maya → Script Editor → Python tab and run:
    import socket
    sock = socket.socket()
    sock.connect(("127.0.0.1", 30001))
    print("Connected to MATLAB ECG server!")

Success:
    Connected to MATLAB ECG server!

If connection fails:
    ConnectionRefusedError: [Errno 61] Connection refused

Check:
    - MATLAB server is running
    - Correct port (30001)
    - Firewall is not blocking the connection

<br>

## 4. Start Real-Time Heartbeat Animation <br>
#### Run this file inside Maya Script Editor
    python_client/maya_ecg_client.py 

<br>

## 5. Troubleshooting <br>

Heart not moving:
    - Ensure MATLAB server is running  
    - Check Maya Script Editor for errors  
    - Make sure mesh name matches (heart_geo)

Connection refused:
    - Restart MATLAB server  
    - Verify IP & port  
    - Disable firewall temporarily  

Heartbeat too slow:
Increase MATLAB frequency:
    pause(1/800)

<br><br>

# Project Structure

    Digital-Heart-Twin/
    ├── maya_scene/
    │     heart.mb
    ├── matlab_code/
    │     complete.m
    │     p_wav.m
    │     qrs_wav.m
    │     t_wav.m
    │     u_wav.m
    │     ecg_tcp_server.m
    ├── python_client/
    │     maya_ecg_client.py
    └── README.md

<br>

# Features

- Real-time ECG-driven animation  
- Heart responds dynamically to physiological waveform  
- Procedural modeling and shading pipeline  
- Arnold subsurface scattering for realism  
- End-to-end data communication with MATLAB → Python → Maya  

<br>

# Future Enhancements

- Add valve animation  
- Use real ECG from smartwatch  
- Add blood flow simulation  
- Build VR/AR cardiac visualization in Unity  

<br>

# Authors
    Naman Patel, Nandini Singh
