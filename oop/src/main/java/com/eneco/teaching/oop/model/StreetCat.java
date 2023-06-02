package com.eneco.teaching.oop.model;

public class StreetCat extends Cat implements Pet{

    public StreetCat(String name, int age, Person owner) {
        super(name, age, owner);
        this.likesBellyScratches = false;
    }

    @Override
    public String responseToChildren() {
        return "chchchchch, *scratch*";
    }
}
