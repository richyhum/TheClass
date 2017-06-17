package com.entity;

import java.sql.Timestamp;

/**
 * TWinning entity. @author MyEclipse Persistence Tools
 */

public class TWinning implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String awardsName;
	private String students;
	private String teachers;
	private String department;
	private String level;
	private Double amount;
	private Timestamp windate;
	private String memo;
	private String honor;

	// Constructors

	/** default constructor */
	public TWinning() {
	}

	/** minimal constructor */
	public TWinning(String type, String awardsName, String students, String teachers,
			Timestamp windate) {
		this.type = type;
		this.awardsName = awardsName;
		this.students = students;
		this.teachers = teachers;
		this.windate = windate;
	}

	/** full constructor */
	public TWinning(String type, String awardsName, String students, String teachers,
			String department, String level, Double amount, Timestamp windate,
			String memo, String honor) {
		this.type = type;
		this.awardsName = awardsName;
		this.students = students;
		this.teachers = teachers;
		this.department = department;
		this.level = level;
		this.amount = amount;
		this.windate = windate;
		this.memo = memo;
		this.honor = honor;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAwardsName() {
		return this.awardsName;
	}

	public void setAwardsName(String awardsName) {
		this.awardsName = awardsName;
	}

	public String getStudents() {
		return this.students;
	}

	public void setStudents(String students) {
		this.students = students;
	}

	public String getTeachers() {
		return this.teachers;
	}

	public void setTeachers(String teachers) {
		this.teachers = teachers;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Timestamp getWindate() {
		return this.windate;
	}

	public void setWindate(Timestamp windate) {
		this.windate = windate;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getHonor() {
		return this.honor;
	}

	public void setHonor(String honor) {
		this.honor = honor;
	}

}