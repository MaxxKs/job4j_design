package ru.job4j.io;

import java.io.*;
import java.nio.file.Path;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import java.nio.file.Files;

public class Zip {
    private final Path root;

    public Zip(Path root) {
        this.root = root;
    }

    public void packFiles(List<Path> sources, File target) {
        try (ZipOutputStream zip = new ZipOutputStream(new BufferedOutputStream(
                new FileOutputStream(target)))) {
            for (Path source : sources) {
                Path relative = root.relativize(source);
                zip.putNextEntry(new ZipEntry(relative.toString()));
                Files.copy(source, zip);
                zip.closeEntry();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void validate(ArgsName params) {
        String directory = params.get("d");
        String exclude = params.get("e");
        String output = params.get("o");
        Path dir = Path.of(directory);
        if (!Files.exists(dir)) {
            throw new IllegalArgumentException(
                    String.format("Directory '%s' does not exist", dir));
        }
        if (!Files.isDirectory(dir)) {
            throw new IllegalArgumentException(
                    String.format("%s is not a directory", dir));
        }
        if (!exclude.startsWith(".")) {
            throw new IllegalArgumentException("Extension must start with the \".\" character");
        }
        if (!output.endsWith(".zip")) {
            throw new IllegalArgumentException("Output file must have .zip extension");
        }
    }

    public static void main(String[] args) {
        try {
            ArgsName params = ArgsName.of(args);
            validate(params);
            Path root = Path.of(params.get("d"));
            String exc = params.get("e");
            File target = new File(params.get("o"));
            List<Path> files = Search.search(root,
                    el -> !el.getFileName()
                            .toString()
                            .endsWith(exc));
            Zip zip = new Zip(root);
            zip.packFiles(files, target);
            System.out.println("Archive created: " + target.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}