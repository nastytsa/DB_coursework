package com.example.demo.controller;

import com.example.demo.entity.Order;
import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.repos.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Optional;

@Controller
public class MainController {

    @Autowired
    private OrderRepo repo;

    @GetMapping("/")
    public String greeting(
            Map<String, Object> model
    ) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@AuthenticationPrincipal User user, Model model) {

        Iterable<Order> orders;

        if(user.getRoles().contains(Role.ADMIN))
            orders = repo.findAll();
        else
            orders = repo.findAllByCustomer(user);

        model.addAttribute("orders", orders);
        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user, @RequestParam String dessert, Map<String, Object> model) {
        BigDecimal price;
        switch(dessert){
            case "napoleon":
                price = BigDecimal.valueOf(150.00);
                break;
            case "tiramisu":
                price = BigDecimal.valueOf(100.00);
                break;
            case "cheesecake":
                price = BigDecimal.valueOf(80.00);
                break;
            default:
                price = BigDecimal.valueOf(0);
        }
        Order order = new Order(dessert, price, user);

        repo.save(order);

        Iterable<Order> orders = repo.findAllByCustomer(user);

        model.put("orders", orders);

        return "main";
    }


    @GetMapping("/accept")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String orderlist(@RequestParam(required = false, defaultValue = "all") String filter, Model model) {

        Iterable<Order> orders;

        switch (filter){
            case "in process":
                orders = repo.findAllByAccepted(false);
                break;
            case "accepted":
                orders = repo.findAllByAccepted(true);
                break;
            default:
                orders = repo.findAll();
        }

        model.addAttribute("orders", orders);
        model.addAttribute("filter", filter);
        return "accept";
    }

    @PostMapping("/accept")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String accept(@RequestParam Integer order_id, Map<String, Object> model){

        Order order = repo.getById(order_id);
        order.setAccepted(true);
        repo.save(order);

        Iterable<Order> orders = repo.findAll();

        model.put("orders", orders);

        return "accept";
    }

}