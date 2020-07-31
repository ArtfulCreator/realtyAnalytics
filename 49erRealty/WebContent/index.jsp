<%@page import="edu.uncc.realty.database.loader.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="">
  City: <input type="text" name="cityName"><br>
  Zip Code: <input type="text" name="zipCode"><br>
  No of Bedrooms: <input type="text" name="bedrooms"><br>
  No of Bathrooms: <input type = "text" name = "bathrooms"><br>
  Min price : <input type = "text" name = "mincost"><br>
  Max price : <input type = "text" name = "maxcost"><br>
  County name : <input type = "text" name = "countyName"><br>
  Street number : <input type = "text" name = "streetNumber"><br>
  Street name : <input type = "text" name = "streetName"><br>
  <input type="submit" value="Submit">
</form> 
<% 
if(request.getMethod().equals("GET")) {
return;
}
DatabaseManager dm = new DatabaseManager();

QueryItems q = new QueryItems();
String queryExtras = "";
String queryString;
q.setBeds(request.getParameter("bedrooms"));
q.setBaths(request.getParameter("bathrooms"));
q.setCity(request.getParameter("cityName"));
q.setZipcode(request.getParameter("zipCode"));
q.setMincost(request.getParameter("mincost"));
q.setMaxcost(request.getParameter("maxcost"));
q.setCountyName(request.getParameter("countyName"));
q.setStreetName(request.getParameter("streetName"));
q.setStreetNumber(request.getParameter("streetNumber"));


//String queryBase = "Select * from realty.zip_code z, realty.address a, realty.property p where z.city_name = '" + q.getCity()+ "'";
String queryBase = "Select * from realty.zip_code z," +
								"realty.address a, "+
								"realty.property p where a.MLS_ID = p.MLS_ID " +
									"and a.ZIP_CODE = z.ZIP_CODE";
if(q.getCity()!=null && !q.getCity().trim().equals("")) {
	
	queryExtras += (" and z.city_name = '" + q.getCity()+"'");
}
if(q.getZipcode()!=null && !q.getZipcode().trim().equals("")) {
	
	queryExtras += (" and z.zip_code = " + q.getZipcode());
}
if(q.getBeds()!=null && !q.getBeds().trim().equals("")) {
	
	queryExtras += (" and p.bedrooms = " + q.getBeds());
}

if(q.getBaths()!=null && !q.getBaths().trim().equals("")) {
	
	queryExtras += (" and p.bathrooms = " + q.getBaths());
}
if(q.getMincost()!=null && q.getMaxcost()!=null && !(q.getMaxcost().trim().equals("")||q.getMincost().trim().equals(""))){
	queryExtras += (" and p.sale_price < " + q.getMaxcost() + " and p.sale_price > " + q.getMincost());
}
if(q.getSqft()!=null ) queryExtras += ("and p.sqft >= " + q.getSqft());


if(q.getCountyName()!=null && !q.getCountyName().trim().equals("")) 
	{
		queryExtras += (" and z.COUNTY_NAME = '" + q.getCountyName() + "'");
	}
if(q.getStreetName()!=null && !q.getStreetName().trim().equals(""))
{
	queryExtras +=(" and a.STREET_NAME = '" + q.getStreetName() + "'");
}
if(q.getStreetNumber()!=null && !q.getStreetNumber().trim().equals(""))
{
	queryExtras +=(" and a.STREET_NAME = '" + q.getStreetNumber() + "'");
}


queryString = queryBase + queryExtras + ";";

//String sql = "SELECT * FROM REALTY.ADDRESS a where a.zip_code ="+request.getParameter("zipCode");
String sql = queryString;
out.println(queryString);
Object result = dm.runSQL(sql);

if(result instanceof Boolean) {
	//out.println("Did not work"+ result);
}
else {
ResultSet results = (ResultSet)result;

	while (results.next()){
		out.print(results.getObject(1) + "  ");
		out.print(results.getObject(2) + "  ");
		out.print(results.getObject(3) + "  ");
		out.print(results.getObject(4) + " s ");
		out.print(results.getObject(5) + "  ");
		out.print(results.getObject(6) + "  ");
		out.print(results.getObject(7) + "  ");
		out.print(results.getObject(8) + "  ");
	
%>
<BR>
<%
	}
} 
dm.close();
 %>
</body>
</html>