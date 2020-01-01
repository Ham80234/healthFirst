package com.workout;


import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.foodlists.Fooditem;
import com.foodlists.FooditemDOA;


public class workoutDOA {


	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static workoutDOA instance = new workoutDOA();
	

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
	
	
public List<workout> getWorkout(int user_ID) throws SQLException {
        
        List<workout> goals = new ArrayList<workout>();

        try (
            Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement("Select * from workout where user_id = "+ user_ID +";");
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
            	goals.add(list(resultSet.getInt("workout_id")));
            }
        }
        

        return goals;
    }
	

	public workout list(int workout_id) throws SQLException {
		workout goal = new workout();
	    try (
	        Connection connection = instance.newConnection();
	        PreparedStatement statement = connection.prepareStatement("Select  * from workout  where workout_id = "+workout_id+";");
	        ResultSet resultSet = statement.executeQuery();
	    ) {
	        while (resultSet.next()) {
	        	goal.setUID(resultSet.getInt("user_id"));
	        	goal.setWorkout_id(resultSet.getInt("workout_id"));
	        	goal.setWorkout_type(resultSet.getString("workout_type"));
	        	goal.setWorkout_length(resultSet.getInt("workout_duration"));
	        	goal.setWorkout_measure(resultSet.getString("workout_measure"));
	        }
	    }
	    return goal;
    
	}
	
	public boolean AddNewWorkout(int UID, String desc, String Measure, String val) throws SQLException {
		int valInt =  Integer.parseInt(val);
		String query =  "INSERT INTO workout (user_id, workout_id, workout_type, workout_duration, workout_measure)\n" + 
				"VALUES ("+UID+", null, '"+desc+"',"+valInt+", '"+Measure+"');";
		System.out.println(query);
		try {
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			int thing =sql.executeUpdate();
			return true;
		}catch (Exception s){
			s.printStackTrace();
			return false;
		} //Changed to p
		
	}
	
	public void deleteItem(int user_id, String workout_id) throws SQLException {
		Connection connection = instance.newConnection();
        PreparedStatement statement = connection.prepareStatement("delete from workout where user_id = "+user_id+" and workout_id = "+workout_id+";");
        int resultSet = statement.executeUpdate();
       }
}
