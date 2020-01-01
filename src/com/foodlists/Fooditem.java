package com.foodlists;

public class Fooditem {
	public String foodName;
	public int food_id;
	public int list_id;
	public int getList_id() {
		return list_id;
	}
	public void setList_id(int list_id) {
		this.list_id = list_id;
	}
	public String foodGroup;
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public String getFoodGroup() {
		return foodGroup;
	}
	public void setFoodGroup(String foodGroup) {
		this.foodGroup = foodGroup;
	} 

}
