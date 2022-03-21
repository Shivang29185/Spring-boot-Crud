package com.crud.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crud.model.Customer;
import com.crud.service.CustomerServices;

@Controller
public class CustomerController {

	@Autowired
	private CustomerServices services;

	@RequestMapping("/")
	public String baseUrl(HttpServletRequest request) {
		return "redirect:/ShowCustomers";
	}

	// Controller method for displaying Home page with data Display from database
	@RequestMapping("/ShowCustomers")
	public String showAllCustomer(HttpServletRequest request) {
		request.setAttribute("customers", services.showAllCustomer());
		return "customer_view";
	}

	// Controller method for delete
	@RequestMapping("/deleteData/{id}")
	public String deleteCustomerById(@PathVariable("id") int id) {
		services.deleteCustomer(id);
		return "redirect:/ShowCustomers";
	}

	// controller method for add & update
	@RequestMapping("/save")
	public ResponseEntity<String> validateCustomer(@Valid @ModelAttribute("customer") Customer customer){
		return services.saveData(customer);
	}

}