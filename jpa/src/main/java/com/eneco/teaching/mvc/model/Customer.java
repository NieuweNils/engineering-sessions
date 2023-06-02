package com.eneco.teaching.mvc.model;

import lombok.Data;

import jakarta.persistence.*;

@Entity
@Table(name="customers")
//@Data //Equivalent to @Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode.
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name="name")
    private String name;
    @Column(name="dateOfBirth")
    private String dateOfBirth;
    @Column(name="gender")
    private Gender gender;
    @Column(name="standaardJaarVerbruik")
    private int standaardJaarVerbruik;
    @Column(name="sleeper")
    private boolean sleeper;
    @Transient
    private String funnyNickName;
    public Customer() {
    }

    public Customer(long id, String name, String dateOfBirth, Gender gender, int standaardJaarVerbruik, boolean sleeper, String funnyNickName) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.standaardJaarVerbruik = standaardJaarVerbruik;
        this.sleeper = sleeper;
        this.funnyNickName = funnyNickName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public int getStandaardJaarVerbruik() {
        return standaardJaarVerbruik;
    }

    public void setStandaardJaarVerbruik(int standaardJaarVerbruik) {
        this.standaardJaarVerbruik = standaardJaarVerbruik;
    }

    public boolean isSleeper() {
        return sleeper;
    }

    public void setSleeper(boolean sleeper) {
        this.sleeper = sleeper;
    }

    public String getFunnyNickName() {
        return funnyNickName;
    }

    public void setFunnyNickName(String funnyNickName) {
        this.funnyNickName = funnyNickName;
    }
}
