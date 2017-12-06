<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %> 
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="koreamaster";
String pass="koreamaster";
String dbURL="jdbc:oracle:thin:@192.168.0.124:1521:orcl";

   Class.forName(driver);
   Connection connection=DriverManager.getConnection(dbURL,user,pass);
   
   String sql = "	SELECT spot.spot_name AS spot_name, spot.spot_latitude AS spot_latitude, spot.spot_longitude AS spot_longitude   " +
			"  FROM spot   " + 
			"  WHERE  " +
				"   spot.spot_no IN ( SELECT route.spot_no AS spot_no   " + 
		  							"  FROM route   " + 
		  							"  WHERE route.route_no IN ( SELECT small_trip.route_no AS route_no   " + 
														"   FROM small_trip   " + 
		   												"   WHERE small_trip.trip_no IN ( SELECT trip_note.trip_no AS trip_no    " +
		     			 															"    FROM trip_note    " + 
		      																		"    WHERE trip_note.users_id = 'user' ) ) )  ";
   

   Statement stmt = connection.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   JSONArray arr= new JSONArray();

   // DB에서 얻어온 값 JSONObject 형식인 imsi에 저장
   while (rs.next()){      
      JSONObject imsi = new JSONObject();
      imsi.put("title", rs.getString("spot_name"));
      imsi.put( "latlng1", rs.getString("spot_latitude"));
      imsi.put( "latlng2", rs.getString("spot_longitude"));
      arr.add(imsi);
   }  
   //  최종으로 받아올 json 함수
   JSONObject obj = new JSONObject();
    obj.put("mapData",arr);
       
    //서버단에서 클라이언트에게 정보 전달
    out.write(obj.toString());
%>