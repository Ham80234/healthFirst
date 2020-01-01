package com.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mysql.cj.protocol.Resultset;

public class UserLogin {

	static UserLogin instance = new UserLogin();
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();

	// change URL to your database server as needed
	String dbPath = "jdbc:mysql://127.0.0.1:3306/healthFirst?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	public static UserLogin getInstance() {
		if (instance == null) {
			instance = new UserLogin();
		}
		return instance;
	}


	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			try {
				dbconn = DriverManager.getConnection(dbPath, "root", "Ham80234");
				System.out.println("gain the connection");
				return dbconn;
			} catch (Exception s) {
				s.printStackTrace();
			} // Changed to printStackTrace()
		} catch (Exception err) {
			err.printStackTrace(); // Changed to printStackTrace()
		}

		return null;
	}

	public ResultSet selectStatement(String query) {
		try {

			dbconn = instance.newConnection();
			sql = dbconn.prepareStatement(query);
			ResultSet results;
			results = sql.executeQuery();
			System.out.println("query=" + query);

			// WARNING!
			// Need to process ResultSet before closing connection
			dbconn.close();
			return results;
		} catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}

	public int DBentry(String query) throws Exception { // removed Exception handling
		// System.out.println("query="+query);
		int size = 0;
		try {
			Connection conn = instance.newConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs != null) {
				rs.last();
				size = rs.getRow();
			}
		} catch (NullPointerException npe) {
			size = 0;
		}
		dbconn.close();
		return size;
	}

	public boolean RDBentry(String query) throws Exception { // removed Exception handling
		// System.out.println("query="+query);
		instance.newConnection();
		sql = dbconn.prepareStatement(query);
		sql.executeUpdate(query);
		dbconn.close();
		return true;
	}



	public boolean entry(String Email, String Pass) throws Exception {

		int size = instance.DBentry("SELECT * FROM user where email = '" + Email + "' And password = '" + Pass + "';");

		return size != 0;

	}

	public ResultSet Login(String email, String pass) throws Exception {

		String query = "Select * from user where email = '" + email + "' and password = '" + pass + "';";
		System.out.print(query);
		if (entry(email, pass)) {
			Connection conn = newConnection();
			PreparedStatement Querysql = dbconn.prepareStatement(query);
			ResultSet rs = Querysql.executeQuery(query);

			while (rs.next()) {
				String userEmail = rs.getString("first_name");
				System.out.print(userEmail);
			}
			return rs;
		}
		;
		return null;

	}

	public boolean Register(String email, String Pass, String fName, String lName, String currentWeight, String feet,
			String inch) {
		int CurrentWeightInt = Integer.parseInt(currentWeight);
		int feeti = Integer.parseInt(feet);
		int inchi = Integer.parseInt(inch);
		int fInch = ((feeti * 12) + inchi);
		String fInchString = "" + fInch;
		System.out.print(
				"INSERT INTO healthFirst.user VALUES(NULL,'\"+email+\"', '\"+Pass+\"','\"+fName+\"','\"+lName+\"',\"+currentWeight+\",'\"+Height+\"',0);");
		System.out.print(feeti + " " + inchi + " " + fInch);
		if (verifyRegister(email, Pass, fName, lName, currentWeight, feet, inch)) {
			try {
				instance.RDBentry("INSERT INTO healthFirst.user VALUES(NULL,'" + email + "', '" + Pass + "','" + fName
						+ "','" + lName + "'," + CurrentWeightInt + ",'" + fInchString + "',0);");
				System.out.print("INSERT INTO healthFirst.user VALUES(NULL,'" + email + "', '" + Pass + "','" + fName
						+ "','" + lName + "'," + currentWeight + ",'" + fInchString + "',0);");
				return true;
			} catch (Exception err) {
				err.printStackTrace(); // Changed to printStackTrace()
				return false;
			}
		} else {
			return false;
		}
	}

	public boolean verifyRegister(String email, String Pass, String fName, String lName, String currentWeight,
			String feet, String inch) {
		int CurrentWeightInt = Integer.parseInt(currentWeight);
		int feeti = Integer.parseInt(feet);
		int inchi = Integer.parseInt(inch);
		int fInch = ((feeti * 12) + inchi);
		String fInchString = "" + fInch;
		System.out.print(
				"user VALUES(NULL,'\"+email+\"', '\"+Pass+\"','\"+fName+\"','\"+lName+\"',\"+currentWeight+\",'\"+Height+\"',0);");
		System.out.print(feeti + " " + inchi + " " + fInch);

		try {
			int size = instance.DBentry("SELECT * FROM user where email = '" + email + "';");

			return size == 0;
		} catch (Exception err) {
			err.printStackTrace(); // Changed to printStackTrace()
			return false;
		}
	}

	public static void main(String[] args) {

	}
}
