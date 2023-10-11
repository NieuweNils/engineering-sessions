package com.eneco.teaching.oop;

import com.eneco.teaching.oop.model.Person;

public class NameCalling {

    public static void main(String[] args) {
        Person pieter = new Person("pieter", 27);
        System.out.println("the Person object called 'pieter' we just created: " + pieter);
        System.out.println("pieter.name: " + pieter.name);
        System.out.println("pieter.getAge(): " + pieter.getAge());
        System.out.println("pieter.getClassName(): " + pieter.getClassName());

        Person susanne = new Person("susanne", 29);
        System.out.println("susanne.getClassName(): " + susanne.getClassName());

        Person.changeClassName("newName");
        System.out.println("Person.className"  + Person.className);
        System.out.println("pieter.getClassName(): " + pieter.getClassName());
        System.out.println("susanne.getClassName(): " + susanne.getClassName());

//         this does not compile, because it is a private variable!
//        System.out.println(pieter.age);
    }
}
