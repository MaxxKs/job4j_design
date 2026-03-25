package ru.job4j.io;

import java.io.*;
import java.util.*;
import java.nio.file.Path;
import java.nio.file.Files;
import java.util.StringJoiner;

public class CSVReader {

    public static void handle(ArgsName argsName) throws Exception {
        String file = argsName.get("path");
        String delimiter = argsName.get("delimiter");
        String output = argsName.get("out");
        String filter = argsName.get("filter");

        Path path = Path.of(file);
        String[] filterColumns = filter.split(",");
        List<Integer> selectedIndexes = new ArrayList<>();
        Map<String, Integer> headerMap = new HashMap<>();
        StringBuilder result = new StringBuilder();

        try (Scanner scanner = new Scanner(path.toFile())) {
            if (!scanner.hasNextLine()) {
                throw new IllegalArgumentException("CSV file is empty");
            }
            String[] headerColumns = scanner.nextLine().split(delimiter);
            for (int i = 0; i < headerColumns.length; i++) {
                headerMap.put(headerColumns[i].trim(), i);
            }
            StringJoiner headerJoiner = new StringJoiner(delimiter);
            for (String element : filterColumns) {
                element = element.trim();
                if (!headerMap.containsKey(element)) {
                    throw new NoSuchElementException("element not found");
                }
                selectedIndexes.add(headerMap.get(element));
                headerJoiner.add(element);
            }
            result.append(headerJoiner).append(System.lineSeparator());
            while (scanner.hasNext()) {
                String[] row = scanner.nextLine().split(delimiter);
                StringJoiner rowJoiner = new StringJoiner(delimiter);
                for (Integer index : selectedIndexes) {
                    rowJoiner.add(row[index]);
                }
                result.append(rowJoiner).append(System.lineSeparator());
            }
        }
        if ("stdout".equals(output)) {
            System.out.print(result);
        } else {
            try (PrintStream out = new PrintStream(output)) {
                out.print(result);
            }
        }
    }

    private static void validate(ArgsName argsName) {
        String file = argsName.get("path");
        String delimiter = argsName.get("delimiter");
        String filter = argsName.get("filter");
        Path path = Path.of(file);
        if (!Files.exists(path)) {
            throw new IllegalArgumentException(
                    String.format("File '%s' does not exist", path));
        }
        if (Files.isDirectory(path)) {
            throw new IllegalArgumentException(
                    String.format("%s is a directory", path));
        }
        if (delimiter.length() != 1) {
            throw new IllegalArgumentException("the delimiter is incorrect");
        }
        String[] split = filter.split(",");
        for (String element : split) {
            if (element.trim()
                    .isEmpty()) {
                throw new IllegalArgumentException("the split is empty");
            }
        }
    }

    public static void main(String[] args) throws Exception {
        ArgsName argsName = ArgsName.of(args);
        validate(argsName);
        handle(argsName);
    }
}