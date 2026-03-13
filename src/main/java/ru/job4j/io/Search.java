package ru.job4j.io;

import java.nio.file.Path;
import java.util.List;
import java.io.IOException;
import java.util.function.Predicate;
import java.nio.file.Files;

public class Search {
    public static void main(String[] args) throws IOException {
        Path start = validateArgs(args);
        String extension = args[1];
        search(start, path -> path.toFile()
                .getName()
                .endsWith(extension))
                .forEach(System.out::println);
    }

    public static List<Path> search(Path root,
                                    Predicate<Path> condition) throws IOException {
        SearchFiles searcher = new SearchFiles(condition);
        Files.walkFileTree(root, searcher);
        return searcher.getPaths();
    }

    public static Path validateArgs(String[] args) {
        if (args.length != 2) {
            throw new IllegalArgumentException(
                    "Root folder is null or file extension not specified.\n"
                            + "Usage  ROOT_FOLDER\n"
                            + "FILE_EXTENSION\n");
        }
        Path start = Path.of(args[0]);
        if (!Files.exists(start)) {
            throw new IllegalArgumentException(
                    String.format("Директория не существует: %s", start));
        }
        if (!Files.isDirectory(start)) {
            throw new IllegalArgumentException(
                    String.format("Это не директория: %s", start));
        }
        return start;
    }
}