
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="yang";
String pass="yang";
String dbURL="jdbc:oracle:thin:@192.168.0.155:1521:orcl";

   Class.forName(driver);
   Connection connection=DriverManager.getConnection(dbURL,user,pass);
   
   String users_id = request.getParameter("userId");
   
   String sql = "select to_char(trip_note_start_date, 'YYYY-MM-DD') start_d, to_char(trip_note_end_date, 'YYYY-MM-DD') end_d, trip_name,  trip_note_no " + 
         "  from trip t, trip_note n  " + 
         "  where t.trip_no = n.trip_no and users_id = '" + users_id + "'";
   Statement stmt = connection.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   JSONArray arr= new JSONArray();

   // DB에서 얻어온 값 JSONObject 형식인 imsi에 저장
   while (rs.next()){      
      JSONObject imsi = new JSONObject();
      imsi.put("id", rs.getString("trip_note_no"));
      imsi.put("title",rs.getString("trip_name"));
      imsi.put("start",rs.getString("start_d"));
      imsi.put("end",rs.getString("end_d"));
      arr.add(imsi);

   }  
   //  최종으로 받아올 json 함수
   JSONObject obj = new JSONObject();
    obj.put("trip",arr);
       
    //서버단에서 클라이언트에게 정보 전달
    out.write(obj.toString());
%>