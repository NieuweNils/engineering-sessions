package com.eneco.teaching.jpa.repository;

import java.util.List;

import com.eneco.teaching.jpa.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    // NB: the JpaRepository already has methods like .save(), .findAll(), .findById()
    List<Customer> findByName(String name);

//    Optional<Customer> findById(Long id); // Already exists in JpaRepository through inheriting the CrudRepository class!
}