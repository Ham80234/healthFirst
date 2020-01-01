package com.goal;

public class Goal {
	private int userID;
	private int goalID;
	public String desc;
	private int value;
	public String messure;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getGoalID() {
		return goalID;
	}
	public void setGoalID(int goalID) {
		this.goalID = goalID;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getMessure() {
		return messure;
	}
	public void setMessure(String messure) {
		this.messure = messure;
	}
	
}
