
package com.joalib.booksearch.svc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.joalib.DTO.SearchDTO;

public class BookSearchService {
	JSONArray parse_listArr = null;
	JSONObject book = null;

	public JSONArray search(SearchDTO sdto) {
		
		String option = sdto.getOption();
		if(option.equals("book_title")) {
			option = "title";
		}
		String sch = sdto.getText();
		String check = sdto.getCheck();
		
		

		
		try {
            
            String serviceKey = "F295C5452830D9CAF5F5491F4ED42374C1D85ADAAF3CA22E4C6A27864CAB2684";
           
            String urlStr = "http://book.interpark.com/api/search.api";
            urlStr += "?"+ URLEncoder.encode("key","UTF-8") +"=" + serviceKey;
            urlStr += "&"+ URLEncoder.encode("query","UTF-8")+"=" + URLEncoder.encode(sch,"UTF-8");  
            urlStr += "&"+ URLEncoder.encode("queryType","UTF-8")+"=" + option;
            urlStr += "&"+ URLEncoder.encode("maxResults","UTF-8")+ "=" + "20";
            urlStr += "&"+ URLEncoder.encode("categoryId","UTF-8") +"=" + check;
            urlStr += "&"+ URLEncoder.encode("output","UTF-8") +"=json";
            
            URL url = new URL(urlStr);

            String line = "";
            String result = "";
            
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8" ));	
            while ((line = br.readLine()) != null) {	
                result = result.concat(line);			        
            }
            
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            parse_listArr = (JSONArray)obj.get("item");

            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        } return parse_listArr;		
	}	
}

