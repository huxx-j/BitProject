package com.bitacademy.vo;

public class GisuVo {

	
	private int gisu_no;
	private String gisuName;
	private int curriculum_no;
	private String driveURL;
	private String nameHan;
	private String birthDate;
	private String gender;

	public GisuVo() {
	}

	public GisuVo(int gisu_no, String gisuName, int curriculum_no, String driveURL, String nameHan, String birthDate, String gender) {
		this.gisu_no = gisu_no;
		this.gisuName = gisuName;
		this.curriculum_no = curriculum_no;
		this.driveURL = driveURL;
		this.nameHan = nameHan;
		this.birthDate = birthDate;
		this.gender = gender;
	}

	public int getGisu_no() {
		return gisu_no;
	}

	public void setGisu_no(int gisu_no) {
		this.gisu_no = gisu_no;
	}

	public String getGisuName() {
		return gisuName;
	}

	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}

	public int getCurriculum_no() {
		return curriculum_no;
	}

	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}

	public String getDriveURL() {
		return driveURL;
	}

	public void setDriveURL(String driveURL) {
		this.driveURL = driveURL;
	}

	public String getNameHan() {
		return nameHan;
	}

	public void setNameHan(String nameHan) {
		this.nameHan = nameHan;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "GisuVo{" +
				"gisu_no=" + gisu_no +
				", gisuName='" + gisuName + '\'' +
				", curriculum_no=" + curriculum_no +
				", driveURL='" + driveURL + '\'' +
				", nameHan='" + nameHan + '\'' +
				", birthDate='" + birthDate + '\'' +
				", gender='" + gender + '\'' +
				'}';
	}
}



	
	