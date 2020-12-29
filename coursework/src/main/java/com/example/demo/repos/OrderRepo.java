package com.example.demo.repos;

import com.example.demo.entity.Order;
import com.example.demo.entity.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface OrderRepo extends CrudRepository<Order, Object> {
    Iterable<Order> findAllByCustomer(User customer);

    Iterable<Order> findAllByAccepted(boolean accepted);

    Order getById(Integer id);
}
