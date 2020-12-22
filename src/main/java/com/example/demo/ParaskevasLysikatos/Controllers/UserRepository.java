package com.example.demo.ParaskevasLysikatos.Controllers;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.ParaskevasLysikatos.Models.User;

public interface UserRepository extends JpaRepository<User,Integer> {
	
	List<User> findByName(String name);
	List<User> findBySurname(String surname);

}
