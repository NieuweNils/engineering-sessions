package com.eneco.teaching.oop.model;

import java.util.Optional;

public class Person {

    public static String className = "Person";
    public String name;
    private int age;
    private Optional<Boolean> hasPet;

    //this is a constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
        this.hasPet = null;
    }

    public String getAge() {
        if (this.isOlderThanThirty()) {
            return "it's rude to ask for someone's age!";
        } else {
            return String.valueOf(this.age);
        }
    }

    private boolean isOlderThanThirty() {
        if (this.age >= 30) {
            return true;
        }
        return false;
    }

    public void setHasPet(boolean hasPet) {
        this.hasPet = Optional.of(hasPet);
    }

    public static void changeClassName(String newName) {
        className = newName;
    }

    public String getClassName() {
        return className;
    }
}
