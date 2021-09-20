package com.database;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.simplilearn.workshop.util.StringUtil;

@WebServlet("/Dao")
public class Dao  {
	public static Connection con=null;
	public static Statement st=null;
    
    public Dao() throws SQLException, ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false","root","Root@123");
		System.out.println("connection established with database");
		st=con.createStatement();
    }

	
public List<String[]> getAvailableFlights(String f, String t, String d) {
		
		List<String[]> flights=new ArrayList<>();
		String query="SELECT * FROM flyaway.flights where fromf='"+f+"' and tof='"+t+"' and datef='"+d+"'";
		try {
			ResultSet rs=st.executeQuery(query);
			
			if(rs.next()) {
				String[] flight=new String[3];
				flight[0]=rs.getString("name");
				flight[1]=rs.getString("timef");
				flight[2]=rs.getString("price");
				flights.add(flight);
				return flights;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

public HashMap<String, String> checkUser(String email, String password) {
	
	HashMap<String,String> user=null;
	String query="select * from flyaway.user where email='"+email+"' and password='"+password+"'";
	try {
		ResultSet rs=st.executeQuery(query);
		if(rs.next()) {
			user=new HashMap<>();
			user.put("name", rs.getString("name"));
			user.put("email",rs.getString("email"));
			user.put("phno",rs.getString("phno"));
			user.put("adno",rs.getString("adno"));
		}
		return user;
	} catch (SQLException e) {
		e.printStackTrace();
	}

	return user;
}

public boolean insertUser(HashMap<String, String> user) {

	String query="INSERT INTO flyaway.user (email, password, name, phno, adno) values('"+user.get("email")+"','"+user.get("password")+"','"+user.get("name")+"','"+user.get("phno")+"','"+user.get("adno")+"')";                   
	
	try {
		st.execute(query);
		return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
}

public boolean checkAdmin(String email, String password) {
	
	try {
		ResultSet rs=st.executeQuery("select * from flyaway.admin where email='"+email+"' and password='"+password+"'");
		if(rs.next())
			return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
}

public boolean changeAdminPassword(String email, String password) {

	try {
		ResultSet rs=st.executeQuery("select * from flyaway.admin where email='"+email+"'");
		if(!rs.next()) {
			return false;
		}
		st.execute("update flyaway.admin set password='"+password+"' where email='"+email+"'");
		return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
}

public boolean insertFlight(HashMap<String, String> flight) throws SQLException {
	
	String query1 = "INSERT INTO flyaway.flights (name, fromf, tof, datef, timef, price) VALUES" + " ('"
			+ StringUtil.fixSqlFieldValue(flight.get("name")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("from")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("to")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("date")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("time")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("price")) + "')";
	
	
	System.out.println(flight.get("date"));
	System.out.println(flight.get("time"));
	try {
		
		st.execute(query1);
		return true;
	} catch (SQLException e) {
		System.out.print("error");
		e.printStackTrace();
	}
	return false;
}
}
