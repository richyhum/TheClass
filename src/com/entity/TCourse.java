package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TCourse entity. @author MyEclipse Persistence Tools
 */

public class TCourse implements java.io.Serializable {

	// Fields

	private Integer id;
	private TTeacher TTeacher;
	private String courseName;
	private String courseNo;
	private Integer hours;
	private Double credit;
	private Short dailyper;
	private Short examper;
	private String syllabus;
	private String teachingplan;
	private String courseware;
	private Set TGrades = new HashSet(0);

	// Constructors

	/** default constructor */
	public TCourse() {
	}

	/** minimal constructor */
	public TCourse(String courseName, String courseNo, Integer hours, Double credit,
			Short dailyper, Short examper) {
		this.courseName = courseName;
		this.courseNo = courseNo;
		this.hours = hours;
		this.credit = credit;
		this.dailyper = dailyper;
		this.examper = examper;
	}

	/** full constructor */
	public TCourse(TTeacher TTeacher, String courseName, String courseNo,
			Integer hours, Double credit, Short dailyper, Short examper,
			String syllabus, String teachingplan, String courseware, Set TGrades) {
		this.TTeacher = TTeacher;
		this.courseName = courseName;
		this.courseNo = courseNo;
		this.hours = hours;
		this.credit = credit;
		this.dailyper = dailyper;
		this.examper = examper;
		this.syllabus = syllabus;
		this.teachingplan = teachingplan;
		this.courseware = courseware;
		this.TGrades = TGrades;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TTeacher getTTeacher() {
		return this.TTeacher;
	}

	public void setTTeacher(TTeacher TTeacher) {
		this.TTeacher = TTeacher;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseNo() {
		return this.courseNo;
	}

	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}

	public Integer getHours() {
		return this.hours;
	}

	public void setHours(Integer hours) {
		this.hours = hours;
	}

	public Double getCredit() {
		return this.credit;
	}

	public void setCredit(Double credit) {
		this.credit = credit;
	}

	public Short getDailyper() {
		return this.dailyper;
	}

	public void setDailyper(Short dailyper) {
		this.dailyper = dailyper;
	}

	public Short getExamper() {
		return this.examper;
	}

	public void setExamper(Short examper) {
		this.examper = examper;
	}

	public String getSyllabus() {
		return this.syllabus;
	}

	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}

	public String getTeachingplan() {
		return this.teachingplan;
	}

	public void setTeachingplan(String teachingplan) {
		this.teachingplan = teachingplan;
	}

	public String getCourseware() {
		return this.courseware;
	}

	public void setCourseware(String courseware) {
		this.courseware = courseware;
	}

	public Set getTGrades() {
		return this.TGrades;
	}

	public void setTGrades(Set TGrades) {
		this.TGrades = TGrades;
	}

}