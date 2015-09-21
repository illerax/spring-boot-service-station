package com.smirnov.servicestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smirnov.servicestation.entity.Orders;
import com.smirnov.servicestation.entity.OrdersRepository;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersRepository ordersRepository;

	@Override
	public void createOrder(Long carId, String amount) {
		ordersRepository.saveAndFlush(new Orders(Integer.parseInt(amount), carId));

	}

	@Override
	public void editOrder(Long id, String date, String amount, String status) {
		Orders order = ordersRepository.findById(id);
		order.setAmount(Integer.parseInt(amount));
		order.setDate(date);
		order.setStatus(status);
		ordersRepository.saveAndFlush(order);

	}

	@Override
	public void deleteOrder(Long orderId) {
		ordersRepository.delete(ordersRepository.findById(orderId));

	}

	@Override
	public Orders createOrderAndReturn(Long carId, String amount) {
		Orders order = new Orders(Integer.parseInt(amount), carId);
		ordersRepository.saveAndFlush(order);
		return order;
	}

}
