package ru.job4j.io.duplicates;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.FileVisitResult;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

public class DuplicatesVisitor extends SimpleFileVisitor<Path> {
    private Map<FileProperty, List<Path>> map = new HashMap<>();

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attributes)
            throws IOException {
        FileProperty key = new FileProperty(attributes.size(), file.getFileName()
                .toString());
        map.computeIfAbsent(key, v -> new ArrayList<>()).add(file.toAbsolutePath());
        return super.visitFile(file, attributes);
    }

    public void printResult() {
        map.entrySet().stream()
                .filter(el -> el.getValue().size() > 1)
                .forEach(el -> {
                    FileProperty file = el.getKey();
                    System.out.printf("%s - %d %n", file.getName(), file.getSize());
                    el.getValue().forEach(System.out::println);
                });
    }
}