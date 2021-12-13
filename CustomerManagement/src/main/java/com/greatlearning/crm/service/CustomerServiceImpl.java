package com.greatlearning.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.greatlearning.crm.entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {

	private SessionFactory sessionFactory;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAll() {
		// List the customer details
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.beginTransaction();

		// find all the records from the database table
		List<Customer> customer = session.createQuery("from Customer").list();
		transaction.commit();
		return customer;
	}

	@Override
	public Customer findById(int theId) {
		// Get Customer details search by ID
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.beginTransaction();
		Customer customer = session.get(Customer.class, theId);
		transaction.commit();
		return customer;
	}

	@Override
	public void save(Customer customer) {
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(customer);
		transaction.commit();
		return;
	}

	@Override
	public void deleteById(int theId) {
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.beginTransaction();
		Customer customer = session.get(Customer.class, theId);
		session.delete(customer);
		transaction.commit();
		return;

	}

}
