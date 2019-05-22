package io.pandp.service.registration.entity;

import io.pandp.shared.models.Permission;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;



@Data
@Entity
@Table(name="credentials", schema="public")
public class CredentialsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String email;

    private String password;

    @Enumerated(EnumType.STRING)
    private Permission permission;
}
