package com.smirnov.servicestation.service;

import com.smirnov.servicestation.entity.Car;

public interface CarService {

	Car getCar(Long carId);

	void editCar(Long carId, String make, String model, String year, String vin);

	void createCar(Long clientId, String make, String model, String year, String vin);

	void deleteCar(Long carId);

	void cerateClientCardCar(String make, String model, String year, String vin, Long id, String amount);

	Car createAndGetCar(Long clientId, String make, String model, String year, String vin, String amount);

}
