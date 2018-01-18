package com.model.attendance.dto;

// default package
// Generated 22 Dec, 2017 4:15:19 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Weeklyoff generated by hbm2java
 */
@Entity
@Table(name = "weeklyoff", catalog = "school")
public class Weeklyoff implements java.io.Serializable {

	private Integer wid;
	private String weeklyoffday;
	private String academicyear;

	public Weeklyoff() {
	}

	public Weeklyoff(String weeklyoffday) {
		this.weeklyoffday = weeklyoffday;
	}

	public Weeklyoff(String weeklyoffday, String academicyear) {
		this.weeklyoffday = weeklyoffday;
		this.academicyear = academicyear;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "wid", unique = true, nullable = false)
	public Integer getWid() {
		return this.wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	@Column(name = "weeklyoffday", nullable = false, length = 100)
	public String getWeeklyoffday() {
		return this.weeklyoffday;
	}

	public void setWeeklyoffday(String weeklyoffday) {
		this.weeklyoffday = weeklyoffday;
	}

	@Column(name = "academicyear", length = 10)
	public String getAcademicyear() {
		return this.academicyear;
	}

	public void setAcademicyear(String academicyear) {
		this.academicyear = academicyear;
	}

}
