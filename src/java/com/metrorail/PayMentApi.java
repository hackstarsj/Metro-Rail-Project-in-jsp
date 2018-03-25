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
public class PayMentApi {

        
	private static final String USER_AGENT = "Mozilla/5.0";

	private static final String POST_URL = "https://test.instamojo.com/api/1.1/payment-requests/";

 


	public JSONObject  sendPOST(String amount,String phone,String name,String email) throws IOException {
          
            String POST_PARAMS = "purpose=MetroCard&amount="+amount+"&phone=+919205878477&buyer_name="+name+"&redirect_url=http://marvellouswebsites.com/sanjeev/res.php&send_email=true&webhook=http://marvellouswebsites.com/sanjeev/res.php&send_sms=true&email="+email+"&allow_repeated_payments=false";
            
		URL obj = new URL(POST_URL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
                con.setRequestProperty("X-Api-Key","test_e1b0cf472589266636d94650e52");
                con.setRequestProperty("X-Auth-Token", "test_d89d34a5e25be4af17337d8c8f2");

		// For POST only - START
                System.err.println(POST_PARAMS);
		con.setDoOutput(true);
		OutputStream os = con.getOutputStream();
		os.write(POST_PARAMS.getBytes());
		os.flush();
		os.close();
		// For POST only - END

		int responseCode = con.getResponseCode();
                JSONObject res=new JSONObject();
		System.out.println("POST Response Code :: " + responseCode);

		//if (responseCode == HttpURLConnection.HTTP_OK) { //success
			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			// print result
			System.out.println(response.toString());
                       String allda=response.toString();
                       JSONParser jSONParser=new org.json.simple.parser.JSONParser();
            try {
                res=(JSONObject)jSONParser.parse(allda);
            } catch (ParseException ex) {
                Logger.getLogger(PayMentApi.class.getName()).log(Level.SEVERE, null, ex);
            }
                           
		//} else {
			System.out.println("POST request not worked");
		//}
                return res;
	}

}
