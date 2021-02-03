package com.kh.simdo.movie.controtller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.kh.simdo.movie.model.service.MovieService;
import com.kh.simdo.movie.model.vo.Movie;


/**
 * Servlet implementation class MovieController
 */
@WebServlet("/movie/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MovieService movieService = new MovieService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");

		
		switch (uriArr[uriArr.length - 1]) {
		case "db.do": setDB(); break;
		case "nationview.do": searchNation(request, response); break;
		case "scoreview.do":
			request.getRequestDispatcher("/WEB-INF/view/movie/scoreview.jsp").forward(request, response);
			break;
		case "reviewview.do":
			request.getRequestDispatcher("/WEB-INF/view/movie/reviewview.jsp").forward(request, response);
			break;
		case "detailview.do": readMore(request, response); break;
		case "searchview.do": searchTitle(request, response); break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void readMore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		// 영화 제목으로 영화정보 받아오기
		// 제목검색이랑 같이쓰려고했는데, 제목검색부분은 너프한기준이고 여기는 딱맞게 1개여애해서 따로 dao생성하기로 결심
		List<Movie> detailRes = movieService.selectDetail(title);
		List movieList = parseJson(detailRes);
		System.out.println(movieList);
		request.setAttribute("res", movieList);
		request.getRequestDispatcher("/WEB-INF/view/movie/detailview.jsp").forward(request, response);
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

	
	protected void searchNation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nation = request.getParameter("nation");
		String genre = request.getParameter("genre");
		List movieList = new ArrayList();
		
		if(nation == null && genre != null) {
			System.out.println("장르로조회");
			List<Movie> genreRes = movieService.selectGenre(genre);
			movieList = parseJson(genreRes);
			System.out.println(movieList);
		} else if(nation != null && genre == null){
			System.out.println("나라로 조회");
			List<Movie> nationRes = movieService.selectNation(nation);
			movieList = parseJson(nationRes);
			System.out.println(movieList);
		}
		request.setAttribute("res", movieList);
		request.getRequestDispatcher("/WEB-INF/view/movie/nationview.jsp").forward(request, response);
	}

	
	protected void searchTitle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchTitle = request.getParameter("search");

		// 영화정보 받아오기 
		List<Movie> searchRes = movieService.selectSearchTitle(searchTitle);
		List movieList = parseJson(searchRes);
		
		request.setAttribute("res", movieList);
		request.getRequestDispatcher("/WEB-INF/view/movie/searchview.jsp").forward(request, response);
	}

	protected Map<String, Object> listSeparation(Map<String, Object> map, String beforecategory, String aftercategory) {
		Gson gson = new Gson();
		Map<String, Object> resMap = (Map<String, Object>) map.get(beforecategory);
		ArrayList<String> resList = (ArrayList<String>) resMap.get(aftercategory);
		String resStr = gson.toJson(resList.get(0));
		Map<String, Object> res = gson.fromJson(resStr, Map.class);

		return res;
	}

	protected Date transformDate(String strDate) {
		// 개봉일자는 String -> util.date -> sql.date 로 변환을 해주어야 한다.
		// util.date로 변환해주기.
		SimpleDateFormat beforFormat = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date tempDate = null;
		try {
			tempDate = beforFormat.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// sql.date로 변환해주기.
		String transDate = afterFormat.format(tempDate);
		Date date = Date.valueOf(transDate);
		return date;
	}

	protected Movie addMovieVo(Map<String, Object> movieDB, String thumbnail) {
		// 1. KMDB 영화정보 넣어주기

		Gson gson = new Gson();
		Movie movie = null;

		movie = new Movie();
		movie.setMvNo((String) movieDB.get("DOCID"));
		movie.setMvTitle((String) movieDB.get("title"));
		movie.setMvTitleorg((String) movieDB.get("titleOrg"));

		// 한번더 분해
		Map<String, Object> directDB = listSeparation(movieDB, "directors", "director");
		movie.setDirector((String) directDB.get("directorNm"));

		movie.setGenre((String) movieDB.get("genre"));

		// 개봉일자는 String -> util.date -> sql.date 로 변환을 해주어야 한다.
		Date date = transformDate((String) movieDB.get("repRlsDate"));
		movie.setReleaseDate(date);

		// 한번더 분해
		Map<String, Object> plotDB = listSeparation(movieDB, "plots", "plot");
		movie.setPlot((String) plotDB.get("plotText"));

		movie.setNation((String) movieDB.get("nation"));
		movie.setRuntime(Integer.parseInt((String) movieDB.get("runtime")));
		movie.setRating((String) movieDB.get("rating"));

		String str = (String) movieDB.get("posters");
		String[] pstArr = str.split("[|]");
		movie.setPoster(pstArr[0]);
		
		// 2.네이버 API 영화 썸네일 넣어주기

		movie.setThumbnail(thumbnail);

		return movie;

	}

	protected void setDB() {

		// 여기선 2가지 API를 섞어서 쓸것임
		// 기본정보는 KMDB를 사용
		// 썸네일정보는 달력API에서 동일규격 포스터사이즈를 사용해야하기에 네이버 영화 API 사용

		// KMDB 받은 자료
		Map<String, Object> movieDB = movieService.parseDb();
		// 네이버 API 받은 자료
		String thumbnail = movieService.parseThumb();
		// movie.vo에 넣어주기

		Movie movie = addMovieVo(movieDB, thumbnail);
		//System.out.println(movie);
		// DB에 movie넣는걸 성공했다면 성공알람 실패시 실패 알람
//		int movieRes = MovieService.insertMovieInfo(movie);
//		if (movieRes > 0) {
//			System.out.println("movie성공");
//		} else {
//			System.out.println("movie실패");
//		}
	}
}
