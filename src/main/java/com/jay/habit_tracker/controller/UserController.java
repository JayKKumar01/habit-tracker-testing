package com.jay.habit_tracker.controller;

import com.jay.habit_tracker.entity.User;
import com.jay.habit_tracker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    // 1️⃣ Add user with JSON body
    @PostMapping("/add")
    public User addUser(@RequestBody User user) {
        return userRepository.save(user);
    }

    // 2️⃣ Fetch all users
    @GetMapping("/list")
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
