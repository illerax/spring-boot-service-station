package com.smirnov.servicestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.smirnov.servicestation.entity.CarRepository;
import com.smirnov.servicestation.entity.Client;
import com.smirnov.servicestation.entity.ClientRepository;
import com.smirnov.servicestation.entity.OrdersRepository;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	ClientRepository clientRepository;

	@Autowired
	CarRepository carRepository;

	@Autowired
	OrdersRepository ordersRepository;

	@Autowired
	CarService carService;

	@Override
	public Iterable<Client> getClients() {
		return clientRepository.findAll();
	}

	@Override
	public Iterable<Client> findClient(String firstName, String lastName, int pageNum) {
		return clientRepository.findAllByFirstNameContainingAndLastNameContaining(firstName, lastName,
				new PageRequest(0, pageNum));
	}

	@Override
	public Iterable<Client> getCurrentPage(String firstName, String lastName, int pageNum, int currentPage) {
		return clientRepository.findAllByFirstNameContainingAndLastNameContaining(firstName, lastName,
				new PageRequest(currentPage - 1, pageNum));
	}

	@Override
	public String createClientCard(String firstName, String lastName, String birth, String address, String phone,
			String email, String make, String model, String year, String vin, String amount) {

		Client client = new Client(firstName, lastName, birth, address, phone, email);
		clientRepository.saveAndFlush(client);
		if (!make.equals("") || !model.equals("") || !year.equals("") || !vin.equals("") || !amount.equals("")) {
			carService.cerateClientCardCar(make, model, year, vin, client.getId(), amount);
		}
		return "Data successfully added!";
	}

	@Override
	public Client getClient(Long clientId) {
		return clientRepository.findById(clientId);
	}

	@Override
	public void editClient(Long clientId, String firstName, String lastName, String birth, String address, String phone,
			String email) {
		Client client = clientRepository.findById(clientId);
		client.setFirstName(firstName);
		client.setLastName(lastName);
		client.setBirth(birth);
		client.setAddress(address);
		client.setPhone(phone);
		client.setEmail(email);
		clientRepository.saveAndFlush(client);

	}

}
