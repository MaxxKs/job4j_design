package ru.job4j.io;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UsageLog4j {

    private static final Logger LOG = LoggerFactory.getLogger(UsageLog4j.class.getName());

    public static void main(String[] args) {
        String name = "Petr Arsentev";
        byte floor = 1;
        short apartment = 2;
        int age = 33;
        long population = 200_000L;
        char gender = 'M';
        boolean active = true;
        float weight = 90.2F;
        double salary = 123456789.9;

        LOG.debug("User info name: {}, age: {}, weight: {}, gender: {}, salary: {},"
                        + " floor: {}, apartment: {}, active: {}, population: {}",
                name, age, weight, gender, salary, floor, apartment, active, population);
    }
}