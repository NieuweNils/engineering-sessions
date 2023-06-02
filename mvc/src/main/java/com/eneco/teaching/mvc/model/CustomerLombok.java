package com.eneco.teaching.mvc.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
// the @Data annotation also includes the Constructor
public class CustomerLombok {
    private Long id;
    private String name;
    private String dateOfBirth;
    private Gender gender;
    private Integer standaardJaarVerbruik;
    private Boolean sleeper;
    private String funnyNickName;

    public CustomerLombok(Long id, String name, String dateOfBirth, Gender gender, Integer standaardJaarVerbruik, Boolean sleeper, String funnyNickName) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.standaardJaarVerbruik = standaardJaarVerbruik;
        this.sleeper = sleeper;
        this.funnyNickName = funnyNickName;
    }

}
