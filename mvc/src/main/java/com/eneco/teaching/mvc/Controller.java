package com.eneco.teaching.mvc;

import com.eneco.teaching.mvc.model.Customer;
import com.eneco.teaching.mvc.model.Gender;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class Controller {
    Map<Long, Customer> customerMap = new HashMap<>();

    public void initCustomers() {
        customerMap.put(1L, new Customer(1L, "Pieter", "04-20-0420", Gender.MALE, 1020, true, "PewdiePiets"));
        customerMap.put(2L, new Customer(2L, "Susanne", "04-20-0420", Gender.FEMALE, 420, false, "susanders"));
    }

    public Controller() {
        initCustomers();
    }

    @RequestMapping(value = "/customer/{Id}", produces = {"application/json", "application/xml"}, method = RequestMethod.GET)
    public @ResponseBody Customer getCustomerById(@PathVariable final Long Id) {
        return customerMap.get(Id);
    }

//    @RequestMapping(value = "/addCustomer", consumes = {"application/json"}, method = RequestMethod.POST)
//    public String submit(@RequestBody Customer customer) {
//        customerMap.put(customer.getId(), customer);
//        return "201 CREATED" + customer;
//    }
}
