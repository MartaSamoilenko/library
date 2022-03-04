package com.school.library.model;

import lombok.*;

import javax.persistence.*;
import java.math.BigInteger;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "participanttype")
public class ParticipantType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name", nullable = false, length = 45)
    private String name;
}
