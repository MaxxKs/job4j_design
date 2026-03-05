package ru.job4j.io;

import java.io.File;

public class Dir {
    public static void main(String[] args) {
        File file = new File("c:\\projects");
        if (!file.exists()) {
            throw new IllegalArgumentException(
                    String.format("Директория не существует: %s", file.getAbsoluteFile()));
        }
        if (!file.isDirectory()) {
            throw new IllegalArgumentException(
                    String.format("Это не директория: %s", file.getAbsoluteFile()));
        }
        System.out.println(String.format("Размер директории: %s", file.getTotalSpace()));
        File[] files = file.listFiles();
        if (files != null) {
            for (File subfile : files) {
                System.out.println(String.format("Имя файла: %s, Размер файла: %d",
                        subfile.getName(),
                        subfile.length()));
            }
        }
    }
}