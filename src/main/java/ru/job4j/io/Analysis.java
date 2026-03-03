package ru.job4j.io;

import java.io.*;

public class Analysis {
    public void unavailable(String source, String target) {
        try (BufferedReader input = new BufferedReader(new FileReader(source));
             PrintWriter output = new PrintWriter(new FileOutputStream(target))) {
            String startTime = null;
            boolean flag = false;
            String line;
            while ((line = input.readLine()) != null) {
                String[] array = line.trim()
                        .split(" ");
                int status = Integer.parseInt(array[0]);
                if (status >= 400) {
                    if (!flag) {
                        startTime = array[1];
                        flag = true;
                    }
                } else if (status <= 300) {
                    if (flag) {
                        output.println(startTime + ";" + array[1] + ";");
                        flag = false;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/server.log", "data/target.csv");
    }
}