package com.entity;

/**
 * TGrade entity. @author MyEclipse Persistence Tools
 */

public class TGrade implements java.io.Serializable {

	// Fields

	private Integer id;
	private TCourse TCourse;
	private TStudent TStudent;
	private Double dailygrade;
	private Double examgrade;
	private Double finalgrade;

	// Constructors

	/** default constructor */
	public TGrade() {
	}

	/** full constructor */
	public TGrade(TCourse TCourse, TStudent TStudent, Double dailygrade,
			Double examgrade, Double finalgrade) {
		this.TCourse = TCourse;
		this.TStudent = TStudent;
		this.dailygrade = dailygrade;
		this.examgrade = examgrade;
		this.finalgrade = finalgrade;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TCourse getTCourse() {
		return this.TCourse;
	}

	public void setTCourse(TCourse TCourse) {
		this.TCourse = TCourse;
	}

	public TStudent getTStudent() {
		return this.TStudent;
	}

	public void setTStudent(TStudent TStudent) {
		this.TStudent = TStudent;
	}

	public Double getDailygrade() {
		return this.dailygrade;
	}

	public void setDailygrade(Double dailygrade) {
		this.dailygrade = dailygrade;
	}

	public Double getExamgrade() {
		return this.examgrade;
	}

	public void setExamgrade(Double examgrade) {
		this.examgrade = examgrade;
	}

	public Double getFinalgrade() {
		return this.finalgrade;
	}

	public void setFinalgrade(Double finalgrade) {
		this.finalgrade = finalgrade;
	}

}