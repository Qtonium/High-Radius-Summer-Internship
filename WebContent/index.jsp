<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script defer src="index.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style><%@include file = "/css/index.css"%></style>
    <title>Document</title>
</head>
<body>
    <div class="all">
        <div>
            <img class="ABC" src="css/images/Group 20399.svg">
            <img class="highlogo" src="css/images/logo.svg">
        </div>
        <h2 class = "inv">Invoice List</h2>
        <div class="Bottom">
            <div  class="Button">
                <button class="i1 a button"><img class="add" src="css/images/Path 18189.svg">Add</button>
                <div class="plus modal1" >
                    <div class="header">
                        <div class="title1">Add Invoice</div>
                    </div>
                    <form method = "POST" action = "add">
                    <div class= "modal-body">
                        <div>
                            <div class="modal-inner-body">
                                <label for="cname" class="labelclass1">Customer Name</label><br>
                                <input type="text" id="cname" name="cname"><br>
                            </div>
                            <div class="modal-inner-body">
                                <label for="cno" class="labelclass2">Customer No.</label><br>
                                <input type="text" id="cno" name="cno"><br>
                            </div>
                            <div class="modal-inner-body">
                                <label for="invno" class="labelclass3">Invoice No.</label><br>
                                <input type="text" id="invno" name="invno"><br>
                            </div>
                            <div class="modal-inner-body">
                                <label for="invam" class="labelclass4">Invoice Amount</label><br>
                                <input type="text" id="invam" name="invam"><br>
                            </div>
                        </div>
                        <div>
                            <div class="modal-inner-body">
                                <label for="dued" class="labelclass12">Due Date</label><br>
                                <input type="text" id="dued" name="dued"><br>
                            </div>
                            <div class="modal-inner-body">
                                <label for="notes" class="labelclass22">Notes</label><br>
                                <textarea id="notes" name="notes"></textarea>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modalbottom">
                        <div class="cancel1">
                            <button class="cancel1item">Cancel</button>
                        </div>
                        <div class="clear1">
                            <button class="clear1item">Clear</button>
                        </div>
                        <div class="add1">
                            <button class="add1item">Add</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div id = "overlay"></div>
                <button class="i2 a button"><img class="edit" src="css/images/Path 18191.svg">Edit</button>
                <div class="ed modal1" >
                    <div class="header">
                        <div class="title1">Edit Invoice</div>
                    </div>
                    <form  action = "edit" method = "POST">
                    <div class= "modal-body">
                    
                        <div>
                            <div class="modal-inner-body">
                                <label for="cname2" class="labelclasse1">Customer Name</label><br>
                                <input type="text" id="cname" name="cname2"><br>
                            </div>
                            <div class="modal-inner-body">
                                <label for="notes2" class="labelclasse2">Notes</label><br>
                                <textarea id="notes2" name="notes2"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modalbottom">
                        <div class="cancel1">
                            <button class="cancel1item">Cancel</button>
                        </div>
                        <div class="reset">
                            <button class="clear1item" type = "reset">Reset</button>
                        </div>
                        <div class="save">
                            <button class="saveitem" type = "submit">Save</button>
                        </div>
                    </div>
                    </form>
                   
                </div>
                <div id = "overlay"></div>
                <button class="i3 a button"><img class="del" src="css/images/Path 18189-1.svg">Delete</button>
                <div class="dell modal1">
                    <div class="header">
                        <div class="title1">Delete records(s)?</div>
                    </div>
                    <div class= "modal-body">
                        <p class="dd" style="color: #C0C6CA;">You'll lose your  record(s) after this action. We can't recover <br> them once you delete.
                            <br><br>
                        Are you sure you want to<span style="color: #FF5E5E;"> permanently delete</span> them?</p>
                    </div>
                    <div class="modalbottom">
                        <div class="cancel2">
                            <button class="clear1item">Cancel</button>
                        </div>
                        <div class="save">
                            <button class="saveitem">delete</button>
                        </div>
                    </div>

                </div>

                <div id = "overlay"></div>
                <form method = "POST" action = "search">
                <div class = "search" >
                	<input type="text" placeholder="Search by Invoice number" id = "inputimage" name = "search">
                </div>
                </form>
            </div>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>

<%
	String id = request.getParameter("sno");
	String driverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mysql";
	String uname  = "root";
	String pass = "1234";
	
	try {
	Class.forName(driverName);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<div class = "tb">
	<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>
	<td class = "cc"> check </td>
	<td class = "head">Customer Name</td>
	<td class = "head">Customer#</td>
	<td class = "head">Invoice#</td>
	<td class = "head">Invoice Amount</td>
	<td class = "head">Due Date</b></td>
	<td class = "head">Predicted Payment Date</td>
	<td class = "head">Notes</td>
	</tr>
<%
try{ 
	connection = DriverManager.getConnection(url, uname, pass);
	statement=connection.createStatement();
	String sql ="SELECT * FROM highradius";
	
	resultSet = statement.executeQuery(sql);
	int i = 0;
	while(resultSet.next()){
    i++;
	if(i==24)
	{
		break;
	}
	
%>	
	<tr>
	<td>
		<label class = "checkboxx"></label>
		<input type = "checkbox">
		<span class = "checkmark"></span>
	</td>
	<td><%=resultSet.getString("cust_name") %></td>
	<td><%=resultSet.getString("cust_no") %></td>
	<%
			String ss = resultSet.getString("inv_id");
			String m = "";
			for(int ii=0;ii<10;ii++)
			{
				m = m + ss.charAt(ii);
			}
			
	%>
	<td><%=m %></td>
	
	<%
		float k = resultSet.getFloat("open_amount");
		k = k/1000;
    	k =(float) Double.parseDouble(new DecimalFormat("##.##").format(k));
	%>
	<td><%=k%>k</td>
	<td><%=resultSet.getString("due_date") %></td>
	
	<%
		LocalDate date = LocalDate.parse(resultSet.getString("due_date"));
		LocalDate date2 = date.plusDays(resultSet.getInt("pred"));
	%>
	<td><%=date2%></td>
	<td><%=resultSet.getString("notes") %> </td>
	</tr>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
            
        </div>
        
    </div>
</body>
</html>