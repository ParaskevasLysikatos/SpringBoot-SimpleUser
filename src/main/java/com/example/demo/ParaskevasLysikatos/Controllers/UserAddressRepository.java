package com.example.demo.ParaskevasLysikatos.Controllers;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;


import com.example.demo.ParaskevasLysikatos.Models.UserAddress;

public interface UserAddressRepository extends JpaRepository<UserAddress,Integer> {

}
