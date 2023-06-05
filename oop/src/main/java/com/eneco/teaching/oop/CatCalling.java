package com.eneco.teaching.oop;

import com.eneco.teaching.oop.model.*;

public class CatCalling {
    public static void main(String[] args) {
        Person dana = new Person("Dana", 30);
        Cat tsobe = new Cat("Tsobe", 11, dana);
        System.out.println("tsobe.name: " + tsobe.name);
        System.out.println("tsobe.age: " + tsobe.age);
        System.out.println("tsobe.owner.getAge(): " + tsobe.owner.getAge());

        Dog bobby = new Dog("bobby", 35, dana);
        System.out.println("bobby.responseToChildren(): " + bobby.responseToChildren());
        System.out.println("bobby.doNothing(): " + bobby.doNothing());

        Animal tsvichko = new StreetCat("tsvichko", 2, dana);
        System.out.println("tsvichko.responseToChildren(): " + ((StreetCat) tsvichko).responseToChildren());
        System.out.println("tsvichko.responseToChildren(): " + ((Pet) tsvichko).responseToChildren());
        System.out.println("tsvichko.doNothing(): " + tsvichko.doNothing());

        Person aang = new Person("aang", 112);
        WingedLemur momo = new WingedLemur("momo", 110, aang);
        System.out.println("Best anime ever according to Momo: " + momo.favoriteAnime());
    }
}
