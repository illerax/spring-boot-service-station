package com.smirnov.servicestation.entity;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client, Long> {

	Page<Client> findAllByFirstNameContainingAndLastNameContaining(String firstName, String lastName,
			Pageable pageable);

	Iterable<Client> findAllByFirstNameContainingAndLastNameContaining(String firstName, String lastName);

	Client findById(Long clientId);

}
