package com.eneco.teaching.oop.model;


public class Dog extends Animal implements Pet {

    public Dog(String name, int age, Person owner) {
        super(name, age, owner);
    }

    public String responseToChildren() {
        return "licks face";
    }
}
