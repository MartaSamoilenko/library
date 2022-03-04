package com.school.library.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "participant")
public class Participant {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic(optional = false)
    @Column(name = "firstname", length = 45, nullable = false)
    private String firstName;

    @Basic(optional = false)
    @Column(name = "lastname", length = 45, nullable = false)
    private String lastName;

    @Basic(optional = false)
    @Column(name = "thirdname", length = 45, nullable = false)
    private String thirdName;

    @Basic(optional = false)
    @Column(name = "participanttypeid", nullable = false)
    private Long participantTypeId;

    @Basic(optional = false)
    @Column(name = "classlnzid", nullable = true)
    private Long classLnzId;

    @Basic(optional = false)
    @Column(name = "login", nullable = false, length = 45)
    private String login;

    @Basic(optional = false)
    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @OneToOne
    @JoinColumn(name = "classlnzid", referencedColumnName = "id", insertable = false, updatable = false)
    private Classlnz classLnz;

    @OneToOne
    @JoinColumn(name = "participanttypeid", referencedColumnName = "id", insertable = false, updatable = false)
    private ParticipantType participantType;

}
