<%@ page import="java.sql.*" %>

<%
String customerName = request.getParameter("customerName");
String month = request.getParameter("month");
int units = Integer.parseInt(request.getParameter("units"));

double bill = 0;

// Slab Calculation

if(units <= 50)
{
    bill = units * 3.50;
}
else if(units <= 150)
{
    bill = (50 * 3.50)
         + ((units - 50) * 4.00);
}
else if(units <= 250)
{
    bill = (50 * 3.50)
         + (100 * 4.00)
         + ((units - 150) * 5.20);
}
else
{
    bill = (50 * 3.50)
         + (100 * 4.00)
         + (100 * 5.20)
         + ((units - 250) * 6.50);
}

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con =
    DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/electricity_bill",
    "root",
    "");

    PreparedStatement ps =
    con.prepareStatement(
    "INSERT INTO electricity_bill_details(customer_name,month_name,units_consumed,bill_amount) VALUES(?,?,?,?)");

    ps.setString(1, customerName);
    ps.setString(2, month);
    ps.setInt(3, units);
    ps.setDouble(4, bill);

    ps.executeUpdate();

    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Generated</title>

<style>
body{
font-family:Arial;
background:#f4f6f9;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.card{
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px rgba(0,0,0,0.2);
width:450px;
}

h2{
color:green;
text-align:center;
}

p{
font-size:18px;
margin:10px 0;
}

a{
display:block;
text-align:center;
margin-top:15px;
}
</style>
</head>

<body>

<div class="card">

<h2>Bill Saved Successfully</h2>

<p><b>Customer:</b> <%= customerName %></p>

<p><b>Month:</b> <%= month %></p>

<p><b>Units:</b> <%= units %></p>

<p><b>Total Bill:</b> Rs <%= String.format("%.2f",bill) %></p>

<a href="index.jsp">Generate Another Bill</a>

<a href="viewBills.jsp">View All Bills</a>

</div>

</body>
</html>