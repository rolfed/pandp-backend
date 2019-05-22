package io.pandp.service.registration.resolver;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import io.pandp.service.registration.entity.CredentialsEntity;
import io.pandp.service.registration.repository.CredentialsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CredentialsResolver implements GraphQLQueryResolver {
    private final CredentialsRepository CredentialsRepository;

    public Iterable<CredentialsEntity> credentials() {
        return CredentialsRepository.findAll();
    }
}
