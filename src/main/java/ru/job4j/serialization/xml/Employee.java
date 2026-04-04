package ru.job4j.serialization.xml;

import jakarta.xml.bind.annotation.*;
import java.util.Arrays;

@XmlRootElement(name = "employee")
@XmlAccessorType(XmlAccessType.FIELD)
public class Employee {

    @XmlAttribute
    private String name;

    @XmlAttribute
    private int age;

    @XmlAttribute
    private boolean isDeveloper;

    private Contact contact;

    @XmlElementWrapper(name = "languages")
    @XmlElement(name = "language")
    private String[] languages;

    public Employee() { }

    public Employee(String name, int age, boolean isDeveloper, Contact contact, String[] languages) {
        this.name = name;
        this.age = age;
        this.isDeveloper = isDeveloper;
        this.contact = contact;
        this.languages = languages;
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

