package com.minds.sid.model;

import java.sql.Date;

public class BaseModel {
	private int id;
	private String softDelete;
	private String createdBy;
	private Date createdAt;
	private String deletedBy;
	private Date deletedAt;
	private String modifiedBy;
	private Date modifiedAt;
	private String flag;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSoftDelete() {
		return softDelete;
	}
	public void setSoftDelete(String softDelete) {
		this.softDelete = softDelete;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date date) {
		this.createdAt = date;
	}
	public String getDeletedBy() {
		return deletedBy;
	}
	public void setDeletedBy(String deletedBy) {
		this.deletedBy = deletedBy;
	}
	public Date getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(Date date) {
		this.deletedAt = date;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Date getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(Date date) {
		this.modifiedAt = date;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}
