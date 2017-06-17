package com.entity;

import java.sql.Timestamp;

/**
 * TWorks entity. @author MyEclipse Persistence Tools
 */

public class TWorks implements java.io.Serializable {

	// Fields

	private Integer id;
	private TStudent TStudent;
	private String type;
	private String worksName;
	private String memoe;
	private String webaddr;
	private Timestamp startdate;
	private Timestamp enddate;
	private String teachers;

	// Constructors

	/** default constructor */
	public TWorks() {
	}

	/** minimal constructor */
	public TWorks(String type) {
		this.type = type;
	}

	/** full constructor */
	public TWorks(TStudent TStudent, String type, String worksName, String memoe,
			String webaddr, Timestamp startdate, Timestamp enddate,
			String teachers) {
		this.TStudent = TStudent;
		this.type = type;
		this.worksName = worksName;
		this.memoe = memoe;
		this.webaddr = webaddr;
		this.startdate = startdate;
		this.enddate = enddate;
		this.teachers = teachers;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TStudent getTStudent() {
		return this.TStudent;
	}

	public void setTStudent(TStudent TStudent) {
		this.TStudent = TStudent;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWorksName() {
		return this.worksName;
	}

	public void setWorksName(String worksName) {
		this.worksName = worksName;
	}

	public String getMemoe() {
		return this.memoe;
	}

	public void setMemoe(String memoe) {
		this.memoe = memoe;
	}

	public String getWebaddr() {
		return this.webaddr;
	}

	public void setWebaddr(String webaddr) {
		this.webaddr = webaddr;
	}

	public Timestamp getStartdate() {
		return this.startdate;
	}

	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}

	public Timestamp getEnddate() {
		return this.enddate;
	}

	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}

	public String getTeachers() {
		return this.teachers;
	}

	public void setTeachers(String teachers) {
		this.teachers = teachers;
	}

}