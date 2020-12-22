package com.example.demo.ParaskevasLysikatos.Models;

import java.util.Date;



public class ObjectAjax {
	
	
	
	
	private int userId;
	private String name;
	private String surname;
	private String gender;
	private  Date birthdate;
	private String homeAddress;
	private String workAddress;
	private String formatDate;
	
	
	
	public String getFormatDate() {
		return formatDate;
	}

	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}

	public ObjectAjax(){};
	
	public ObjectAjax(int userId, String name, String surname, String gender, Date birthdate, String homeAddress,
			String workAddress,String formatDate) {
		
		this.userId = userId;
		this.name = name;
		this.surname = surname;
		this.gender = gender;
		this.birthdate = birthdate;
		this.homeAddress = homeAddress;
		this.workAddress = workAddress;
		this.formatDate = formatDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getHomeAddress() {
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	public String getWorkAddress() {
		return workAddress;
	}
	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	} 
	
	
	
	

}
