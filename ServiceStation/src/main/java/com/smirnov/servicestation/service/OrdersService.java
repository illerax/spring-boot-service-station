package com.smirnov.servicestation.service;

import com.smirnov.servicestation.entity.Orders;

public interface OrdersService {

	void createOrder(Long carId, String amount);

	void editOrder(Long id, String date, String amount, String status);

	void deleteOrder(Long orderId);

	Orders createOrderAndReturn(Long id, String amount);

}
