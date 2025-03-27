package com.example.users.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "users")
public class User {

    @Id
    private int id;
    private String name;
    private String email;

    // Default constructor
    public User() {
    }

    public User(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "User details : id =" + id + ", name : " + name + " , email: " + email;
    }
}