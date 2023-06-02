package com.eneco.teaching.oop.model;

public abstract class AbstractPet extends Animal {
    public AbstractPet(String name, int age, Person owner) {
        super(name, age, owner);
    }

    abstract String favoriteAnime();
}
