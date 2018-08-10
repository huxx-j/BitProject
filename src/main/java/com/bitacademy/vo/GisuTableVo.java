package com.bitacademy.vo;

public class GisuTableVo {

	
	private String gisuName;
	private String nameHan;
	
	
	public GisuTableVo() {
		super();
	}


	public GisuTableVo(String gisuName, String nameHan) {
		super();
		this.gisuName = gisuName;
		this.nameHan = nameHan;
	}


	public String getGisuName() {
		return gisuName;
	}


	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}


	public String getNameHan() {
		return nameHan;
	}


	public void setNameHan(String nameHan) {
		this.nameHan = nameHan;
	}


	@Override
	public String toString() {
		return "GisuTableVo [gisuName=" + gisuName + ", nameHan=" + nameHan + "]";
	}

	
	
}
	
	