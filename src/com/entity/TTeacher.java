package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TTeacher entity. @author MyEclipse Persistence Tools
 */

public class TTeacher implements java.io.Serializable {

	// Fields

	private Integer id;
	private String teacherNo;
	private String teacherName;
	private String sex;
	private String phone;
	private String qq;
	private String email;
	private String wechat;
	private String address;
	private String photo;
	private String pstatus;
	private String job;
	private String password;
	private Set TCourses = new HashSet(0);

	// Constructors

	/** default constructor */
	public TTeacher() {
	}

	/** minimal constructor */
	public TTeacher(String teacherNo, String teacherName, String sex, String phone,
			String password) {
		this.teacherNo = teacherNo;
		this.teacherName = teacherName;
		this.sex = sex;
		this.phone = phone;
		this.password = password;
	}

	/** full constructor */
	public TTeacher(String teacherNo, String teacherName, String sex, String phone,
			String qq, String email, String wechat, String address,
			String photo, String pstatus, String job, String password,
			Set TCourses) {
		this.teacherNo = teacherNo;
		this.teacherName = teacherName;
		this.sex = sex;
		this.phone = phone;
		this.qq = qq;
		this.email = email;
		this.wechat = wechat;
		this.address = address;
		this.photo = photo;
		this.pstatus = pstatus;
		this.job = job;
		this.password = password;
		this.TCourses = TCourses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTeacherNo() {
		return this.teacherNo;
	}

	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWechat() {
		return this.wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPstatus() {
		return this.pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getJob() {
		return this.job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getTCourses() {
		return this.TCourses;
	}

	public void setTCourses(Set TCourses) {
		this.TCourses = TCourses;
	}

}