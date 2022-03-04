package com.school.library.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@EqualsAndHashCode
@Table(name = "classeslnz")
public class Classlnz {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

}
