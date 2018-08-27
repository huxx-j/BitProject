package com.bitacademy.vo;

import java.util.List;

public class JobRequestVo {

	private int company_no;
	private String compName;
	private String isStock;
	private String address;
	private String tel;
	private int file_no;
	private String business;
	private String capital;
	private String yearSell;
	private String staffCnt;
	private String homePage;
	private String postCode;
	private String introduction;
	private String welfare;
	private String compResNum;
	private String openDate;
	private String updateDate;

	private int request_no;
	private String hireCnt;
	private String hireCnt_M;
	private String hireCnt_F;
	private String hireCntDisplay;
	private String workPlace;
	private String majorBiz;
	private String field;
	private String useLang;
	private String useOS;
	private String useDB;
	private String useETC;
	private String requirement;
	private String major;
	private String yearIncome;
	private String salaryCode;
	private String procedures;
	private String reqDocument;
	private String reqDetail;
	private String department;
	private String mgrName;
	private String position;
	private String email;
	private String fax;
	private String telephone;
	private String cellphone;
	private String receiptDate;
	private String isShow;
	private String employment;
	private String career;
	private String careerYear;
	private String contractType;
	private String internTerm;
	private String employPosition;
	private String advantage;
	private String isLicensePartnership;
	private String memo;

	private List<JobReqVo> jobReqList;
	private List<InterViewerVo> interViewerList;

	public JobRequestVo() {
	}

	public JobRequestVo(int company_no, String compName, String isStock, String address, String tel, int file_no,
			String business, String capital, String yearSell, String staffCnt, String homePage, String postCode,
			String introduction, String welfare, String compResNum, String openDate, String updateDate, int request_no,
			String hireCnt, String hireCnt_M, String hireCnt_F, String workPlace, String majorBiz, String field,
			String useLang, String useOS, String useDB, String useETC, String requirement, String major,
			String yearIncome, String salaryCode, String procedures, String reqDocument, String reqDetail,
			String department, String mgrName, String position, String email, String fax, String telephone,
			String cellphone, String receiptDate, String isShow, String employment, String career, String careerYear,
			String contractType, String internTerm, String employPosition, String advantage,
			String isLicensePartnership, String memo, List<JobReqVo> jobReqList, List<InterViewerVo> interViewerList) {
		super();
		this.company_no = company_no;
		this.compName = compName;
		this.isStock = isStock;
		this.address = address;
		this.tel = tel;
		this.file_no = file_no;
		this.business = business;
		this.capital = capital;
		this.yearSell = yearSell;
		this.staffCnt = staffCnt;
		this.homePage = homePage;
		this.postCode = postCode;
		this.introduction = introduction;
		this.welfare = welfare;
		this.compResNum = compResNum;
		this.openDate = openDate;
		this.updateDate = updateDate;
		this.request_no = request_no;
		this.hireCnt = hireCnt;
		this.hireCnt_M = hireCnt_M;
		this.hireCnt_F = hireCnt_F;
		this.workPlace = workPlace;
		this.majorBiz = majorBiz;
		this.field = field;
		this.useLang = useLang;
		this.useOS = useOS;
		this.useDB = useDB;
		this.useETC = useETC;
		this.requirement = requirement;
		this.major = major;
		this.yearIncome = yearIncome;
		this.salaryCode = salaryCode;
		this.procedures = procedures;
		this.reqDocument = reqDocument;
		this.reqDetail = reqDetail;
		this.department = department;
		this.mgrName = mgrName;
		this.position = position;
		this.email = email;
		this.fax = fax;
		this.telephone = telephone;
		this.cellphone = cellphone;
		this.receiptDate = receiptDate;
		this.isShow = isShow;
		this.employment = employment;
		this.career = career;
		this.careerYear = careerYear;
		this.contractType = contractType;
		this.internTerm = internTerm;
		this.employPosition = employPosition;
		this.advantage = advantage;
		this.isLicensePartnership = isLicensePartnership;
		this.memo = memo;
		this.jobReqList = jobReqList;
		this.interViewerList = interViewerList;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getIsStock() {
		return isStock;
	}

	public void setIsStock(String isStock) {
		this.isStock = isStock;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getCapital() {
		return capital;
	}

	public void setCapital(String capital) {
		this.capital = capital;
	}

	public String getYearSell() {
		return yearSell;
	}

	public void setYearSell(String yearSell) {
		this.yearSell = yearSell;
	}

	public String getStaffCnt() {
		return staffCnt;
	}

	public void setStaffCnt(String staffCnt) {
		this.staffCnt = staffCnt;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getWelfare() {
		return welfare;
	}

	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}

	public String getCompResNum() {
		return compResNum;
	}

	public void setCompResNum(String compResNum) {
		this.compResNum = compResNum;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getRequest_no() {
		return request_no;
	}

	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}

	public String getHireCnt() {
		return hireCnt;
	}

	public void setHireCnt(String hireCnt) {
		this.hireCnt = hireCnt;
	}

	public String getHireCnt_M() {
		return hireCnt_M;
	}

	public void setHireCnt_M(String hireCnt_M) {
		this.hireCnt_M = hireCnt_M;
	}

	public String getHireCnt_F() {
		return hireCnt_F;
	}

	public void setHireCnt_F(String hireCnt_F) {
		this.hireCnt_F = hireCnt_F;
	}

	
	/*모집인원 출력용*/
	public String getHireCntDisplay() {
		String str ="총:"+ hireCnt + "  남:"+ hireCnt_M + "  여:"+ hireCnt_F;
		return str;
	}
	

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getMajorBiz() {
		return majorBiz;
	}

	public void setMajorBiz(String majorBiz) {
		this.majorBiz = majorBiz;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getUseLang() {
		return useLang;
	}

	public void setUseLang(String useLang) {
		this.useLang = useLang;
	}

	public String getUseOS() {
		return useOS;
	}

	public void setUseOS(String useOS) {
		this.useOS = useOS;
	}

	public String getUseDB() {
		return useDB;
	}

	public void setUseDB(String useDB) {
		this.useDB = useDB;
	}

	public String getUseETC() {
		return useETC;
	}

	public void setUseETC(String useETC) {
		this.useETC = useETC;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getYearIncome() {
		return yearIncome;
	}

	public void setYearIncome(String yearIncome) {
		this.yearIncome = yearIncome;
	}

	public String getSalaryCode() {
		return salaryCode;
	}

	public void setSalaryCode(String salaryCode) {
		this.salaryCode = salaryCode;
	}

	public String getProcedures() {
		return procedures;
	}

	public void setProcedures(String procedures) {
		this.procedures = procedures;
	}

	public String getReqDocument() {
		return reqDocument;
	}

	public void setReqDocument(String reqDocument) {
		this.reqDocument = reqDocument;
	}

	public String getReqDetail() {
		return reqDetail;
	}

	public void setReqDetail(String reqDetail) {
		this.reqDetail = reqDetail;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getMgrName() {
		return mgrName;
	}

	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public String getEmployment() {
		return employment;
	}

	public void setEmployment(String employment) {
		this.employment = employment;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCareerYear() {
		return careerYear;
	}

	public void setCareerYear(String careerYear) {
		this.careerYear = careerYear;
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

	public String getInternTerm() {
		return internTerm;
	}

	public void setInternTerm(String internTerm) {
		this.internTerm = internTerm;
	}

	public String getEmployPosition() {
		return employPosition;
	}

	public void setEmployPosition(String employPosition) {
		this.employPosition = employPosition;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getIsLicensePartnership() {
		return isLicensePartnership;
	}

	public void setIsLicensePartnership(String isLicensePartnership) {
		this.isLicensePartnership = isLicensePartnership;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public List<JobReqVo> getJobReqList() {
		return jobReqList;
	}

	public void setJobReqList(List<JobReqVo> jobReqList) {
		this.jobReqList = jobReqList;
	}

	public List<InterViewerVo> getInterViewerList() {
		return interViewerList;
	}

	public void setInterViewerList(List<InterViewerVo> interViewerList) {
		this.interViewerList = interViewerList;
	}

	@Override
	public String toString() {
		return "JobRequestVo [company_no=" + company_no + ", compName=" + compName + ", isStock=" + isStock
				+ ", address=" + address + ", tel=" + tel + ", file_no=" + file_no + ", business=" + business
				+ ", capital=" + capital + ", yearSell=" + yearSell + ", staffCnt=" + staffCnt + ", homePage="
				+ homePage + ", postCode=" + postCode + ", introduction=" + introduction + ", welfare=" + welfare
				+ ", compResNum=" + compResNum + ", openDate=" + openDate + ", updateDate=" + updateDate
				+ ", request_no=" + request_no + ", hireCnt=" + hireCnt + ", hireCnt_M=" + hireCnt_M + ", hireCnt_F="
				+ hireCnt_F + ", hireCntDisplay=" + hireCntDisplay + ", workPlace=" + workPlace + ", majorBiz="
				+ majorBiz + ", field=" + field + ", useLang=" + useLang + ", useOS=" + useOS + ", useDB=" + useDB
				+ ", useETC=" + useETC + ", requirement=" + requirement + ", major=" + major + ", yearIncome="
				+ yearIncome + ", salaryCode=" + salaryCode + ", procedures=" + procedures + ", reqDocument="
				+ reqDocument + ", reqDetail=" + reqDetail + ", department=" + department + ", mgrName=" + mgrName
				+ ", position=" + position + ", email=" + email + ", fax=" + fax + ", telephone=" + telephone
				+ ", cellphone=" + cellphone + ", receiptDate=" + receiptDate + ", isShow=" + isShow + ", employment="
				+ employment + ", career=" + career + ", careerYear=" + careerYear + ", contractType=" + contractType
				+ ", internTerm=" + internTerm + ", employPosition=" + employPosition + ", advantage=" + advantage
				+ ", isLicensePartnership=" + isLicensePartnership + ", memo=" + memo + ", jobReqList=" + jobReqList
				+ ", interViewerList=" + interViewerList + "]";
	}

}
