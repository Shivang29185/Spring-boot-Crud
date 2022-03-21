package com.crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crud.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	Customer findTopByMobileOrEmail(String mobile, String email);

	Customer findTopByMobileAndEmail(String mobile, String email);

	Customer findByMobile(String mobile);

	Customer findByEmail(String email);

	Customer findTopByMobile(String mobile);

	Customer findTopByEmail(String email);

}