package com.greatlearning.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.crm.entity.Customer;
import com.greatlearning.crm.service.CustomerService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("/")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/")
	public String homePage(Model theModel) {
		return "customerlist";
	}
	
	@RequestMapping("/list")
	public String listCustomerDetails(Model theModel) {
		// get Customer details from db
		List<Customer> Customers = customerService.findAll();
		// add to the spring model
		theModel.addAttribute("Customer", Customers);
		return "customerlist";
	}

	@RequestMapping("/addcustomer")
	public String addCustomer(Model theModel) {

		// create model attribute to bind form data
		Customer customer = new Customer();
		theModel.addAttribute("Customer", customer);
		return "customerform";
	}

	@RequestMapping("/updatecustomer")
	public String updateCustomerDetails(@RequestParam("customerid") int theId, Model theModel) {

		// get the Customer from the service
		Customer customer = customerService.findById(theId);
		// set Customer as a model attribute to pre-populate the form
		theModel.addAttribute("Customer", customer);
		// send over to our form
		return "customerform";
	}

	@PostMapping("/save")
	public String saveCustomerDetails(@RequestParam("customerid") int customerId,
			@RequestParam("firstname") String firstName, @RequestParam("lastname") String lastName,
			@RequestParam("email") String eMail) {
		Customer customer;
		if (customerId != 0) {
			customer = customerService.findById(customerId);
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.seteMail(eMail);
		} else
			customer = new Customer(firstName, lastName, eMail);
		// save the Book
		customerService.save(customer);
		// use a redirect to prevent duplicate submissions
		return "redirect:/list";

	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("customerid") int customerId) {

		// delete the Book
		customerService.deleteById(customerId);
		// redirect to /Books/list
		return "redirect:/list";

	}

}
