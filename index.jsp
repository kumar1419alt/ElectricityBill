<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Electricity Bill Calculator</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f4f6f9;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:90%;
    max-width:500px;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 15px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#333;
}

input,select{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:8px;
}

button{
    width:100%;
    padding:12px;
    border:none;
    background:#007bff;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
}

button:hover{
    background:#0056b3;
}

.link{
    display:block;
    text-align:center;
    margin-top:15px;
}
</style>
</head>
<body>

<div class="container">

<h2>Electricity Bill Calculator</h2>

<form action="saveBill.jsp" method="post">

<input type="text"
       name="customerName"
       placeholder="Enter Customer Name"
       required>

<select name="month" required>
<option value="">Select Month</option>
<option>January</option>
<option>February</option>
<option>March</option>
<option>April</option>
<option>May</option>
<option>June</option>
<option>July</option>
<option>August</option>
<option>September</option>
<option>October</option>
<option>November</option>
<option>December</option>
</select>

<input type="number"
       name="units"
       placeholder="Enter Units Consumed"
       required>

<button type="submit">
Calculate & Save Bill
</button>

</form>

<a class="link" href="viewBills.jsp">
View Monthly Bills
</a>

</div>

</body>
</html>