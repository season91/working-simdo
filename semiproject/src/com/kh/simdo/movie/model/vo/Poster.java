package com.kh.simdo.movie.model.vo;

public class Poster {
	
	private int pstNo;
	private String pstImg;
	private String mvNo;
	
	public int getPstNo() {
		return pstNo;
	}
	public void setPstNo(int pstNo) {
		this.pstNo = pstNo;
	}
	public String getPstImg() {
		return pstImg;
	}
	public void setPstImg(String pstImg) {
		this.pstImg = pstImg;
	}
	public String getMvNo() {
		return mvNo;
	}
	public void setMvNo(String mvNo) {
		this.mvNo = mvNo;
	}
	@Override
	public String toString() {
		return "Poster [pstNo=" + pstNo + ", pstImg=" + pstImg + ", mvNo=" + mvNo + "]";
	}
	
	
	

}
