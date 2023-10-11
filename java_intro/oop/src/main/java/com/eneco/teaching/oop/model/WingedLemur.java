package com.eneco.teaching.oop.model;

public class WingedLemur extends AbstractPet{

    public WingedLemur(String name, int age, Person owner) {
        super(name, age, owner);
    }

    @Override
    public String favoriteAnime() {
        return "Avatar - the last Airbender";
    }
}
