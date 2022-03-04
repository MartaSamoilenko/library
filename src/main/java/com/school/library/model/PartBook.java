package com.school.library.model;

import lombok.*;
import org.hibernate.engine.internal.Cascade;

import javax.persistence.*;
import java.math.BigInteger;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "partbooks")
public class PartBook {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "participantid", nullable = false)
    private Long participantid;

    @Column(name = "bookid", nullable = false)
    private Long bookid;

    @OneToOne
    @JoinColumn(name = "participantid", referencedColumnName = "id", insertable = false, updatable = false)
    private Participant participant;

    @OneToOne
    @JoinColumn(name = "bookid", referencedColumnName = "id", insertable = false, updatable = false)
    private Book book;
}
