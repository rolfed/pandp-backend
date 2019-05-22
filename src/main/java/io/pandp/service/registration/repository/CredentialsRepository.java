package io.pandp.service.registration.repository;

import io.pandp.service.registration.entity.CredentialsEntity;
import org.springframework.data.repository.CrudRepository;

public interface CredentialsRepository extends CrudRepository<CredentialsEntity, Long> {}