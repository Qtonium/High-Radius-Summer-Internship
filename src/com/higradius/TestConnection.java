package com.higradius;
import   java.sql.*;
import com.higradius.Edit;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Locale;

import javax.servlet.http.HttpServlet;

public class TestConnection extends HttpServlet {
	
	public static void main(String[] args) throws Exception
	{
		String url = "jdbc:mysql://localhost:3306/mysql";
		String uname  = "root";
		String pass = "1234";
		String query = "select * from highradius";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,uname,pass);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(rs.next())
		{
		}
		st.close();
		con.close();
		String aVariable = "of ponies";
		String bVariable = "of dog";
		String string = MessageFormat.format("A string {0}{1}.", aVariable,bVariable);
		System.out.println(string);
		
		
	}
	
}



