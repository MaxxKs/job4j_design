package ru.job4j.io;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.io.*;
import java.util.Scanner;
import java.util.Random;

public class ConsoleChat {
    private static final String OUT = "Закончить";
    private static final String STOP = "Стоп";
    private static final String CONTINUE = "Продолжить";
    private final String path;
    private final String botAnswers;

    public ConsoleChat(String path, String botAnswers) {
        this.path = path;
        this.botAnswers = botAnswers;
    }

    public void run() {
        List<String> phrases = readPhrases();
        List<String> log = new ArrayList<>();
        boolean isSilent = false;
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        boolean running = true;
        while (running) {
            String input = scanner.nextLine();
            log.add(String.format("User: %s", input));
            if (input.equalsIgnoreCase(OUT)) {
                running = false;
            } else if (input.equalsIgnoreCase(STOP)) {
                isSilent = true;
            } else if (input.equalsIgnoreCase(CONTINUE)) {
                isSilent = false;
            } else {
                if (!isSilent && !phrases.isEmpty()) {
                    String bot = phrases.get(random.nextInt(phrases.size()));
                    System.out.println(bot);
                    log.add(String.format("Answers bot: %s", bot));
                }
            }
        }
        saveLog(log);
    }

    private List<String> readPhrases() {
        if (botAnswers == null || botAnswers.isEmpty()) {
            throw new IllegalArgumentException("Error: answers file name is empty");
        }
        try (BufferedReader reader = new BufferedReader(
                new FileReader(botAnswers, Charset.forName("UTF-8")))) {
            return reader.lines()
                    .toList();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    private void saveLog(List<String> log) {
        try (PrintWriter writer = new PrintWriter(
                new FileWriter(path, Charset.forName("UTF-8")))) {
            log.forEach(writer::println);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ConsoleChat consoleChat = new ConsoleChat(
                "data/Encoding.txt", "data/botAnswers.txt");
        consoleChat.run();
    }
}