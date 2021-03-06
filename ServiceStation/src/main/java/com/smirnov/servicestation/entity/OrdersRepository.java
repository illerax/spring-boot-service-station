package com.smirnov.servicestation.entity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

	Orders findById(Long id);

}
