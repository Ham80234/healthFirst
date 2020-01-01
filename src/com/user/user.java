package com.user;

import java.sql.ResultSet;

public class user {
	private int ID;
	private String email;
	private String password; 
	private String firstName;
	private String lastName;
	private int currentWeight;
	private int Height; // in inches 
	private int role;
//	public ResultSet Lists;
//	public ResultSet Goals;
//	public ResultSet Workouts;
	
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getCurrentWeight() {
		return currentWeight;
	}
	public void setCurrentWeight(int currentWeight) {
		this.currentWeight = currentWeight;
	}
	public int getHeight() {
		return Height;
	}
	public void setHeight(int height) {
		Height = height;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int i) {
		this.role = i;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
