package com.smirnov.servicestation.entity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Long> {

	Car findById(Long carId);

}
