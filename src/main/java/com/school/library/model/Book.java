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
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

    @Column(name = "author", nullable = false, length = 45)
    private String author;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "book")
    private PartBook partBook;
}
