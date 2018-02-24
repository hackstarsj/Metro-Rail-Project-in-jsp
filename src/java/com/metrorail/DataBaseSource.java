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
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            

//      sql="SELECT `id`, `a_name`, `a_address`, `phone_num`, `email`, `age`, `gender`, `permission`, `designation`, `password` FROM `admin`";
      Statement s=connection.createStatement();
      ResultSet executeQuery = s.executeQuery(sql);
      ResultSetMetaData res=executeQuery.getMetaData();
      int numColumns = res.getColumnCount();
      List<Map<String,String>> list=new ArrayList<>();   
      Map<String,String> rows;
      while(executeQuery.next())
      {  
          rows=new HashMap();
          for(int i=1;i<numColumns;i++){
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
    
}
