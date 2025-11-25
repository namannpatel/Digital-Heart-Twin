function ecg_tcp_server()

    port = 30000;
    server = tcpserver("0.0.0.0", port);

    fprintf("MATLAB ECG server running on port %d...\n", port);

    % ---------- WAIT FOR MAYA ----------
    disp("Waiting for Maya to connect...");
    while server.Connected == false
        pause(0.1);
    end
    disp("Maya connected! Starting ECG stream...");
    % ------------------------------------

    fs = 500;                         % Sample rate
    x = 0.01:0.01:2;                   % Time vector for one ECG beat

    while true
        oneBeat = complete(x);        % Generate ECG using your function

        for i = 1:length(oneBeat)
            msg = sprintf("%f\n", oneBeat(i));

            % Only write if still connected
            if server.Connected
                write(server, msg, "string");
            else
                disp("Client disconnected. Waiting again...");
                while server.Connected == false
                    pause(0.1);
                end
                disp("Client reconnected!");
            end

            pause(1/fs);
        end
    end
end