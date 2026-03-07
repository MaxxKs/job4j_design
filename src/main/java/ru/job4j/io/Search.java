package ru.job4j.io;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.io.IOException;
import java.util.function.Predicate;
import java.nio.file.Files;

public class Search {
    public static void main(String[] args) throws IOException {
        Path start = Paths.get(".");
        search(start, path -> path.toFile()
                .getName()
                .endsWith(".js"))
                .forEach(System.out::println);
    }

    public static List<Path> search(Path root,
                                    Predicate<Path> condition) throws IOException {
        SearchFiles searcher = new SearchFiles(condition);
        Files.walkFileTree(root, searcher);
        return searcher.getPaths();
    }
}

