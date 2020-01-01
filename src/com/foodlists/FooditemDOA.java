package com.foodlists;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FooditemDOA {

	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	
	
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static FooditemDOA instance = new FooditemDOA();
	
	
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

	public List<Fooditem> getfoodIDs(int user_id) throws SQLException {
        
        List<Fooditem> products = new ArrayList<Fooditem>();

        try (
            Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement("select food_id from foodlist where user_id = "+user_id+";");
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
            	products.add(list(resultSet.getInt("food_id")));
            }
        }
        

        return products;
    }

    public Fooditem list(int foodid) throws SQLException {
    	Fooditem product = new Fooditem();
        try (
            Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement("select * from food where food_id = "+foodid+";");
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
            	product.setFood_id(resultSet.getInt("food_id"));
            	product.setFoodName(resultSet.getString("food_name"));
            	product.setFoodGroup(resultSet.getString("food_group"));
            	
            }
        }
        return product;
        
    }

    
public void deleteItem(int user_id, String list_id) throws SQLException {
			Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement("delete from foodlist where user_id = "+user_id+" and food_id = "+list_id+";");
            int resultSet = statement.executeUpdate();
            
    }
}