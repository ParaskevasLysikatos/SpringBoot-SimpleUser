package com.example.demo.ParaskevasLysikatos.Models;





import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;



@Entity
@Table(name = "UserTable")
public class User {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String name;
	private String surname;
	private String gender;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	//@Column( columnDefinition = "DATE")
	private  Date birthdate;
	 @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	 @PrimaryKeyJoinColumn
	private UserAddress userAd;
	 
	 public User() {};
		
		public User( String name, String surname, String gender, Date birthdate) {
			this.name = name;
			this.surname = surname;
			this.gender = gender;
			this.birthdate = birthdate;
			
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
	public UserAddress getUserAd() {
		return userAd;
	}
	public void setUserAd(UserAddress userAd) {
		this.userAd = userAd;
	}
	
	

}
