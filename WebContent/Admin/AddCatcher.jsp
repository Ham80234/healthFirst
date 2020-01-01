<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.admin.*" %>
<%@ page import="com.FoodSearch.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("e").toString();
String pass=request.getParameter("p").toString();
String name =request.getParameter("Fn").toString();
String group =request.getParameter("Fg").toString();
String Cal =request.getParameter("Cal").toString();
String Iron =request.getParameter("ir").toString();
String MG =request.getParameter("mg").toString();

String ph =request.getParameter("ph").toString();
String K =request.getParameter("K").toString();
String Na =request.getParameter("Na").toString();
String Z =request.getParameter("Z").toString();
String Cu =request.getParameter("Cu").toString();

String fl =request.getParameter("Fl").toString();
String mng =request.getParameter("mng").toString();
String wat =request.getParameter("wat").toString();
String sel =request.getParameter("sel").toString();
String va =request.getParameter("va").toString();
String vc =request.getParameter("vc").toString();
String ve =request.getParameter("ve").toString();
String vd =request.getParameter("vd").toString();

String vb1 =request.getParameter("vb1").toString();
String vb2 =request.getParameter("vb2").toString();

String vb3 =request.getParameter("vb3").toString();
String vb5 =request.getParameter("vb5").toString();
String vb9 =request.getParameter("vb9").toString();
String vb12 =request.getParameter("vb12").toString();


String cl =request.getParameter("cl").toString();
String pr =request.getParameter("pr").toString();
String fat =request.getParameter("fat").toString();
String fib =request.getParameter("fib").toString();

String su =request.getParameter("su").toString();
String glc =request.getParameter("glc").toString();
String fru =request.getParameter("fru").toString();
String caf =request.getParameter("caf").toString();
String carb =request.getParameter("carb").toString();

String cho =request.getParameter("cho").toString();
String sf =request.getParameter("sf").toString();

int HugeNumber = (int) Math.floor(Math.random() *  1000000) +  100000;

AdminTransfer a =  new AdminTransfer();

a.addFood(HugeNumber, name, group);
a.addAddNutrients(HugeNumber, su, glc, fru, wat, caf, cho, sf);
a.addMinerals(HugeNumber, Cal, Iron, MG, ph, K, Na, Z, Cu, fl, mng, sel);
a.addNutrients(HugeNumber, Cal, pr, fat, carb, fib);

String url  = "http://localhost:8080/Health_first/Admin/AdminHub.jsp?email="+ email+"&password="+pass;
session.setAttribute("url", url);

%>
<script>window.location.href = `${url}`</script> 
</body>
</html>