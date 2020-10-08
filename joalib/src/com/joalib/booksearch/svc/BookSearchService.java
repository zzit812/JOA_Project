
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
		
		String option = sdto.getOption();  //isbn
		String sch = sdto.getText();  //isbn
		String page = sdto.getPage();
		String check = sdto.getCheck();

		

		
		try {
            
            String serviceKey = "F295C5452830D9CAF5F5491F4ED42374C1D85ADAAF3CA22E4C6A27864CAB2684";
           //http://book.interpark.com/api/search.api?key=interpark&query=ISBN媛�&queryType=isbn   :  ISBN�쑝濡� 寃��깋�븯湲�
           //http://book.interpark.com/api/search.api?key=interpark4&query=寃��깋�븳 媛�&sort=publishTime
           
            String urlStr = "http://book.interpark.com/api/search.api";
            urlStr += "?"+ URLEncoder.encode("key","UTF-8") +"=" + serviceKey;
            urlStr += "&"+ URLEncoder.encode("query","UTF-8")+"=" + URLEncoder.encode(sch,"UTF-8");  
            urlStr += "&"+ URLEncoder.encode("queryType","UTF-8")+"=" + option;  //option ) all, title, author, publisher
            urlStr += "&"+ URLEncoder.encode("maxResults","UTF-8")+ "=" + "20"; //
           // urlStr += "&"+ URLEncoder.encode("start","UTF-8")+ "=" + page;
            urlStr += "&"+ URLEncoder.encode("categoryId","UTF-8") +"=" + check;
            urlStr += "&"+ URLEncoder.encode("output","UTF-8") +"=json";
            
            URL url = new URL(urlStr);
            
           //System.out.println(url);
            
            String line = "";
            String result = "";
            
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8" ));	
            while ((line = br.readLine()) != null) {	
                result = result.concat(line);			
                //System.out.println(line);              
            }            
            
         
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            
           // JSONArray parse_listArr = (JSONArray)obj.get("item");
            parse_listArr = (JSONArray)obj.get("item");
            //�뿬湲곗뿉 寃��깋 �젙蹂닿� �떎 �떞寃⑥엳�쓬
            //   [{"mileageRate":"6","discountRate":"10",....}] �씠�윴�떇�쑝濡�
            
            
          

//            JSONObject weather = (JSONObject) parse_listArr.get(0);
//            System.out.println(weather.get("title"));
//            
         
            // {"returnType":"json","clearDate":"--",.......},... 
            
            
//            for (int i=0;i< parse_listArr.size();i++) {
//            	System.out.println((i+1)+".");
//                book = (JSONObject) parse_listArr.get(i);
//                
//                
//                String title = (String) book.get("title");
//                System.out.println( "title : "+title );
//                String author  = (String) book.get("author");        	
//                System.out.println( "author: "+author );
//                String publisher = (String) book.get("publisher");        	
//                System.out.println( "publisher : "+publisher );
//                String coverLargeUrl = (String) book.get("coverLargeUrl");   
//                System.out.println( "coverLargeUrl: "+coverLargeUrl );

//                String description = (String) book.get("description");    	
//                System.out.println( "description : "+description );
//                String pubDate = (String) book.get("pubDate");        	
//                System.out.println( "pubDate : "+pubDate );
//                String isbn  = (String) book.get("isbn");        		
//                System.out.println( "ISBN : "+isbn );
//                String categoryId  = (String) book.get("categoryId");      
//                System.out.println( "categoryId : "+categoryId );
//                System.out.println("=====================================================");
//            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        } return parse_listArr;
        //book ���떊 
		
		
		
		
		
		
	}

	
}
