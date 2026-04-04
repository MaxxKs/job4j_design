package ru.job4j.serialization.json;

import org.json.JSONObject;
import org.json.JSONArray;
import java.util.List;
import java.util.ArrayList;

public class Resume {
    public static void main(String[] args) {
        JSONObject jsonContact = new JSONObject("{\"phone\":\"+7(999)111-99-11\"}");

        List<String> list = new ArrayList<>();
        list.add("Spanish");
        list.add("Italian");
        list.add("Greek");
        JSONArray jsonLanguages = new JSONArray(list);

        final Employee employee = new Employee("Petr", 33, true,
                new Contact("+7-999-999-99-99"),
                new String[]{"English", "Czech", "French"});
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name", employee.getName());
        jsonObject.put("age", employee.getAge());
        jsonObject.put("isDeveloper", employee.isDeveloper());
        jsonObject.put("contact", jsonContact);
        jsonObject.put("languages", jsonLanguages);

        System.out.println(jsonObject.toString());
        System.out.println();
        System.out.println(new JSONObject(employee).toString());
    }
}