package com.smirnov.servicestation.service;

import com.smirnov.servicestation.entity.Client;

public interface ClientService {

	Iterable<Client> getClients();

	Iterable<Client> findClient(String firstName, String lastName, int pageNum);

	Iterable<Client> getCurrentPage(String firstName, String lastName, int pageNum, int currentPage);

	String createClientCard(String firstName, String lastName, String birth, String address, String phone, String email,
			String make, String model, String year, String vin, String amount);

	Client getClient(Long clientId);

	void editClient(Long clientId, String firstName, String lastName, String birth, String address, String phone,
			String email);

}
