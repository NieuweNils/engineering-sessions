package com.eneco.teaching.oop;

import com.eneco.teaching.oop.model.Person;

import java.sql.SQLOutput;

public class NameCalling {

    public static void main(String[] args) {
        Person pieter = new Person("pieter", 27);
        System.out.println("the Person object called 'pieter' we just created: " + pieter);
        System.out.println("pieter.name: " + pieter.name);
        System.out.println("pieter.getAge(): " + pieter.getAge());
        // this does not compile, because it is a private variable!
//        System.out.println(pieter.age);
    }
}
