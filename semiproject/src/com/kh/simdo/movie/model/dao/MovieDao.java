package com.kh.simdo.movie.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.simdo.common.code.ErrorCode;
import com.kh.simdo.common.exception.DataAccessException;
import com.kh.simdo.common.jdbc.JDBCTemplate;
import com.kh.simdo.movie.model.vo.Movie;
import com.kh.simdo.movie.model.vo.Poster;

public class MovieDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public int insertInfo(Connection conn, Movie movie) {
		//commit rollback 해야하는 기능
		
		int res = 0;
		PreparedStatement pstm = null;
		try {
			
			String query = "insert into mv_basic_info(mv_no, mv_title, mv_titleorg, director, genre, release_date, plot, nation, runtime, rating, thumbnail) "+
					"values(?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1,movie.getMvNo());
			pstm.setString(2, movie.getMvTitle());
			pstm.setString(3, movie.getMvTitleorg());
			pstm.setString(4, movie.getDirector());
			pstm.setString(5, movie.getGenre());
			pstm.setDate(6, movie.getReleaseDate());
			pstm.setString(7, movie.getPlot());
			pstm.setString(8, movie.getNation());
			pstm.setInt(9, movie.getRuntime());
			pstm.setString(10, movie.getRating());
			pstm.setString(11, movie.getThumbnail());
			res = pstm.executeUpdate(); 
			// 실행하면 실제로 db에 dml구문이 실행되며 row 한줄이 들어간다, 리턴값은 쿼리로인해 영향(추가변경삭제)받은 row의 수를 반환! 1줄추가되면 res가 1, 실패라면 0
			// res로 결과반영여부 판단
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IM01,e);
		} finally {
			jdt.close(pstm);
		}

		return res;
	}


	public int insertPoster(Connection conn, Poster poster) {
		int res = 0;
		PreparedStatement pstm = null;
		String sql = "insert into mv_poster_image(PST_NO, MV_NO, PST_IMG) values(sc_pst_no.nextval,?,?)";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, poster.getMvNo());
			pstm.setString(2, poster.getPstImg());
			res= pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IM01,e);
			
		} finally {
			jdt.close(pstm);
		}
		
		return res;
	}
}
