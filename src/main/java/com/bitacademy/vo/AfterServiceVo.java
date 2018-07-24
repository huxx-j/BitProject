package com.bitacademy.vo;

public class AfterServiceVo {
    		private int afterService_no;
            private int user_no;
            private String compName;
            private String department;
            private String state;
            private String position;
            private String periodFr;
            private String periodTo;
            private String telePhone;
            private String tel;
            private String address;
			
            public AfterServiceVo(int afterService_no, int user_no, String compName, String department, String state,
					String position, String periodFr, String periodTo, String telePhone, String tel, String address) {
				
				this.afterService_no = afterService_no;
				this.user_no = user_no;
				this.compName = compName;
				this.department = department;
				this.state = state;
				this.position = position;
				this.periodFr = periodFr;
				this.periodTo = periodTo;
				this.telePhone = telePhone;
				this.tel = tel;
				this.address = address;
			}

			public AfterServiceVo() {
				
			}

			public int getAfterService_no() {
				return afterService_no;
			}

			public void setAfterService_no(int afterService_no) {
				this.afterService_no = afterService_no;
			}

			public int getUser_no() {
				return user_no;
			}

			public void setUser_no(int user_no) {
				this.user_no = user_no;
			}

			public String getCompName() {
				return compName;
			}

			public void setCompName(String compName) {
				this.compName = compName;
			}

			public String getDepartment() {
				return department;
			}

			public void setDepartment(String department) {
				this.department = department;
			}

			public String getState() {
				return state;
			}

			public void setState(String state) {
				this.state = state;
			}

			public String getPosition() {
				return position;
			}

			public void setPosition(String position) {
				this.position = position;
			}

			public String getPeriodFr() {
				return periodFr;
			}

			public void setPeriodFr(String periodFr) {
				this.periodFr = periodFr;
			}

			public String getPeriodTo() {
				return periodTo;
			}

			public void setPeriodTo(String periodTo) {
				this.periodTo = periodTo;
			}

			public String getTelePhone() {
				return telePhone;
			}

			public void setTelePhone(String telePhone) {
				this.telePhone = telePhone;
			}

			public String getTel() {
				return tel;
			}

			public void setTel(String tel) {
				this.tel = tel;
			}

			public String getAddress() {
				return address;
			}

			public void setAddress(String address) {
				this.address = address;
			}

			@Override
			public String toString() {
				return "AfterServiceVo [afterService_no=" + afterService_no + ", user_no=" + user_no + ", compName="
						+ compName + ", department=" + department + ", state=" + state + ", position=" + position
						+ ", periodFr=" + periodFr + ", periodTo=" + periodTo + ", telePhone=" + telePhone + ", tel="
						+ tel + ", address=" + address + "]";
			}
            
            

   
}
//`User_no`, `CompName`, `Department`, `State`, `Position`, `PeriodFr`, `PeriodTo`, `TelePhone`
//        `user_no`, `compName`, `department`, `state`, `position`, `periodFr`, `periodTo`, `telePhone`
