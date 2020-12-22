package com.example.demo.ParaskevasLysikatos.Controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.ParaskevasLysikatos.Models.ObjectAjax;
import com.example.demo.ParaskevasLysikatos.Models.User;
import com.example.demo.ParaskevasLysikatos.Models.UserAddress;

@RestController
public class DisplayController {
	
	@Autowired
	UserAddressRepository repoUA;
	@Autowired
	UserRepository repo;
	
	@GetMapping("/display")
	public ModelAndView display() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("display");
		mv.addObject("ListUser",repo.findAll());
		return mv;
	}
	
	@RequestMapping("/deleteUser")
	public ModelAndView delete(@RequestParam("id") int id) {   //RedirectView
		ModelAndView mv= new ModelAndView();
		mv.setViewName("display");
		int Hstatus=0;
		if(repo.existsById(id)) {
			String name=repo.findById(id).get().getName();
			mv.addObject("name",name);
		repo.deleteById(id);
		Hstatus=1;
		}
		mv.addObject("Hstatus",Hstatus);
		mv.addObject("ListUser",repo.findAll());
		return mv;    //return new RedirectView("/display"); 
	}
	
	@RequestMapping("/displayUser")
	public ModelAndView userInfo(@RequestParam("id") int id) {   //RedirectView
		ModelAndView mv= new ModelAndView();
		mv.setViewName("UserInfo");
		mv.addObject("name",'1');
		User u =repo.findById(id).get();
		UserAddress a = repoUA.findById(id).get();
		String dateFormated="";
		if(u.getBirthdate()!=null)
		{ dateFormated = new SimpleDateFormat("MM/dd/yyyy").format(u.getBirthdate());}
		
		//System.out.println(dateFormated);
		mv.addObject("d", dateFormated);
		mv.addObject("u", u);
		mv.addObject("a",a);
		mv.addObject("id",id);
		return mv;    //return new RedirectView("/display"); /displayUser
	}
	
	@PostMapping("/editUser")
	@ResponseBody
	public ModelAndView editUser( User u, UserAddress a,@RequestParam("birthdate") String b, @RequestParam("id") int id) {
		ModelAndView mv= new ModelAndView();
		int Hstatus=0;
		User editU=repo.getOne(id);
		UserAddress editUA= repoUA.getOne(id);
		//System.out.println(b);
		//System.out.println(u.getName());
		if(b.isEmpty()) {
			//b="2020/12/12";
		//System.out.println(b); check parameter
		//u.setBirthdate(new Date());  // set current date on null dates
		}
		if(!u.getName().isEmpty()) {   //&& !b.isEmpty() to force date to fill
			String name=editU.getName();
			mv.addObject("name",name);
			
			editU.setName(u.getName());
			editU.setSurname(u.getSurname());
			editU.setGender(u.getGender());
			editU.setBirthdate(u.getBirthdate());
		repo.save(editU);
		editUA.setUser(editU);
		editUA.setHomeAddress(a.getHomeAddress());
		editUA.setWorkAddress(a.getWorkAddress());
		repoUA.save(editUA);
		 Hstatus=1;
		 String dateFormated = new SimpleDateFormat("MM/dd/yyyy").format(u.getBirthdate());
			//System.out.println(dateFormated);
			mv.addObject("d", dateFormated);
		 	mv.addObject("u", u);
			mv.addObject("a",a);
			mv.addObject("id",id);
		}
		
		mv.addObject("Hstatus",Hstatus);
		mv.setViewName("UserInfo");
		return mv;
	}
	
	//---------------------------------------------------------------------------------------------------//
	
	@GetMapping("/displayAjax")
	public ModelAndView displayAjax() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("displayAjax");
		mv.addObject("ListUser",repo.findAll());
		return mv;
	}
	
	/* problem with jsp converter on ajax get call
	@GetMapping("/displayAjaxData")
	public @ResponseBody List<User> displayAjaxData() {
		List<User> uList = new ArrayList<User>();
		uList=repo.findAll();
		return uList;
	}*/
	
	@DeleteMapping("/deleteUserAjax/{id}")
	public ResponseEntity<Void> deleteAjax(@PathVariable(value = "id") int id) {   
		if(repo.existsById(id)) {
		repo.deleteById(id);
		}
		return  new ResponseEntity<Void>(HttpStatus.OK);    
	}
	
	
	@GetMapping("/displayUserAjax")
	public ModelAndView userInfoAjax(@RequestParam("id") int id) {   //RedirectView
		ModelAndView mv= new ModelAndView();
		mv.setViewName("UserInfoAjax");
		/*mv.addObject("name",'1');
		User u =repo.findById(id).get();
		UserAddress a = repoUA.findById(id).get();
		String dateFormated="";
		if(u.getBirthdate()!=null)
		{ dateFormated = new SimpleDateFormat("MM/dd/yyyy").format(u.getBirthdate());}
		//System.out.println(dateFormated);
		mv.addObject("d", dateFormated);
		mv.addObject("u", u);
		mv.addObject("a",a);*/
		mv.addObject("id",id);
		return mv;    //return new RedirectView("/display"); /displayUser
	}
	
	@GetMapping("/GetUserAjax/{id}")
	public @ResponseBody ObjectAjax GetuserInfoAjax(@PathVariable(value = "id") int id) { 
		User u=repo.getOne(id);
		UserAddress a=repoUA.getOne(id);
		ObjectAjax obj= new ObjectAjax();
		obj.setName(u.getName());
		obj.setSurname(u.getSurname());
		obj.setGender(u.getGender());
		obj.setBirthdate(u.getBirthdate());
		obj.setHomeAddress(a.getHomeAddress());
		obj.setWorkAddress(a.getWorkAddress());
		//trick for date
		String dateFormated="";
		if(u.getBirthdate()!=null)
		{ dateFormated = new SimpleDateFormat("MM/dd/yyyy").format(u.getBirthdate());obj.setFormatDate(dateFormated);}
		return obj;   
	}
	
	@PutMapping(value="/editUserAjax" ,consumes = "application/json")
	public @ResponseBody ObjectAjax editUserAjax(@RequestBody ObjectAjax obj) {
		int id=obj.getUserId();
		User editU=repo.getOne(id);
		UserAddress editUA= repoUA.getOne(id);
		if(!obj.getName().isEmpty()) {   //&& !b.isEmpty() to force date to fill
			String name=editU.getName();
			editU.setName(obj.getName());
			editU.setSurname(obj.getSurname());
			editU.setGender(obj.getGender());
			editU.setBirthdate(obj.getBirthdate());
		repo.save(editU);
		editUA.setUser(editU);
		editUA.setHomeAddress(obj.getHomeAddress());
		editUA.setWorkAddress(obj.getWorkAddress());
		repoUA.save(editUA);
			
		}
		
		return obj;   
		}
	

}
