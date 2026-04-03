package ru.job4j.io;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EchoServer {

    private static final Logger LOG = LoggerFactory.getLogger(EchoServer.class.getName());

    public static void main(String[] args) {
        try (ServerSocket server = new ServerSocket(9000)) {
            while (!server.isClosed()) {
                Socket socket = server.accept();
                try (OutputStream output = socket.getOutputStream();
                     BufferedReader input = new BufferedReader(
                             new InputStreamReader(socket.getInputStream()))) {
                    String string = input.readLine();
                    String result = "";
                    if (string != null && !string.isEmpty()) {
                        int start = string.indexOf("=");
                        int end = string.indexOf(" HTTP/1.1");
                        if (start != -1 && end != -1 && start < end) {
                            result = string.substring(start + 1, end);
                        }
                        if ("Exit".equals(result)) {
                            server.close();
                        }
                        System.out.println(string);
                    }
                    output.write("HTTP/1.1 200 OK\r\n\r\n".getBytes());
                    output.write(result.getBytes());
                    output.flush();
                }
            }
        } catch (IOException e) {
            LOG.error("Error when starting the server or handling the connection", e);
        }
    }
}