package ru.job4j.serialization.json;

import java.util.Arrays;

public class Employee {
    private final String name;
    private final int age;
    private final boolean isDeveloper;
    private final Contact contact;
    private final String[] languages;

    public Employee(String name, int age, boolean isDeveloper, Contact contact, String[] languages) {
        this.name = name;
        this.age = age;
        this.isDeveloper = isDeveloper;
        this.contact = contact;
        this.languages = languages;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public boolean isDeveloper() {
        return isDeveloper;
    }

    public Contact getContact() {
        return contact;
    }

    public String[] getLanguages() {
        return languages;
    }

    @Override
    public String toString() {
        return "Employee{"
                + "name='" + name + '\''
                + ", age=" + age
                + ", isDeveloper=" + isDeveloper
                + ", contact=" + contact
                + ", languages=" + Arrays.toString(languages)
                + '}';
    }
}
