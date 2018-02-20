package com.model.feescategory.dto;

// default package
// Generated 6 Dec, 2014 11:27:37 AM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Feescategory generated by hbm2java
 */
@Entity
@Table(name = "feescategory", catalog = "school")
public class Feescategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idfeescategory;
	private String feescategoryname;
	private Integer amount;
	private String particularname;

	public Feescategory() {
	}

	public Feescategory(String feescategoryname, Integer amount, String particularname) {
		this.feescategoryname = feescategoryname;
		this.amount = amount;
		this.particularname = particularname;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "idfeescategory", unique = true, nullable = false)
	public Integer getIdfeescategory() {
		return this.idfeescategory;
	}

	public void setIdfeescategory(Integer idfeescategory) {
		this.idfeescategory = idfeescategory;
	}

	@Column(name = "feescategory", length = 150)
	public String getFeescategoryname() {
		return this.feescategoryname;
	}

	public void setFeescategoryname(String feescategoryname) {
		this.feescategoryname = feescategoryname;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "particularname", length = 150)
	public String getParticularname() {
		return particularname;
	}

	public void setParticularname(String particularname) {
		this.particularname = particularname;
	}

}
