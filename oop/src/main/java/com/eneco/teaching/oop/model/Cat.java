package com.eneco.teaching.oop.model;

import java.util.Random;

public class Cat extends Animal{
    public boolean likesBellyScratches;
    public Cat(String name, int age, Person owner){
        super(name, age, owner);
        Random rd = new Random();
        likesBellyScratches = rd.nextBoolean();
    }
}
