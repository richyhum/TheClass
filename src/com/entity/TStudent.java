package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TStudent entity. @author MyEclipse Persistence Tools
 */

public class TStudent implements java.io.Serializable {

	// Fields

	private Integer id;
	private TClass TClass;
	private String studentName;
	private String studentNo;
	private String sex;
	private String phone;
	private String qq;
	private String email;
	private String wechat;
	private String address;
	private String webaddr;
	private String photo;
	private String pstatus;
	private String job;
	private String password;
	private String admin;
	private Set TGrades = new HashSet(0);
	private Set TWorkses = new HashSet(0);

	// Constructors

	/** default constructor */
	public TStudent() {
	}

	/** minimal constructor */
	public TStudent(String studentName, String studentNo, String sex, String phone,
			String admin) {
		this.studentName = studentName;
		this.studentNo = studentNo;
		this.sex = sex;
		this.phone = phone;
		this.admin = admin;
	}

	/** full constructor */
	public TStudent(TClass TClass, String studentName, String studentNo, String sex,
			String phone, String qq, String email, String wechat,
			String address, String webaddr, String photo, String pstatus,
			String job, String password, String admin, Set TGrades, Set TWorkses) {
		this.TClass = TClass;
		this.studentName = studentName;
		this.studentNo = studentNo;
		this.sex = sex;
		this.phone = phone;
		this.qq = qq;
		this.email = email;
		this.wechat = wechat;
		this.address = address;
		this.webaddr = webaddr;
		this.photo = photo;
		this.pstatus = pstatus;
		this.job = job;
		this.password = password;
		this.admin = admin;
		this.TGrades = TGrades;
		this.TWorkses = TWorkses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TClass getTClass() {
		return this.TClass;
	}

	public void setTClass(TClass TClass) {
		this.TClass = TClass;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentNo() {
		return this.studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
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

	public String getWebaddr() {
		return this.webaddr;
	}

	public void setWebaddr(String webaddr) {
		this.webaddr = webaddr;
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

	public String getAdmin() {
		return this.admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public Set getTGrades() {
		return this.TGrades;
	}

	public void setTGrades(Set TGrades) {
		this.TGrades = TGrades;
	}

	public Set getTWorkses() {
		return this.TWorkses;
	}

	public void setTWorkses(Set TWorkses) {
		this.TWorkses = TWorkses;
	}

}