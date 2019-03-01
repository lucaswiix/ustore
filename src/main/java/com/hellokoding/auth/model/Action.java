package com.hellokoding.auth.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.beans.factory.annotation.Value;

@Entity
@Table(name = "action")
public class Action implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="soldier_id")
	private long soldierId;
	
	@Column(name="new_area")
	@NotNull
    @NotEmpty
	private String area;
	
	@Column(name="new_group")
	@NotNull
    @NotEmpty
	private String grupo;
	
	@Column(name="exec")
	@Value("${some.key:false}")
	private boolean isExec;
		
	@Column(name="created_at")
	@CreationTimestamp
	private Date created_at;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public long getSoldierId() {
		return soldierId;
	}

	public void setSoldierId(long soldierId) {
		this.soldierId = soldierId;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public boolean isExec() {
		return isExec;
	}

	public void setExec(boolean isExec) {
		this.isExec = isExec;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	
}
