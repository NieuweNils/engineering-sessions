package com.eneco.teaching.mvc.model;

import java.util.Date;


public class Customer {
    private Long id;
    private String name;
    private String dateOfBirth;
    private Gender gender;
    private Integer standaardJaarVerbruik;
    private Boolean sleeper;
    private String funnyNickName;

    public Customer(Long id, String name, String dateOfBirth, Gender gender, Integer standaardJaarVerbruik, Boolean sleeper, String funnyNickName) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.standaardJaarVerbruik = standaardJaarVerbruik;
        this.sleeper = sleeper;
        this.funnyNickName = funnyNickName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Integer getStandaardJaarVerbruik() {
        return standaardJaarVerbruik;
    }

    public void setStandaardJaarVerbruik(Integer standaardJaarVerbruik) {
        this.standaardJaarVerbruik = standaardJaarVerbruik;
    }

    public Boolean getSleeper() {
        return sleeper;
    }

    public void setSleeper(Boolean sleeper) {
        this.sleeper = sleeper;
    }

    public String getFunnyNickName() {
        return funnyNickName;
    }

    public void setFunnyNickName(String funnyNickName) {
        this.funnyNickName = funnyNickName;
    }
}
