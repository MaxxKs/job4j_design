package ru.job4j.serialization.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Resume {
    public static void main(String[] args) {
        final Employee employee = new Employee("Petr", 33, true,
                new Contact("+7-999-999-99-99"),
                new String[]{"English", "Czech", "French"});

        final Gson gson = new GsonBuilder().create();
        System.out.println(gson.toJson(employee));

        final String employeeJson =
                "{"
                        + "\"name\":\"Oleg\","
                        + "\"age\":30,"
                        + "\"isDeveloper\":false,"
                        + "\"contact\":"
                        + "{"
                        + "\"phone\":\"+7-911-111-11-11\""
                        + "},"
                        + "\"languages\":"
                        + "[\"English\",\"Czech\",\"French\"]"
                        + "}";
        final Employee employeeMod = gson.fromJson(employeeJson, Employee.class);
        System.out.println(employeeMod);
    }
}
