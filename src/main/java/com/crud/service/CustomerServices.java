package com.crud.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.crud.model.Customer;

public interface CustomerServices {

	public List<Customer> showAllCustomer();
	
	public ResponseEntity<String> saveData(Customer customerDetails);
	
	public void deleteCustomer(int id);
}
