package com.kh.simdo.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.simdo.movie.model.vo.Movie;
/**
 * @author 조아영
 */

@WebServlet("/mypage/*")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");
		
		switch (uriArr[uriArr.length-1]) {
		case "myqnadetail.do" :qnaDetail(request,response); break;
		case "myqnalist.do": 
			// 페이징 표현해주는 메서드
			String text = request.getParameter("page");
			List movieList = new ArrayList();
			int page = 0;
			if(text == null) {
				page++;
				
			} else {
				page = Integer.parseInt(text);
			}
			
			request.setAttribute("res", movieList);
			request.setAttribute("page", page);
			//score 글번호 releaseDate 작성일자 mvTitle 글제목
			
			request.getRequestDispatcher("/WEB-INF/view/mypage/myqnalist.jsp").forward(request, response);	
			break;
		case "mycalendar.do": request.getRequestDispatcher("/WEB-INF/view/mypage/mycalendar.jsp").forward(request, response);
		default:
			break;
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	 protected List parseJson(List<Movie> res) {
			List list = new ArrayList();
			Map<String, Object> commandMap = new HashMap<String, Object>();
			for (int i = 0; i < res.size(); i++) {
				String json = new Gson().toJson(res.get(i));
				commandMap = new Gson().fromJson(json, Map.class);
				list.add(commandMap);
			}
			return list;
		}
	    
	    protected void qnaDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String title = request.getParameter("title");
			request.getRequestDispatcher("/WEB-INF/view/mypage/myqnadetail.jsp").forward(request, response);
		}

}
