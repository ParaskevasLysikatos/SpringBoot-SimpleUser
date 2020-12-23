package com.example.demo.ParaskevasLysikatos.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;

@Entity
@Table(name = "UserAddressTable")
public class UserAddress {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userAdID;
	private String homeAddress;
	private String workAddress;
	@OneToOne
    @MapsId
    @JoinColumn(name = "userAdID")
	private User user;
	
	public UserAddress() {};
	
	public UserAddress( String homeAddress, String workAddress) {
		this.homeAddress = homeAddress;
		this.workAddress = workAddress;
	}
	public int getUserAdID() {
		return userAdID;
	}
	public void setUserAdID(int userAdID) {
		this.userAdID = userAdID;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
