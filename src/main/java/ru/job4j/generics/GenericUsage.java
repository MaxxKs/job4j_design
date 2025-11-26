package ru.job4j.generics;

import java.util.ArrayList;
import java.util.List;
import java.util.Collection;
import java.util.Iterator;

public class GenericUsage {
    public static void main(String[] args) {
        List<Integer> list = List.of(1, 2, 3, 4, 5);
        new GenericUsage().printResult(list);
        List<? super Integer> list1 = new ArrayList<>();
        new GenericUsage().addAll(list1);
    }

    public void printResult(Collection<?> collection) {
        for (Iterator<?> iterator = collection.iterator(); iterator.hasNext();) {
            Object next = iterator.next();
            System.out.println(next);
        }
    }

    public void addAll(List<? super Integer> list) {
        for (int i = 1; i <= 5; i++) {
            list.add(i);
        }
        for (Object line : list) {
            System.out.println("Текущий элемент: " + line);
        }
    }
}