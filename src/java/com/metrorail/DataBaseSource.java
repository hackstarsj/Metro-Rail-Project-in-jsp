/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sanjeev
 */
package com.metrorail;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import static java.lang.System.out;
import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import jdk.nashorn.api.scripting.JSObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DataBaseSource {
            String connectionURL = "jdbc:mysql://localhost:3306/metrorail?zeroDateTimeBehavior=convertToNull";
            Connection connection = null; 
    public DataBaseSource() {
    try {


            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = (Connection) DriverManager.getConnection(connectionURL, "root", "");
            if(!connection.isClosed())
                 out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            //connection.close();
        }
         catch(ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex)
         {
            out.println("Unable to connect to database"+ex);
         } 
    }
    public List<Map<String,String>> fetchAllData(String sql) throws SQLException{
            

      Statement s=connection.createStatement();
      ResultSet executeQuery = s.executeQuery(sql);
      ResultSetMetaData res=executeQuery.getMetaData();
      int numColumns = res.getColumnCount();
      List<Map<String,String>> list=new ArrayList<>();   
      Map<String,String> rows;
      while(executeQuery.next())
      {  
          rows=new HashMap();
          for(int i=1;i<=numColumns;i++){
              rows.put(res.getColumnName(i),executeQuery.getString(i));
          }

        list.add(rows);
      }
      return list;
    }
    
    public boolean InsertData(String sql) throws SQLException{
        
        Statement s=connection.createStatement();
               int ss= s.executeUpdate(sql);
                return ss>0;
    }
    
    public BigDecimal InsertDataWithId(String sql) throws SQLException{
        
        Statement s=connection.createStatement();
               int ss= s.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS );
               ResultSet rs = s.getGeneratedKeys(); 
               java.math.BigDecimal idColVar = null;
               while (rs.next()) {
              idColVar = rs.getBigDecimal(1); 
               }
               return idColVar;
    }
    
    public Map HomeDataCount() throws SQLException{
        Map<String,String> maps=new HashMap();
        Statement s=connection.createStatement();
        String sql="select (select count(*) from station) as station,\n" +
"  (select count(*) from route) as route,\n" +
"  (select count(*) from trains) as trains,\n" +
"  (select count(*) from complaints) as complaints,\n" +
"  (select count(*) from metro_card) as metro_card,\n" +
"  (select count(*) from trip) as trip";
      ResultSet executeQuery = s.executeQuery(sql);
      ResultSetMetaData res=executeQuery.getMetaData();
      int numColumns = res.getColumnCount();
      while(executeQuery.next())
      {  
          for(int i=1;i<=numColumns;i++){
              maps.put(res.getColumnName(i),executeQuery.getString(i));
          }

      }
        return maps;
    } 
    
    /**
     *
     * @param pay_id
     * @param amt
     * @param req_id
     * @return Stations
     * @throws java.io.IOException
     * @throws SQLException
     */
    public Map<String,String> RechargeProcess(String pay_id,String req_id) throws IOException, SQLException{
        Map<String,String> AllData=new HashMap<>();
        PayMentCheckApi Checker=new PayMentCheckApi();
        JSONObject jsons=Checker.CheckPaymentProcess(pay_id);
        if(Objects.equals(jsons.get("success").toString(),"false")){
             AllData.put("status","failed");
        }
        else if(Objects.equals(jsons.get("success").toString(),"true")){
          
             JSONObject payment=(JSONObject)jsons.get("payment");
             if(Objects.equals(payment.get("status").toString(),"Credit")){
                 if(CheckAlreadyRecharge(pay_id)){
                    AllData.put("status","already");                 
                 }
                 else{
                   if(UpdateBalance(pay_id, payment.get("amount").toString(), req_id)){
                      AllData.put("status","success");                    
                   }
                   else{
                      AllData.put("status","admin");                                          
                   }
                 }
                 
             }
             else {
                    AllData.put("status","failed");
             }
        } 
        return AllData;
    }
    
    public Boolean CheckAlreadyRecharge(String pay_id) throws SQLException{
        Boolean status=true;
       Statement s=connection.createStatement();
       String sql="SELECT * FROM `card_recharges` WHERE `paymentid`='"+pay_id+"' and `status`='complete'";
       ResultSet executeQuery = s.executeQuery(sql);
       ResultSetMetaData res=executeQuery.getMetaData();
       int numColumns = res.getColumnCount();
       int loop=0;
       while(executeQuery.next())
       {  
          loop=1;
       }
       if(loop==0){
           status=false;
       }
       else{
           status=true;
       }

        return status;
    }
    public Boolean UpdateBalance(String Pay_id,String Amt,String id) throws SQLException{
        Statement s=connection.createStatement();
        Boolean status=false;
               int ss= s.executeUpdate("UPDATE `card_recharges` SET `status`='complete',`amount`='"+Amt+"',`paymentid`='"+Pay_id+"' WHERE txn_id='"+id+"'");
               
               if(ss>0){
                   String cardno=GetCarNoByReqId(id);
                   if(cardno==null){
                     status=false;                       
                   }
                   else{
                      int ss2=s.executeUpdate("UPDATE `metro_card` SET `balance`=balance+'"+Amt+"' WHERE `card_num`='"+cardno+"'");                       if(ss2>0){
                          status=true;
                      }
                      else{
                          status=false;
                      }
                   }
                   
               }
               else{
                   status=false;
               }
               return status;
    }
    public String GetCarNoByReqId(String tx_id) throws SQLException{
        String card=null;
       Statement s=connection.createStatement();
       String sql="SELECT * FROM `card_recharges` WHERE `txn_id`='"+tx_id+"'";
       ResultSet executeQuery = s.executeQuery(sql);
       ResultSetMetaData res=executeQuery.getMetaData();
       int numColumns = res.getColumnCount();
       while(executeQuery.next())
       {  
          for(int i=1;i<=numColumns;i++){
              if(Objects.equals(res.getColumnLabel(i),"card_num")){
                  card=executeQuery.getString(i);                  
              }
          }
          break;

      } 
        return card;
    }
    
    public JSONArray GetStation(String key) throws SQLException{
       JSONArray StationList=new JSONArray();
       Statement s=connection.createStatement();
       String sql="select s_name from station where s_name like '%"+key+"%'";
       ResultSet executeQuery = s.executeQuery(sql);
       ResultSetMetaData res=executeQuery.getMetaData();
       int numColumns = res.getColumnCount();
       while(executeQuery.next())
       {  
          for(int i=1;i<=numColumns;i++){
              StationList.add(executeQuery.getString(i));
          }

      }
        return StationList;
    }
    
    public String getStationId(String Station) throws SQLException{
       String station_id=null;
       Statement s=connection.createStatement();
       String sql="select id,s_name from station where s_name like '%"+Station+"%'";
       ResultSet executeQuery = s.executeQuery(sql);
       ResultSetMetaData res=executeQuery.getMetaData();
       int numColumns = res.getColumnCount();
       while(executeQuery.next())
       {  
          for(int i=1;i<=numColumns;i++){
              station_id=executeQuery.getString(i);
              break;
          }
          break;
      }
        return station_id;                
    }
      public List<Map<String,String>> fetchTrains(String start,String end) throws SQLException{
      
          String start_id=this.getStationId(start);
          String end_id=this.getStationId(end);
          String sql="SELECT a.`arrival_time` as sa_time,a.`departure_time` as sd_time,b.`arrival_time` as ea_time,b.`departure_time` as ed_time,a.trip_num as trip_id,c.train_id as train_id,d.train_no as train FROM `trip_details` a,trip_details b,trip c,trains d WHERE a.`station_id`='"+start_id+"' and b.`station_id`='"+end_id+"' and a.`trip_num`=b.`trip_num` and c.id=a.trip_num and d.id=c.train_id";
                  
          
          
          Statement s=connection.createStatement();
      ResultSet executeQuery = s.executeQuery(sql);
      ResultSetMetaData res=executeQuery.getMetaData();
      int numColumns = res.getColumnCount();
      List<Map<String,String>> list=new ArrayList<>();   
      Map<String,String> rows;
      while(executeQuery.next())
      {  
          rows=new HashMap();
          for(int i=1;i<=numColumns;i++){
             rows.put(res.getColumnLabel(i),executeQuery.getString(i));
              
         
          }

        list.add(rows);
      }
        
      return list;
    }
      
      public JSONObject getTripDetails(String Station_s,String Station_e) throws SQLException{
          JSONObject Trips=new JSONObject();
          String start_id=this.getStationId(Station_s);
          String end_id=this.getStationId(Station_e);
          String Start_lat=null;
          String Start_lng=null;
          String End_lat=null;
          String End_lng=null;
 
          String sql="SELECT a.id as id,a.`station_id` as start_id,b.`station_id` as end_id,a.route_id as start_route,b.route_id as                       end_route FROM `route_details` a,route_details b WHERE a.`station_id`='"+start_id+"' and b.`station_id`='"+end_id+"'  and a.`route_id`=b.`route_id` limit 1";
                   
          
            Statement s=connection.createStatement();
            ResultSet executeQuery = s.executeQuery(sql);
            ResultSetMetaData res=executeQuery.getMetaData();
            int numColumns = res.getColumnCount();
            JSONObject rows1 = new JSONObject();
            int LoopRun=0;
            while(executeQuery.next())
            {  
                for(int i=1;i<=numColumns;i++){
                    
                   rows1.put(res.getColumnLabel(i),executeQuery.getString(i));
                }
                LoopRun=1;

            }
            if(LoopRun==0){
             return this.AlternateTrip(start_id,end_id);
            }
            
            System.out.println(rows1.toString());
            if(Objects.equals(rows1.get("start_route"),rows1.get("end_route"))){
                    ResultSet executeQueryRoute = s.executeQuery("SELECT route_details.route_id,route_details.station_id,route_details.s_order_num,station.s_name,station.latitude,station.longitude,route_details.length_from_start FROM route_details INNER JOIN station ON route_details.station_id=station.id WHERE route_details.`route_id`='"+rows1.get("start_route")+"' ORDER BY route_details.s_order_num");
                    
                    ResultSetMetaData resRoute=executeQueryRoute.getMetaData();
                    int numColumnsRoute = resRoute.getColumnCount();
                     
                     JSONArray routeArray=new JSONArray();
                     String Start_Distance=null;
                     String End_Distance=null;
                        while(executeQueryRoute.next())
                        {  
                            JSONObject rowsRoute = new JSONObject();
                            for(int i=1;i<=numColumnsRoute;i++){
                               rowsRoute.put(resRoute.getColumnLabel(i),executeQueryRoute.getString(i));
                               if(Objects.equals(resRoute.getColumnLabel(i),"station_id")){
                                   if(Objects.equals(executeQueryRoute.getString(i),start_id)){
                                       Start_Distance=executeQueryRoute.getString("length_from_start");
                                       Start_lat=executeQueryRoute.getString("latitude");
                                       Start_lng=executeQueryRoute.getString("longitude");
                                   }
                                   else if(Objects.equals(executeQueryRoute.getString(i),end_id)){
                                       End_Distance=executeQueryRoute.getString("length_from_start");
                                       End_lat=executeQueryRoute.getString("latitude");
                                       End_lng=executeQueryRoute.getString("longitude");
                                   }
                               }
                            }
                            routeArray.add(rowsRoute);
                            
                        }
                        JSONArray jsons=new JSONArray();
                        jsons.add(routeArray);
                        Trips.put("route",jsons);
                        if(Start_Distance==null){
                             return new JSONObject();
                        }
                        else if(End_Distance==null){
                            return new JSONObject();
                        }
                        int Total_Distance=Integer.parseInt(Start_Distance)-Integer.parseInt(End_Distance);
                        int final_distance;
                        if(Total_Distance>=0){
                            final_distance=Total_Distance;
                        }
                        else{
                            final_distance=Total_Distance*-1;
                        }
                        System.err.println("Final Distance"+final_distance);
                        String fQ="SELECT MIN(`amt`) as amt FROM `fair` WHERE `min_distances`<="+final_distance+" and `max_distances`>"+final_distance+"";
                        ResultSet executeQueryFair = s.executeQuery(fQ);
                        ResultSetMetaData resFair=executeQueryFair.getMetaData();
                        int numColumnsFair = resFair.getColumnCount();
                        JSONObject rowsFair = new JSONObject();
                        while(executeQueryFair.next())
                        {  
                            for(int i=1;i<=numColumnsFair;i++){
                               rowsFair.put(resFair.getColumnLabel(i),executeQueryFair.getString(i));
                            }
                            break;

                        }
                        
                        Trips.put("fair",rowsFair.get("amt"));
                        Trips.put("start_lat",Start_lat);
                        Trips.put("start_lng",Start_lng);
                        Trips.put("end_lat",End_lat);
                        Trips.put("end_lng",End_lng);
            }
            else{
                System.err.println("No data");
            }
        
           return Trips;
      }

    private JSONObject AlternateTrip(String start_id,String end_id) throws SQLException {
    
          String Start_lat=null;
          String Start_lng=null;
          String End_lat=null;
          String End_lng=null;
        JSONObject Trip=new JSONObject();
        JSONArray MyjsonArray=new JSONArray();
        String sql="SELECT a.id as id,a.`station_id` as start_id,b.`station_id` as end_id,a.route_id as start_route,b.route_id as                       end_route FROM `route_details` a,route_details b WHERE a.`station_id`='"+start_id+"' and b.`station_id`='"+end_id+"'  limit 1 ";           
          JSONObject rows1 = new JSONObject();
        
            Statement s=connection.createStatement();
            ResultSet executeQuery = s.executeQuery(sql);
            ResultSetMetaData res=executeQuery.getMetaData();
            int numColumns = res.getColumnCount();
            
            while(executeQuery.next())
            {  
                System.err.println("error");
                   
                for(int i=1;i<=numColumns;i++){
                   rows1.put(res.getColumnLabel(i),executeQuery.getString(i));
                }
                break;

            }
            
            ResultSet executeQueryRoute1 = s.executeQuery("SELECT route_details.route_id,route_details.station_id,route_details.s_order_num,station.s_name,station.latitude,station.longitude,route_details.length_from_start FROM route_details INNER JOIN station ON route_details.station_id=station.id WHERE route_details.`route_id`='"+rows1.get("start_route")+"' ORDER BY route_details.s_order_num");
            
            ResultSetMetaData res1=executeQueryRoute1.getMetaData();
            int numColumns1 = res1.getColumnCount();
            
            while(executeQueryRoute1.next())
            {  
                JSONObject route1=new JSONObject();
           
                for(int i=1;i<=numColumns1;i++){
                    
                             route1.put(res1.getColumnLabel(i),executeQueryRoute1.getString(i));
                                   if(Objects.equals(res1.getColumnLabel(i),"station_id")){
                                   if(Objects.equals(executeQueryRoute1.getString(i),start_id)){
                                       Start_lat=executeQueryRoute1.getString("latitude");
                                       Start_lng=executeQueryRoute1.getString("longitude");
                                   }
                                   else if(Objects.equals(executeQueryRoute1.getString(i),end_id)){
                                       End_lat=executeQueryRoute1.getString("latitude");
                                       End_lng=executeQueryRoute1.getString("longitude");
                                   }
                                }
                 }
                MyjsonArray.add(route1);

            }
            ResultSet executeQueryRoute2 = s.executeQuery("SELECT route_details.route_id,route_details.station_id,route_details.s_order_num,station.s_name,station.latitude,station.longitude,route_details.length_from_start FROM route_details INNER JOIN station ON route_details.station_id=station.id WHERE route_details.`route_id`='"+rows1.get("end_route")+"' ORDER BY route_details.s_order_num");
            
            ResultSetMetaData res2=executeQueryRoute2.getMetaData();
           int numColumns2 = res2.getColumnCount();
 
            while(executeQueryRoute2.next())
            {  
               JSONObject route2=new JSONObject();

                for(int i=1;i<=numColumns2;i++){
                    
                   route2.put(res2.getColumnLabel(i),executeQueryRoute2.getString(i));
                                 if(Objects.equals(res2.getColumnLabel(i),"station_id")){
                                   if(Objects.equals(executeQueryRoute2.getString(i),start_id)){
                                       Start_lat=executeQueryRoute2.getString("latitude");
                                       Start_lng=executeQueryRoute2.getString("longitude");
                                   }
                                   else if(Objects.equals(executeQueryRoute2.getString(i),end_id)){
                                       End_lat=executeQueryRoute2.getString("latitude");
                                       End_lng=executeQueryRoute2.getString("longitude");
                                   }
                }
                MyjsonArray.add(route2);

              }
            }
            

            JSONArray jss=new JSONArray();
            Double distance=distance(Double.parseDouble(Start_lat),Double.parseDouble(Start_lng),Double.parseDouble(End_lat),Double.parseDouble(End_lng),"K");
            
            jss.add(MyjsonArray);
            
          String fQ="SELECT MIN(`amt`) as amt FROM `fair` WHERE `min_distances`<="+distance+" and `max_distances`>"+distance+"";
                        ResultSet executeQueryFair = s.executeQuery(fQ);
                        ResultSetMetaData resFair=executeQueryFair.getMetaData();
                        int numColumnsFair = resFair.getColumnCount();
                        JSONObject rowsFair = new JSONObject();
                        while(executeQueryFair.next())
                        {  
                            for(int i=1;i<=numColumnsFair;i++){
                               rowsFair.put(resFair.getColumnLabel(i),executeQueryFair.getString(i));
                            }
                            break;

                        }
                        System.err.println("Dis"+String.valueOf(distance));

            Trip.put("route",jss);
            Trip.put("fair",rowsFair.get("amt"));
            Trip.put("start_lat",Start_lat);
            Trip.put("start_lng",Start_lng);
            Trip.put("end_lat",End_lat);
            Trip.put("end_lng",End_lng);            
     
    
               return Trip;
    }
    
        private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		if (unit == "K") {
			dist = dist * 1.609344;
		} else if (unit == "N") {
			dist = dist * 0.8684;
		}

		return (dist);
	}

	/*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
	/*::	This function converts decimal degrees to radians						 :*/
	/*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	/*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
	/*::	This function converts radians to decimal degrees						 :*/
	/*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
    
}
