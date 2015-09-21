package com.smirnov.servicestation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smirnov.servicestation.entity.Car;
import com.smirnov.servicestation.service.CarService;
import com.smirnov.servicestation.service.ClientService;
import com.smirnov.servicestation.service.OrdersService;

@Controller
public class IndexController {

	@Autowired
	ClientService clientService;

	@Autowired
	CarService carService;

	@Autowired
	OrdersService ordersService;

	@RequestMapping("/")
	public ModelAndView indexPage() {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}

	@RequestMapping(value = "/clients", method = RequestMethod.POST)
	public ModelAndView clientsPageDefault(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("pageNum") int pageNum,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		ModelAndView mv = new ModelAndView("clients");
		mv.addObject("client", clientService.getCurrentPage(firstName, lastName, pageNum, currentPage));
		mv.addObject("fName", firstName);
		mv.addObject("lName", lastName);
		mv.addObject("pNum", pageNum);
		return mv;
	}

	@RequestMapping(value = "/clients/new", method = RequestMethod.GET)
	public ModelAndView createClientCard() {
		ModelAndView mv = new ModelAndView("clientcard");
		return mv;
	}

	@RequestMapping(value = "/clients/new", method = RequestMethod.POST)
	public ModelAndView saveClientCard(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("birth") String birth,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("make") String make, @RequestParam("model") String model,
			@RequestParam("year") String year, @RequestParam("vin") String vin, @RequestParam("amount") String amount) {
		String msg = clientService.createClientCard(firstName, lastName, birth, address, phone, email, make, model,
				year, vin, amount);
		ModelAndView mv = new ModelAndView("clientcard");
		mv.addObject("fName", firstName);
		mv.addObject("lName", lastName);
		mv.addObject("birth", birth);
		mv.addObject("address", address);
		mv.addObject("phone", phone);
		mv.addObject("email", email);
		mv.addObject("make", make);
		mv.addObject("model", model);
		mv.addObject("year", year);
		mv.addObject("vin", vin);
		mv.addObject("amount", amount);
		mv.addObject("message", msg);
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}", method = RequestMethod.GET)
	public ModelAndView showClientCard(@PathVariable(value = "clientId") Long clientId) {
		ModelAndView mv = new ModelAndView("showclient");
		mv.addObject("client", clientService.getClient(clientId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}", method = RequestMethod.POST)
	public ModelAndView editClientCard(@PathVariable(value = "clientId") Long clientId,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("birth") String birth, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView("showclient");
		clientService.editClient(clientId, firstName, lastName, birth, address, phone, email);
		mv.addObject("client", clientService.getClient(clientId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/newcar", method = RequestMethod.POST)
	public ModelAndView newCar(@PathVariable(value = "clientId") Long clientId, @RequestParam("make") String make,
			@RequestParam("model") String model, @RequestParam("year") String year, @RequestParam("vin") String vin) {
		ModelAndView mv = new ModelAndView("showclient");
		carService.createCar(clientId, make, model, year, vin);
		mv.addObject("client", clientService.getClient(clientId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}", method = RequestMethod.GET)
	public ModelAndView showCar(@PathVariable(value = "carId") Long carId) {
		ModelAndView mv = new ModelAndView("showcar");
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}", method = RequestMethod.POST)
	public ModelAndView editCar(@PathVariable(value = "carId") Long carId, @RequestParam("make") String make,
			@RequestParam("model") String model, @RequestParam("year") String year, @RequestParam("vin") String vin) {
		ModelAndView mv = new ModelAndView("showcar");
		carService.editCar(carId, make, model, year, vin);
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/neworder", method = RequestMethod.POST)
	public ModelAndView newOrderExcitingCar(@RequestParam("carId") Long carId, @RequestParam("amount") String amount) {
		ModelAndView mv = new ModelAndView("showcar");
		ordersService.createOrder(carId, amount);
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/newcarandorder", method = RequestMethod.POST)
	public ModelAndView newOrderNewCar(@PathVariable(value = "clientId") Long clientId,
			@RequestParam("make") String make, @RequestParam("model") String model, @RequestParam("year") String year,
			@RequestParam("vin") String vin, @RequestParam("amount") String amount) {
		ModelAndView mv = new ModelAndView("showcar");
		Car car = carService.createAndGetCar(clientId, make, model, year, vin, amount);
		mv.addObject("car", car);
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}/deletecar", method = RequestMethod.POST)
	public ModelAndView deleteCar(@PathVariable(value = "clientId") Long clientId,
			@PathVariable(value = "carId") Long carId) {
		ModelAndView mv = new ModelAndView("showclient");
		carService.deleteCar(carId);
		mv.addObject("client", clientService.getClient(clientId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}/neworder", method = RequestMethod.POST)
	public ModelAndView newOrder(@PathVariable(value = "carId") Long carId, @RequestParam("amount") String amount) {
		ModelAndView mv = new ModelAndView("showcar");
		ordersService.createOrder(carId, amount);
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}/editorder", method = RequestMethod.POST)
	public ModelAndView editOrder(@PathVariable(value = "carId") Long carId, @RequestParam("id") Long id,
			@RequestParam("date") String date, @RequestParam("amount") String amount,
			@RequestParam("status") String status) {
		ModelAndView mv = new ModelAndView("showcar");
		ordersService.editOrder(id, date, amount, status);
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping(value = "/clients/{clientId}/cars/{carId}/deleteorder", method = RequestMethod.POST)
	public ModelAndView deleteOrder(@PathVariable(value = "carId") Long carId, @RequestParam("orderId") Long orderId) {
		ModelAndView mv = new ModelAndView("showcar");
		ordersService.deleteOrder(orderId);
		mv.addObject("car", carService.getCar(carId));
		return mv;
	}

	@RequestMapping("/about")
	public ModelAndView aboutPage() {
		ModelAndView mv = new ModelAndView("about");
		return mv;
	}

}
