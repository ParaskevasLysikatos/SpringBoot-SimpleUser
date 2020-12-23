package com.example.demo.ParaskevasLysikatos.Controllers;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.ParaskevasLysikatos.Models.ObjectAjax;
import com.example.demo.ParaskevasLysikatos.Models.User;
import com.example.demo.ParaskevasLysikatos.Models.UserAddress;

@RestController
public class RegisterController {
	@Autowired
	UserAddressRepository repoUA;
	@Autowired
	UserRepository repo;
	
	@GetMapping("/Register")
	public ModelAndView registerPage() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("Register");
		mv.addObject("name",'1');
		return mv;
	}
	
	@PostMapping("/registerUser")
	@ResponseBody
	public ModelAndView register( User u, UserAddress a,@RequestParam("birthdate") String b) {
		ModelAndView mv= new ModelAndView();
		int Hstatus=0;
		if(b.isEmpty()) {
			//b="2020/12/12";
		//System.out.println(b); check parameter
		//u.setBirthdate(new Date());  // set current date on null dates
		}
		if(!u.getName().isEmpty()) {   //&& !b.isEmpty() to force date to fill
			String name=u.getName();
			mv.addObject("name",name);
		repo.save(u);
		a.setUser(u);
		//System.out.println(u.getUserId());
		//System.out.println(a.getUserAdID());
		repoUA.save(a);
		 Hstatus=1;
		}
		mv.addObject("Hstatus",Hstatus);
		mv.setViewName("Register");
		return mv;
	}
	//------------------------------------------------------------------------------//
	
	@GetMapping("/RegisterAjax")
	public ModelAndView registerPageAjax() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("RegisterAjax");
		return mv;
	}
	
	@PostMapping(value="/registerUserAjax",consumes = "application/json")
	public  @ResponseBody ObjectAjax registerAjax(@RequestBody ObjectAjax obj) {
		User u= new User();
		UserAddress a= new UserAddress();
		if(!obj.getName().isEmpty()) {   
		repo.save(u);
		a.setUser(u);
		repoUA.save(a);
		u.setName(obj.getName());
		u.setSurname(u.getSurname());
		u.setGender(u.getGender());
		u.setBirthdate(u.getBirthdate());
	repo.save(u);
	a.setUser(u);
	a.setHomeAddress(obj.getHomeAddress());
	a.setWorkAddress(obj.getWorkAddress());
	repoUA.save(a);
		}
		
		 
		 return obj;
	}

}
