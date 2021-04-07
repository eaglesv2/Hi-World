package com.hiworld.article.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.google.gson.Gson;

public class test {
	public static void main(String[] args) throws Exception {
		
		/* 오늘 날짜 가져오기 */
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Date day = new Date();
        
        String today = format.format(day);
        
        /* 어제 날짜 가져오기 */
        day.setDate(day.getDate()-1);
        String yesterday = format.format(day);
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=VnbK%2FXlPOfVybOeQsORLUuM0%2FsFZnarpLmP75wVkDQ8Hmiabt7WMAaQ276L8IUxGg92NdZJ%2BgMOsxIN7kZqELw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(yesterday, "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        int first = 0;
        int last = 0;
        
        System.out.println(today);
        System.out.println(yesterday);
//      현재 완치자
        String todayclear = sb.toString();
        first = todayclear.indexOf("<clearCnt>")+10;
        last = todayclear.indexOf("</clearCnt>");
        todayclear = todayclear.substring(first,last); 
        System.out.println(todayclear);
        
//      현재 확진자  
        String totalCovid = sb.toString();
        first = totalCovid.indexOf("<decideCnt>")+11;
        last = totalCovid.indexOf("</decideCnt>");
        totalCovid = totalCovid.substring(first, last);
        System.out.println(totalCovid);
        
//      어제 확진자
        String yesterDayCovid = sb.toString();
        yesterDayCovid = yesterDayCovid.substring(yesterDayCovid.indexOf(today),yesterDayCovid.indexOf(yesterday));
        first = yesterDayCovid.indexOf("<decideCnt>")+11;
        last = yesterDayCovid.indexOf("</decideCnt>");
        yesterDayCovid = yesterDayCovid.substring(first, last);
        System.out.println(yesterDayCovid);
        
//      오늘 확진자 수
        String todayCovid = String.valueOf(Integer.parseInt(totalCovid)-Integer.parseInt(yesterDayCovid));
        System.out.println(todayCovid);
        
        ArrayList<String> Covid19 = new ArrayList<String>();
        Covid19.add(todayclear);
        Covid19.add(totalCovid);
        Covid19.add(todayCovid);
        Covid19.add(today);
        
        Gson gson = new Gson();
		
	}
}
