package com.example.users.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.users.entity.User;
import com.example.users.repository.UserRepository;

@Service
public class UserServiceImpl {

    @Autowired
    private UserRepository userRepository;


    public User createUser(User user) {

        return userRepository.save(user);
    }

    public String updateUser(User user) {
        userRepository.save(user);
        return "User updated successfully";
    }

    public String deleteUser(int id) {
        userRepository.deleteById(id);
        return "User deleted successfully";
    }

    public List<User> getUser() {
        try{
            int i=1/0;
        }catch(Exception e)
        {
            throw new RuntimeException();
        }
        return userRepository.findAll();
    }
}