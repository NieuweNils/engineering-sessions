package com.eneco.teaching.oop.model;

import java.util.Optional;

public class Person {
    public String name;
    private int age;
    private Optional<Boolean> hasPet;

    //this is a constructor
    public Person (String name, int age){
        this.name = name;
        this.age = age;
        this.hasPet = null;
    }

    public String getAge(){
        if (age >= 30) {
            return "it's rude to ask for someone's age!";
        }
        return String.valueOf(age);
    }

    public void setHasPet(boolean hasPet){
        this.hasPet = Optional.of(hasPet);
    }

}
