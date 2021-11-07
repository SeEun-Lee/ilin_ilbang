package com.ilin_ilbang.domain;

import java.util.Date;

import lombok.Data;

public class MemberVO {
	//아이디
	private String mid;
	//비밀번호
	private String mpw;
	//이름
	private String mname;
	//생년월일
	private String mbirth;
	//성별
	private String mgender;
	//주소
	private String maddr;
	//전화번호
	private String mtel;
	//이메일
	private String memail;
	
	
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mbirth=" + mbirth + ", mgender="
				+ mgender + ", maddr=" + maddr + ", mtel=" + mtel + ", memail=" + memail + ", getMid()=" + getMid()
				+ ", getMpw()=" + getMpw() + ", getMname()=" + getMname() + ", getMbirth()=" + getMbirth()
				+ ", getMgender()=" + getMgender() + ", getMaddr()=" + getMaddr() + ", getMtel()=" + getMtel()
				+ ", getMemail()=" + getMemail() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
}
