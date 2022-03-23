package com.crud.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.crud.model.Customer;
import com.crud.repository.CustomerRepository;

@Service
@Transactional
public class CustomerServicesImpl implements CustomerServices {

	@Autowired
	private CustomerRepository customerRepository;

	// Service method to get every data from database
	@Override
	public List<Customer> showAllCustomer() {
		return customerRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}

	// Service method for saving data into database
	@Override
	public ResponseEntity<String> saveData(Customer customerDetails) {
		if (customerDetails.getId() == 0) {
			Customer customer5 = getCustomerByMobileOrEmail(customerDetails.getMobile(), customerDetails.getEmail());
			if (customer5 == null) {
				customerDetails = customerRepository.save(customerDetails);
				return new ResponseEntity<>("New customer created successfully!", HttpStatus.CREATED);
			} else {
				return new ResponseEntity<>("User already exist!", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			Customer customer1 = getCustomerByMobileAndEmail(customerDetails.getMobile(), customerDetails.getEmail());
			Customer customer2 = getCustomerByMobileOrEmail(customerDetails.getMobile(), customerDetails.getEmail());

			if (customer1 != null) {
				if (customer1.equals(customerDetails)) {
					return new ResponseEntity<>("User already exist!", HttpStatus.INTERNAL_SERVER_ERROR);
				}
				customer1.setFirstName(customerDetails.getFirstName());
				customer1.setLastName(customerDetails.getLastName());
				customer1.setDateOfBirth(customerDetails.getDateOfBirth());
				customer1.setAddress1(customerDetails.getAddress1());
				customer1.setAddress2(customerDetails.getAddress2());
				customer1.setAge(customerDetails.getAge());
				customer1.setMobile(customerDetails.getMobile());
				customer1.setGender(customerDetails.getGender());
				customerRepository.save(customer1);
				return new ResponseEntity<>("Customer data updated successfully!", HttpStatus.OK);
			}

			if (customer2 != null) {
				Customer customer = customerRepository.findById(customerDetails.getId()).get();
				if (!customer.getEmail().equals(customerDetails.getEmail())) {
					if (customerRepository.findTopByEmail(customerDetails.getEmail()) != null) {
						return new ResponseEntity<>("Email is already in use!", HttpStatus.INTERNAL_SERVER_ERROR);
					}
				}

				if (!customer.getMobile().equals(customerDetails.getMobile())) {
					if (customerRepository.findTopByMobile(customerDetails.getMobile()) != null) {
						return new ResponseEntity<>("Mobile is already in use!", HttpStatus.INTERNAL_SERVER_ERROR);
					}
				}

				if (customerDetails.getEmail().equals(customer2.getEmail())) {
					if (customerRepository.findByEmail(customerDetails.getEmail()) != null) {
						customer2.setFirstName(customerDetails.getFirstName());
						customer2.setLastName(customerDetails.getLastName());
						customer2.setDateOfBirth(customerDetails.getDateOfBirth());
						customer2.setAddress1(customerDetails.getAddress1());
						customer2.setAddress2(customerDetails.getAddress2());
						customer2.setAge(customerDetails.getAge());
						customer2.setMobile(customerDetails.getMobile());
						customer2.setGender(customerDetails.getGender());
						customerRepository.save(customer2);
						return new ResponseEntity<>("Customer data updated created successfully!", HttpStatus.OK);
					}
				}
				if (customerDetails.getMobile().equals(customer2.getMobile())) {
					if (customerRepository.findByMobile(customerDetails.getMobile()) != null) {
						customer2.setFirstName(customerDetails.getFirstName());
						customer2.setLastName(customerDetails.getLastName());
						customer2.setDateOfBirth(customerDetails.getDateOfBirth());
						customer2.setAddress1(customerDetails.getAddress1());
						customer2.setAddress2(customerDetails.getAddress2());
						customer2.setAge(customerDetails.getAge());
						customer2.setEmail(customerDetails.getEmail());
						customer2.setGender(customerDetails.getGender());
						customerRepository.save(customer2);
						return new ResponseEntity<>("Customer data updated created successfully!", HttpStatus.OK);
					}
				}
			}
			return new ResponseEntity<>("Can't update mobile and email at same time!", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// method for finding mobile or email same
	private Customer getCustomerByMobileOrEmail(String mobile, String email) {
		return customerRepository.findTopByMobileOrEmail(mobile, email);
	}

	// method for finding mobile and email same
	private Customer getCustomerByMobileAndEmail(String mobile, String email) {
		return customerRepository.findTopByMobileAndEmail(mobile, email);
	}

	// Service method to delete a particular data by id
	@Override
	public void deleteCustomer(int id) {
		customerRepository.deleteById(id);
	}

}