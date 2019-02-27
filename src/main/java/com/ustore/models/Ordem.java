package com.ustore.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Ordem implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private long id;
	
	private String message;
	private String to_race;
	private String to_region;
	private boolean isExec;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTo_race() {
		return to_race;
	}
	public void setTo_race(String to_race) {
		this.to_race = to_race;
	}
	public String getTo_region() {
		return to_region;
	}
	public void setTo_region(String to_region) {
		this.to_region = to_region;
	}
	public boolean isExec() {
		return isExec;
	}
	public void setExec(boolean isExec) {
		this.isExec = isExec;
	}
	
	
}
