<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly Bills</title>

<style>
body{
font-family:Arial;
background:#f4f6f9;
padding:20px;
}

h2{
text-align:center;
}

table{
width:100%;
border-collapse:collapse;
background:white;
}

th{
background:#007bff;
color:white;
padding:12px;
}

td{
padding:10px;
border:1px solid #ddd;
text-align:center;
}

tr:nth-child(even){
background:#f2f2f2;
}

a{
display:block;
margin:15px 0;
}
</style>
</head>
<body>

<h2>Monthly Electricity Bills</h2>

<a href="index.jsp">← Back</a>

<table>

<tr>
<th>ID</th>
<th>Customer Name</th>
<th>Month</th>
<th>Units</th>
<th>Bill Amount (Rs)</th>
<th>Date</th>
</tr>

<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/electricity_bill",
"root",
"");

Statement st = con.createStatement();

ResultSet rs =
st.executeQuery(
"SELECT * FROM electricity_bill_details ORDER BY id DESC");

while(rs.next())
{
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("customer_name") %></td>
<td><%= rs.getString("month_name") %></td>
<td><%= rs.getInt("units_consumed") %></td>
<td><%= rs.getDouble("bill_amount") %></td>
<td><%= rs.getTimestamp("created_at") %></td>
</tr>

<%
}

con.close();

}
catch(Exception e)
{
out.println(e);
}
%>

</table>

</body>
</html>