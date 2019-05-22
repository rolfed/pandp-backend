package io.pandp.service.registration.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "credentials")
public class CredentialsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long userId;

//    private String email;
//    private String password;
}
