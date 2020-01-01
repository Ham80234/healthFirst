package com.goal;


import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.foodlists.Fooditem;
import com.foodlists.FooditemDOA;


public class GoalDOA {


	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static GoalDOA instance = new GoalDOA();
	

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
	
	
public List<Goal> getGoal(int user_ID) throws SQLException {
        
        List<Goal> goals = new ArrayList<Goal>();

        try (
            Connection connection = instance.newConnection();
            PreparedStatement statement = connection.prepareStatement("Select * from goal where user_id = "+ user_ID +";");
            ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
            	goals.add(list(resultSet.getInt("goal_id")));
            }
        }
        

        return goals;
    }
	

	public Goal list(int goalid) throws SQLException {
		Goal goal = new Goal();
	    try (
	        Connection connection = instance.newConnection();
	        PreparedStatement statement = connection.prepareStatement("Select  * from goal  where goal_id = "+goalid+";");
	        ResultSet resultSet = statement.executeQuery();
	    ) {
	        while (resultSet.next()) {
	        	goal.setDesc(resultSet.getString("goal_descr"));
	        	goal.setGoalID(resultSet.getInt("goal_id"));
	        	goal.setUserID(resultSet.getInt("user_id"));
	        	goal.setMessure(resultSet.getString("goal_measure"));
	        	goal.setValue(resultSet.getInt("goal_value"));
	        }
	    }
	    return goal;
    
	}
	
	public boolean AddNewGoal(int UID, String desc, String Measure, String val) throws SQLException {
		int valInt =  Integer.parseInt(val);
		String query =  "INSERT INTO goal (user_id, goal_id, goal_descr, goal_value, goal_measure, completed)\n" + 
				"VALUES ("+UID+", null, '"+desc+"',"+valInt+", '"+Measure+"', 0);";
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
	
	
	public void deleteItem(int user_id, String goal_id) throws SQLException {
		Connection connection = instance.newConnection();
        PreparedStatement statement = connection.prepareStatement("delete from goal where user_id = "+user_id+" and goal_id = "+goal_id+";");
        int resultSet = statement.executeUpdate();
       }

}
