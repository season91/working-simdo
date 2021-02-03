package com.kh.simdo.papago;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.kh.simdo.common.util.http.HttpUtils;

public class PapagoService {

	public String papagoAPI(String paramText) {
		Gson gson = new Gson();
		HttpUtils util = new HttpUtils();
		String clientId = "1TOE19GYAcgawcD0ESm1";
		String clientSecret = "tmgwvMjtQF";
		
		String apiURL = "https://openapi.naver.com/v1/papago/n2mt"; 
		String text;
		String body;
		String lan = "ja";
		try {
			text = URLEncoder.encode(paramText, "UTF-8");
			body = "source=ko&target="+lan+"&text=" + text;
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("번역 인코딩 실패", e);
		}

		// json 결과

		// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		String jsonRes = util.post(apiURL, body, requestHeaders);
		Map<String, Object> mapRes = gson.fromJson(jsonRes, Map.class);

		//ArrayList<String> itemList = (ArrayList<String>) mapRes.get("message");
		Map<String, Object> mapRes1 = (Map<String, Object>) mapRes.get("message");
		Map<String, Object> mapRes2 = (Map<String, Object>) mapRes1.get("result");
		String res = (String) mapRes2.get("translatedText");
		return res;
	}
	
	
}
