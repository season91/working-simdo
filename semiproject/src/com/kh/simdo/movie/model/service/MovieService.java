package com.kh.simdo.movie.model.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



import com.google.gson.Gson;
import com.kh.simdo.common.exception.DataAccessException;
import com.kh.simdo.common.exception.ToAlertException;
import com.kh.simdo.common.jdbc.JDBCTemplate;
import com.kh.simdo.common.util.http.HttpUtils;
import com.kh.simdo.movie.model.dao.MovieDao;
import com.kh.simdo.movie.model.vo.Movie;
import com.kh.simdo.movie.model.vo.Poster;

public class MovieService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	MovieDao movieDao = new MovieDao();
	
	public Map<String, Object> parseDb() {
		HttpUtils utils = new HttpUtils();
		String url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?ServiceKey=RLYJPR31F2X100MT6HX3&actor=이정재&collection=kmdb_new2&detail=Y&query=황정민";
		String jsonRes = utils.get(url);
		//System.out.println(jsonRes);
		Gson gson = new Gson();
		Map<String, Object> mapRes = gson.fromJson(jsonRes, Map.class);
		
		// 받은 자료 Data 값만 가져오게 분해 후 리턴
		ArrayList<String> dataList = (ArrayList<String>) mapRes.get("Data");
		String dataRes = gson.toJson(dataList.get(0));
		Map<String, Object> dataMap = gson.fromJson(dataRes, Map.class);

		// for문 반복사용 전 까지 맞춰줘야하므로 배열화까지 해서 리턴
		ArrayList<String> resultList = (ArrayList<String>) dataMap.get("Result");
		String resultRes = gson.toJson(resultList.get(0));
		Map<String, Object> resultMap = gson.fromJson(resultRes, Map.class);
		
		return resultMap;
		
	}

	public String parseThumb() {
		HttpUtils util = new HttpUtils();
		String clientId = "1TOE19GYAcgawcD0ESm1";
		String clientSecret = "tmgwvMjtQF";
		Gson gson = new Gson();
		String title = null;

		try {
			title = URLEncoder.encode("뉴뮤턴트", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + title +"&yearfrom=2010&yearto=2020"; // json 결과

		// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		String jsonRes = util.get(apiURL, requestHeaders);
		System.out.println(jsonRes);
		
		Map<String, Object> mapRes = gson.fromJson(jsonRes, Map.class);
		ArrayList<String> itemList = (ArrayList<String>) mapRes.get("items");
		String itemRes = gson.toJson(itemList.get(0));
		Map<String, Object> itemMap = gson.fromJson(itemRes, Map.class);
		String thumb = (String) itemMap.get("image");
		System.out.println(thumb);
		return thumb;
	}
	
	public int insertInfo(Movie movie) {
		Connection conn =jdt.getConnection();
		int res = 0;
		try {
			res = movieDao.insertInfo(conn, movie);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			// Dao에서 DataAccessException발동하면 여기서 잡히게됨. 그럼 ExceptionHandler로 안가지니깐
			// ToAlertException에 DataAccessException의 에러정보 전달해준다.
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		System.out.println("서비스");
		return res;
	}

	public int insertPoster(Poster poster) {
		Connection conn = jdt.getConnection();
		
		int res = 0;
		try {
			
			res = movieDao.insertPoster(conn, poster);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			// Dao에서 DataAccessException발동하면 여기서 잡히게됨. 그럼 ExceptionHandler로 안가지니깐
			// ToAlertException에 DataAccessException의 에러정보 전달해준다.
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		return res;
	}
}
