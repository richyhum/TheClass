package com.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TClass entity. @author MyEclipse Persistence Tools
 */

public class TClass implements java.io.Serializable {

	// Fields

	private Integer id;
	private String className;
	private String memo;
	private Timestamp admidate;
	private String photo;
	private Set TStudents = new HashSet(0);

	// Constructors

	/** default constructor */
	public TClass() {
	}

	/** minimal constructor */
	public TClass(String className, Timestamp admidate) {
		this.className = className;
		this.admidate = admidate;
	}

	/** full constructor */
	public TClass(String className, String memo, Timestamp admidate, String photo,
			Set TStudents) {
		this.className = className;
		this.memo = memo;
		this.admidate = admidate;
		this.photo = photo;
		this.TStudents = TStudents;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Timestamp getAdmidate() {
		return this.admidate;
	}

	public void setAdmidate(Timestamp admidate) {
		this.admidate = admidate;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Set getTStudents() {
		return this.TStudents;
	}

	public void setTStudents(Set TStudents) {
		this.TStudents = TStudents;
	}

}