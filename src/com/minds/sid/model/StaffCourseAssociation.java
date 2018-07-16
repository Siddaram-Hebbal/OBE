package com.minds.sid.model;

import java.sql.Date;

//import java.util.Date;

public class StaffCourseAssociation extends BaseModel{
	private int orgUnitId;
	private int staffId;	
	private int reportsToStaffId; //' reports_to: refers to whom the staff reports.',
	private int courseId;
	private int roleId;	// 'role_code : refers to role associated to Staff from staff_roles table',
	private Date dateFrom;
	private Date dateTo;
	private String otherDetails;
	
	private String orgUnit;
	private String staffName;
	private String staffCode;
	private String courseName;
	private String courseCode;
	private String reportingToStaff;
	private String reportingStaffCode;
	private String staffRole;
	private String roleCode;
	
	
	
	public int getOrgUnitId() {
		return orgUnitId;
	}
	public void setOrgUnitId(int orgUnitId) {
		this.orgUnitId = orgUnitId;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public int getReportsToStaffId() {
		return reportsToStaffId;
	}
	public void setReportsToStaffId(int reportsToStaffId) {
		this.reportsToStaffId = reportsToStaffId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public Date getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}
	public Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
	public String getOtherDetails() {
		return otherDetails;
	}
	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}
	public String getOrgUnit() {
		return orgUnit;
	}
	public void setOrgUnit(String orgUnit) {
		this.orgUnit = orgUnit;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffCode() {
		return staffCode;
	}
	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getReportingToStaff() {
		return reportingToStaff;
	}
	public void setReportingToStaff(String reportingToStaff) {
		this.reportingToStaff = reportingToStaff;
	}
	public String getReportingStaffCode() {
		return reportingStaffCode;
	}
	public void setReportingStaffCode(String reportingStaffCode) {
		this.reportingStaffCode = reportingStaffCode;
	}
	public String getStaffRole() {
		return staffRole;
	}
	public void setStaffRole(String staffRole) {
		this.staffRole = staffRole;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	
	
	
}
