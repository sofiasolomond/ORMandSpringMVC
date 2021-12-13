package com.greatlearning.crm.service;

import com.greatlearning.crm.entity.Customer;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CustomerService {
	public List<Customer> findAll();

	public Customer findById(int theId);

	public void save(Customer customer);

	public void deleteById(int theId);
}
