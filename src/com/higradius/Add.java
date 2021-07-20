package com.higradius;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {


	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String name = req.getParameter("cname");
		String cno = req.getParameter("cno");
		String invno = req.getParameter("invno");
		String invam = req.getParameter("invam");
		String dued = req.getParameter("dued");
		String notes = req.getParameter("notes");
		System.out.println(name);
		System.out.println(cno);
		System.out.println(invno);
		System.out.println(invam);
		System.out.println(dued);
		System.out.println(notes);
		String string = MessageFormat.format("insert into highradius values (8,{5}{0}{5},{5}{1}{5},{5}{2}{5},-99,{5}{3}{5},-99,{5}{4}{5});",cno,name,dued,invam,invno,"'");
		
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
			count  = statement.executeUpdate(string);
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
