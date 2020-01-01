package com.admin;


import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.foodlists.Fooditem;
import com.foodlists.FooditemDOA;


public class AdminTransfer {


	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static AdminTransfer instance = new AdminTransfer();
	

	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","Ham80234");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				s.printStackTrace();} //Changed to printStackTrace()
		}
		catch (Exception err){
			err.printStackTrace(); //Changed to printStackTrace()
		}

		return null;
	}
	
	public void addFood(int FoodID, String Foodname, String foodGroup) throws SQLException {
		
		        Connection connection = instance.newConnection();
		        PreparedStatement statement = connection.prepareStatement("insert into food values("+FoodID+",null, '"+foodGroup+"','"+Foodname+"');");
		        int resultSet = statement.executeUpdate();
		     
	}
	public void addNutrients(int FoodID, String Cal, String pr, String fat, String carbs, String fib) throws SQLException {
		
        Connection connection = instance.newConnection();
        PreparedStatement statement = connection.prepareStatement("insert into macronutrients values("+FoodID+","+Cal+","+pr+","+fat+","+carbs+","+fib+");");
        int resultSet = statement.executeUpdate();
     
	}
	public void addAddNutrients(int FoodID, String su, String glc, String fru, String wat, String caf, String cho,String sf) throws SQLException {
		
	    Connection connection = instance.newConnection();
	    PreparedStatement statement = connection.prepareStatement("insert into additionalNutrients values("+FoodID+","+su+","+glc+","+fru+","+wat+","+caf+","+cho+","+sf+");");
	    int resultSet = statement.executeUpdate();
	    
		}
	
	public void addMinerals(int FoodID, String cal, String ir, String mag, String ph, String k, String sod,String z,String cu,String fl,String mn,String sel) throws SQLException {
		
	    Connection connection = instance.newConnection();
	    PreparedStatement statement = connection.prepareStatement("insert into minerals values("+FoodID+","+cal+","+ir+","+mag+","+ph+","+k+","+sod+","+z+","+cu+","+mn+","+sel+");");
	    int resultSet = statement.executeUpdate();
	    
		}
	public void addVIT(int FoodID, String va, String ve, String vd, String vc, String vb1, String vb2,String vb3,String vb5,String vb6,String vb9,String cb12) throws SQLException {
	
    Connection connection = instance.newConnection();
    PreparedStatement statement = connection.prepareStatement("insert into minerals values("+FoodID+","+va+","+ve+","+vd+","+vc+","+vb1+","+vb2+","+vb3+","+vb5+","+vb6+","+vb9+","+cb12+");");
    int resultSet = statement.executeUpdate();
    
	}

	public void list(int foodid) throws SQLException {
		int product = 4;
	    try (
	        Connection connection = instance.newConnection();
	        PreparedStatement statement = connection.prepareStatement("Select  * from food natural join  minerals natural join vitamins natural join macronutrients natural join additionalNutrients where food_id = "+foodid+";");
	        ResultSet resultSet = statement.executeQuery();
	    ) {
	        while (resultSet.next()) {
	        	  	
	        }
	    }
	    
    
	}
}
