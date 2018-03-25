/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metrorail;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
/**
 *
 * @author sanjeev
 */
public class PayMentCheckApi {

        
	private static final String USER_AGENT = "Mozilla/5.0";


 


	public JSONObject  CheckPaymentProcess(String Pay_id) throws IOException {
	        String POST_URL = "https://test.instamojo.com/api/1.1/payments/"+Pay_id;
          
		URL obj = new URL(POST_URL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);
                con.setRequestProperty("X-Api-Key","test_e1b0cf472589266636d94650e52");
                con.setRequestProperty("X-Auth-Token", "test_d89d34a5e25be4af17337d8c8f2");


		int responseCode = con.getResponseCode();
                JSONObject res=new JSONObject();
		System.out.println("POST Response Code :: " + responseCode);

			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			System.out.println(response.toString());
                       String allda=response.toString();
                       JSONParser jSONParser=new org.json.simple.parser.JSONParser();
            try {
                res=(JSONObject)jSONParser.parse(allda);
            } catch (ParseException ex) {
                Logger.getLogger(PayMentApi.class.getName()).log(Level.SEVERE, null, ex);
            }
                           
                return res;
	}

}
