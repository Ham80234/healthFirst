package com.FoodSearch;


import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.foodlists.Fooditem;
import com.foodlists.FooditemDOA;


public class foodDOA {


	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static foodDOA instance = new foodDOA();
	

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
	
	
public List<Food> getfood(String term, String F, String PR, String C, String CH, String SF) throws SQLException {
        
		String WhereStat = " where 1=1";
		boolean Change = false;
		System.out.println(PR);
		
		if(!F.isEmpty()) {
		 int FInt =  Integer.parseInt(F);
		 int UF = FInt + 2;
		 int LF = FInt - 2;
		 Change  =  true;
			
		 WhereStat = WhereStat.concat(" AND fat Between "+LF+ " AND " +UF );
		}
		if(!PR.isEmpty()) {
			 int PRInt =  Integer.parseInt(PR);
			 int UPR = PRInt + 2;
			 int LPR = PRInt - 2;
			 Change  =  true;
				
			 WhereStat = WhereStat.concat(" AND protein Between "+LPR+ " AND " +UPR );
		}
		if(!C.isEmpty()) {
			 int CInt =  Integer.parseInt(C);
			 int UC = CInt + 200;
			 int LC = CInt - 200;
			 Change  =  true;
				
			 WhereStat = WhereStat.concat(" AND calories < "+ C  );
		}
		
		if(!CH.isEmpty()) {
			 int CInt =  Integer.parseInt(CH);
			 int UC = CInt + 2;
			 int LC = CInt - 2;
			 Change  =  true;
				
			 WhereStat = WhereStat.concat(" AND Cholesterol Between "+LC+ " AND " +UC );
		}
		
		if(!SF.isEmpty()) {
			 int PRInt =  Integer.parseInt(SF);
			 int UPR = PRInt + 2;
			 int LPR = PRInt - 2;
			 Change  =  true;
				
			 WhereStat = WhereStat.concat(" AND saturated_fat Between "+LPR+ " AND " +UPR );
		}
		
	
		System.out.println(WhereStat);
		
        List<Food> products = new ArrayList<Food>();
        
        String query  = "Select  * from food natural join  minerals natural join vitamins natural join macronutrients natural join additionalNutrients";
    	if (Change) {
    		query = query.concat(WhereStat);
    		query = query.concat(" AND lower(food_name) like '%"+term.toLowerCase() + "%';");
    	}else {
    		query = query.concat(" where lower(food_name) like '%"+term.toLowerCase() + "%';");
    	}

    	System.out.println(query);
        try (
            Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
            	products.add(list(resultSet.getInt("food_id")));
            }
        }
        

        return products;
    }
	

	public Food list(int foodid) throws SQLException {
		Food product = new Food();
	    try (
	        Connection connection = instance.newConnection();
	        PreparedStatement statement = connection.prepareStatement("Select  * from food natural join  minerals natural join vitamins natural join macronutrients natural join additionalNutrients where food_id = "+foodid+";");
	        ResultSet resultSet = statement.executeQuery();
	    ) {
	        while (resultSet.next()) {
	        	product.setFood_id(resultSet.getInt("food_id"));
	        	product.setName(resultSet.getString("food_name"));
	        	product.setGroup(resultSet.getString("food_group"));
	        	product.setFloride(resultSet.getFloat("fluoride"));
	        	product.setVitB1(resultSet.getFloat("vitamin_b1"));
	        	product.setVitB2(resultSet.getFloat("vitamin_b2"));
	        	product.setVitb3(resultSet.getFloat("vitamin_b3"));
	        	product.setVitb5(resultSet.getFloat("vitamin_b5"));
	        	product.setVitb9(resultSet.getFloat("vitamin_b9"));
	        	product.setSucrose(resultSet.getFloat("sucrose"));
	        	product.setGlucose(resultSet.getFloat("glucose"));
	        	product.setFrutose(resultSet.getFloat("fructose"));
	        	product.setWater(resultSet.getFloat("water"));
	        	product.setProtein(resultSet.getFloat("protein"));
	        	product.setFat(resultSet.getFloat("fat"));
	        	product.setCarb(resultSet.getFloat("carbohydrates"));
	        	product.setCalories(resultSet.getFloat("calories"));
	        	product.setCaffeine(resultSet.getFloat("caffeine"));
	        	product.setFiber(resultSet.getFloat("fiber"));
	        	product.setCalcium(resultSet.getFloat("calcium"));
	        	product.setIron(resultSet.getFloat("iron"));
	        	product.setMagnesium(resultSet.getFloat("magnesium"));
	        	product.setPotassium(resultSet.getFloat("potassium"));
	        	product.setSodium(resultSet.getFloat("sodium"));
	        	product.setZinc(resultSet.getFloat("zinc"));
	        	product.setCopper(resultSet.getFloat("copper"));
	        	product.setManganese(resultSet.getFloat("manganese"));
	        	product.setSelenium(resultSet.getFloat("selenium"));
	        	product.setVitA(resultSet.getFloat("vitamin_a"));
	        	product.setVite(resultSet.getFloat("vitamin_e"));
	        	product.setVitd(resultSet.getFloat("vitamin_d"));
	        	product.setVitc(resultSet.getFloat("vitamin_c"));
	        	product.setVitb12(resultSet.getFloat("vitamin_b12"));
	        	product.setCholeterol(resultSet.getFloat("cholesterol"));
	        	product.setSatfat(resultSet.getFloat("saturated_fat"));       	
	        }
	    }
	    return product;
    
	}
}
