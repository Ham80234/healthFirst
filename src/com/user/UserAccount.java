package com.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UserAccount {
	//Vars
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	
	user CurrentUser =  new user();
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static UserAccount instance = new UserAccount();
	
	
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
	public void updateSql(String query) throws SQLException {
		dbconn=instance.newConnection();
		sql=dbconn.prepareStatement(query);
		int thing =sql.executeUpdate();
	}
	
	public user selectStatement( String query ) {
		try {
			
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			ResultSet results;
			results=sql.executeQuery();
			//System.out.println("query="+query);
			while(results.next()) {
				CurrentUser.setID(results.getInt("user_id"));
				CurrentUser.setEmail(results.getString("email"));
				CurrentUser.setFirstName(results.getString("first_name"));
				CurrentUser.setLastName(results.getString("last_name"));
				CurrentUser.setCurrentWeight(results.getInt("current_weight"));
				CurrentUser.setHeight(results.getInt("height"));
				CurrentUser.setRole(results.getInt("role_flag"));
			}
			//WARNING!
			//Need to process ResultSet before closing connection
			dbconn.close();
			return CurrentUser;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}
	public void BuildUser(String email, String password) throws SQLException {
			String query  = "Select * From user where email = '"+ email + "' and password = '"+password+"';";
			System.out.println(query);
			user Cuser =  instance.selectStatement(query);
			CurrentUser = Cuser;
	}
	
	public String getFName() {
		return CurrentUser.getFirstName();
	}
	
	public int getWeight() {
		return CurrentUser.getCurrentWeight();
	}
	public int getRole() {
		return CurrentUser.getRole();
		}
	
	public int getUID() {
		return CurrentUser.getID();
	}
	
public void setWeight(String w, int UID) throws SQLException {
		
		String query  = "UPDATE user " + 
						"SET current_weight = "+w+
						" WHERE user_id = "+UID+";";
		System.out.println(query);
		instance.updateSql(query);
	}

public boolean AddItem(int UID, int FoodID) throws SQLException {
	try {
	String query  = "Insert into foodlist (user_id, list_id, food_id) values ("+UID+", null,"+FoodID+");";
	System.out.println(query);
	instance.updateSql(query);
	return true;
	}catch (Exception err) {
		System.out.println(err.getMessage());
		return false;
	}
}
	

}
