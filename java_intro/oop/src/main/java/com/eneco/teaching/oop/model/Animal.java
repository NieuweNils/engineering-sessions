package com.eneco.teaching.oop.model;

public class Animal {
    public String name;
    public int age;
    public Person owner;

    public Animal(String name, int age, Person owner) {
        this.name = name;
        this.age = age;
        this.owner = owner;
    }

    public String doNothing() {
        doNothing(this.name);
        return "";
    }

    private void doNothing(String name) {
        String response = "even though " + name + " is given, this method returns nothing";
    }
}

