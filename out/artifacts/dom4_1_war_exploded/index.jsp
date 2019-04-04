<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Form</title>
</head>
<body>

<form action="./showscopes" method="get">
	Choose a scope: <select name="scope">
	<option value="request">REQUEST</option>
	<option value="session">SESSION</option>
	<option value="application">APPLICATION</option>
</select><br/>
	Key: <input type="text" name="key" /><br/>
	Value: <input type="text" name="value" /><br/>

	<input type="submit" value="Submit" />
</form>

</body>
</html>