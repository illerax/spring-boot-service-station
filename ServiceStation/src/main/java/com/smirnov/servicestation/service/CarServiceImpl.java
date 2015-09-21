package com.smirnov.servicestation.service;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smirnov.servicestation.entity.Car;
import com.smirnov.servicestation.entity.CarRepository;
import com.smirnov.servicestation.entity.Orders;

@Service
public class CarServiceImpl implements CarService {

	@Autowired
	CarRepository carRepository;

	@Autowired
	OrdersService ordersService;

	@Override
	public Car getCar(Long carId) {
		Car car = carRepository.findById(carId);
		Collections.reverse(car.getOrders());
		return car;
	}

	@Override
	public void editCar(Long carId, String make, String model, String year, String vin) {
		Car car = carRepository.findById(carId);
		car.setMake(make);
		car.setModel(model);
		car.setYear(year);
		car.setVin(vin);
		carRepository.saveAndFlush(car);

	}

	@Override
	public void createCar(Long clientId, String make, String model, String year, String vin) {
		carRepository.saveAndFlush(new Car(make, model, year, vin, clientId));

	}

	@Override
	public void deleteCar(Long carId) {
		carRepository.delete(carRepository.findById(carId));

	}

	@Override
	public void cerateClientCardCar(String make, String model, String year, String vin, Long clientId, String amount) {
		Car car = new Car(make, model, year, vin, clientId);
		carRepository.saveAndFlush(car);
		if (!amount.equals("")) {
			ordersService.createOrder(car.getId(), amount);
		}

	}

	@Override
	public Car createAndGetCar(Long clientId, String make, String model, String year, String vin, String amount) {
		Car car = new Car(make, model, year, vin, clientId);
		carRepository.saveAndFlush(car);
		ArrayList<Orders> orders = new ArrayList<Orders>();
		orders.add(ordersService.createOrderAndReturn(car.getId(), amount));
		car.setOrders(orders);
		carRepository.saveAndFlush(car);
		return car;
	}

}
