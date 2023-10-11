package com.eneco.teaching.jpa.model;

import lombok.Data;

import jakarta.persistence.*;

@Entity
@Table(name="customers")
@Data //Equivalent to @Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode.
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name="name_column")
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
}
