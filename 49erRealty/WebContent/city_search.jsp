<%@page import="edu.uncc.realty.database.loader.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}
/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing block. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the blocks, instead of the block elements themselves, gets rid of any box model math. A nested block with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}
/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
}
/* ~~ This fixed width container surrounds all other blocks ~~ */
.container {
	width: 960px;
	background-color: #FFFFFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}
/* ~~ The header is not given a width. It will extend the full width of your layout. ~~ */
header {
	background-color: #ADB96E;
}
/* ~~ These are the columns for the layout. ~~ 

1) Padding is only placed on the top and/or bottom of the block elements. The elements within these blocks have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the block itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the block element and place a second block element within it with no width and the padding necessary for your design.

2) No margin has been given to the columns since they are all floated. If you must add margin, avoid placing it on the side you're floating toward (for example: a right margin on a block set to float right). Many times, padding can be used instead. For blocks where this rule must be broken, you should add a "display:inline" declaration to the block element's rule to tame a bug where some versions of Internet Explorer double the margin.

3) Since classes can be used multiple times in a document (and an element can also have multiple classes applied), the columns have been assigned class names instead of IDs. For example, two sidebar blocks could be stacked if necessary. These can very easily be changed to IDs if that's your preference, as long as you'll only be using them once per document.

4) If you prefer your nav on the left instead of the right, simply float these columns the opposite direction (all left instead of all right) and they'll render in reverse order. There's no need to move the blocks around in the HTML source.

*/
.sidebar1 {
	float: left;
	width: 180px;
	background-color: #EADCAE;
	padding-bottom: 10px;
}
.content {
	padding: 10px 0;
	width: 600px;
	float: left;
}
aside {
	float: left;
	width: 180px;
	background-color: #EADCAE;
	padding: 10px 0;
}

/* ~~ This grouped selector gives the lists in the .content area space ~~ */
.content ul, .content ol {
	padding: 0 15px 15px 40px; /* this padding mirrors the right padding in the headings and paragraph rule above. Padding was placed on the bottom for space between other elements on the lists and on the left to create the indention. These may be adjusted as you wish. */
}

/* ~~ The navigation list styles (can be removed if you choose to use a premade flyout menu like Spry) ~~ */
nav ul{
	list-style: none; /* this removes the list marker */
	border-top: 1px solid #666; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	margin-bottom: 15px; /* this creates the space between the navigation on the content below */
}
nav li {
	border-bottom: 1px solid #666; /* this creates the button separation */
}
nav a, nav a:visited { /* grouping these selectors makes sure that your links retain their button look even after being visited */
	padding: 5px 5px 5px 15px;
	display: block; /* this gives the link block properties causing it to fill the whole LI containing it. This causes the entire area to react to a mouse click. */
	width: 160px;  /*this width makes the entire button clickable for IE6. If you don't need to support IE6, it can be removed. Calculate the proper width by subtracting the padding on this link from the width of your sidebar container. */
	text-decoration: none;
	background-color: #C6D580;
}
nav a:hover, nav a:active, nav a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ The footer ~~ */
footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* this gives IE6 hasLayout to properly clear */
	clear: both; /* this clear property forces the .container to understand where the columns end and contain them */
}
/* ~~ Miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty block element as the final element following the last floated block (within the .container) if the footer is removed or taken out of the .container */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}

/*HTML 5 support - Sets new HTML 5 tags to display:block so browsers know how to render the tags properly. */
header, section, footer, aside, article, figure {
	display: block;
}
-->
</style><!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--></head>

<body>

<div class="container">
  <header>
    <a href="#"><img src="./Screen Shot 2013-11-16 at 11.01.29 PM.jpg" alt="Insert Logo Here" href="../Documents/Home_1.html"width="359" height="90" id="Insert_logo" style="background-color: #C6D580; display:block;" /><img src="./charlottw.jpg" width="960" height="196" alt=""/></a>
  </header>
  <div class="sidebar1">
  <nav>
    <ul>
      <li><a href="./sale_1.html">For Sale</a></li>
      <li><a href="./rent_1.html">For Rent</a></li>
<li><a href="./aboutus.html">About Us</a></li>
    </ul>
</nav>
        <aside>
 <p> Be notified when nearby houses are listed or sold, prices are cut and open houses are scheduled. But if you prefer to come to Trulia every hour to check things out, we won't stop you.</p>
      <p>Realty49er.com is an all-in-one real estate site that gives you the local scoop about homes for sale, apartments for rent, neighborhood insights, and real estate markets and trends to help you figure out exactly what, where, and when to buy, sell, or rent. You can also find a real estate agent, view prices of recently sold homes, and see home values in your community. Get advice and opinions from local real estate agents, brokers, and other local experts on Trulia Voices, Realty49er.com's online real estate community.</p>
        </aside>
  <!-- end .sidebar1 --></div>
  <article class="content">
    
    <section>
     <meta charset="utf-8">
<title></title>
<link href=""./style.css" rel="stylesheet" type="text/css">
        
</head>
<body>

<% 
if(request.getMethod().equals("GET")) {
return;
}
DatabaseManager dm = new DatabaseManager();

QueryItems q = new QueryItems();
String queryExtras = "";
String queryString;
q.setBeds(request.getParameter("bedroom"));
q.setBaths(request.getParameter("bathroom"));
q.setCity(request.getParameter("city"));
q.setZipcode(request.getParameter("zipcode"));
q.setMincost(request.getParameter("mincost"));
q.setMaxcost(request.getParameter("maxcost"));
q.setCountyName(request.getParameter("countyname"));
q.setStreetName(request.getParameter("streetname"));
q.setStreetNumber(request.getParameter("streetnumber"));
q.setSqft(request.getParameter("dimension"));
String saleOrRent = request.getParameter("forSaleOrRent");


//String queryBase = "Select * from realty.zip_code z, realty.address a, realty.property p where z.city_name = '" + q.getCity()+ "'";
String queryBase = "Select * from realty.zip_code z," +
								"realty.address a, "+
								"realty.property p where a.MLS_ID = p.MLS_ID " +
									" and a.ZIP_CODE = z.ZIP_CODE"+
									" and p.STATUS = '"+saleOrRent+"'";
if(q.getCity()!=null && !q.getCity().trim().equals("")) {
	
	queryExtras += (" and z.city_name = '" + q.getCity()+"' ");
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
if(q.getSqft()!=null && !q.getSqft().trim().equals("") ) {
	queryExtras += (" and p.sqft >= " + q.getSqft());
}


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
//out.println(queryString);
Object result = dm.runSQL(sql);

if(result instanceof Boolean) {
	out.println("Did not work"+ result);
}
else {
ResultSet results = (ResultSet)result;

		
%>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
  
  <div id="tabContainer">
    <div id="tabs">
      <ul>
        
        
      </ul>
    </div>
    <div id="tabscontent">
      <div class="tabpage" id="tabpage_1">
        <h2>List of properties</h2>
        <%
        int i=0;
        while (results.next()){ %>
        <p>
        <h2>Property <%=++i %> </h2>
                MLS Id:
                <label for="mlsId" name="id" tabindex=1 ><%=results.getObject(10) %></label><br />
                Address:
                <label for="address" name="address" tabindex=3 ><%=results.getObject(7) %> <%=results.getObject(8) %>, <%=results.getObject(2) %>, <%=results.getObject(5) %> <%=results.getObject(1) %></label><br />
                County:
                <label for="county" name="id" tabindex=1 ><%=results.getObject(4) %></label><br />
                Latitude:
                <label for="latitude" name="address" tabindex=3><%=results.getObject(13) %></label><br />
                Longitude:
                <label for="longitude" name="id" tabindex=1 ><%=results.getObject(12) %></label><br />
                Baths:
                <label for="baths" name="address" tabindex=3><%=results.getObject(19) %></label><br />
                Bedrooms:
                <label for="bedrooms" name="id" tabindex=1 ><%=results.getObject(18) %></label><br />
                Price:
                <label for=="price" name="address" tabindex=3><%=results.getObject(20) %></label><br />
          </p>
          <%
     }
	
}
dm.close();
 %>
         </div>
  </div>
  </div>
<script src="./tabs_old.js"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1332079-8']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    </section>
  <!-- end .content --></article>
  <footer>
<p>Copyright © 2013 Realty49er.com, Inc. All rights reserved.</p>     <address>

    </address>
  </footer>
  <!-- end .container --></div>
</body>
</html>
