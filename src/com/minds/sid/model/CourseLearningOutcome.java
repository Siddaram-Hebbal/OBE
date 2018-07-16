package com.minds.sid.model;

public class CourseLearningOutcome extends BaseModel {
	private String name;
	private int potId;
	private int courseId;
	private String cloCode;
	private String description;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCloCode() {
		return cloCode;
	}
	public void setCloCode(String cloCode) {
		this.cloCode = cloCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPotId() {
		return potId;
	}
	public void setPotId(int potId) {
		this.potId = potId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	
	
}
