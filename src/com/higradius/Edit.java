package com.higradius;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Edit extends HttpServlet {


	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String name = req.getParameter("cname2");
		String notes = req.getParameter("notes2");
		String query = MessageFormat.format("update highradius set notes = {0}{1}{0} where cust_name = {0}{2}{0}","'",notes,name);
		System.out.println(query);
		String driverName = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysql";
		String uname  = "root";
		String pass = "1234";

		try {
		Class.forName(driverName);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		

		int count = -1;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DriverManager.getConnection(url, uname, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement=connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			count  = statement.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(count);
		
		res.sendRedirect("http://localhost:8080/Summer_Internship_Backend");
		
		
		
	}
}
