package ru.job4j.io;

import java.io.FileInputStream;
import java.io.IOException;

public class EvenNumberFile {
    public static void main(String[] args) {
        try (FileInputStream input = new FileInputStream("data/even.txt")) {
            StringBuilder numbers = new StringBuilder();
            int read;
            while ((read = input.read()) != -1) {
                if (read >= '0' && read <= '9') {
                    numbers.append((char) read);
                } else if (read == '\n') {
                    process(numbers);
                }
            }
            process(numbers);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void process(StringBuilder numbers) {
        if (!numbers.isEmpty()) {
            int number = Integer.parseInt(numbers.toString());
            System.out.println(number + " - " + (number % 2 == 0 ? "четное" : "нечетное"));
            numbers.setLength(0);
        }
    }
}