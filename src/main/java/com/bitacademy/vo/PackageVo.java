package com.bitacademy.vo;

public class PackageVo {
 private int Package_no;
 private int PackageCate_no;
 private int Availability;
 private String PackageName;
 private String Goal;
 private String Content;
 private String Qualification;
 private int TotalTime;

    public PackageVo() {
    }

    public PackageVo(int package_no, int packageCate_no, int availability, String packageName, String goal, String content, String qualification, int totalTime) {
        Package_no = package_no;
        PackageCate_no = packageCate_no;
        Availability = availability;
        PackageName = packageName;
        Goal = goal;
        Content = content;
        Qualification = qualification;
        TotalTime = totalTime;
    }

    public int getPackage_no() {
        return Package_no;
    }

    public void setPackage_no(int package_no) {
        Package_no = package_no;
    }

    public int getPackageCate_no() {
        return PackageCate_no;
    }

    public void setPackageCate_no(int packageCate_no) {
        PackageCate_no = packageCate_no;
    }

    public int getAvailability() {
        return Availability;
    }

    public void setAvailability(int availability) {
        Availability = availability;
    }

    public String getPackageName() {
        return PackageName;
    }

    public void setPackageName(String packageName) {
        PackageName = packageName;
    }

    public String getGoal() {
        return Goal;
    }

    public void setGoal(String goal) {
        Goal = goal;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getQualification() {
        return Qualification;
    }

    public void setQualification(String qualification) {
        Qualification = qualification;
    }

    public int getTotalTime() {
        return TotalTime;
    }

    public void setTotalTime(int totalTime) {
        TotalTime = totalTime;
    }

    @Override
    public String toString() {
        return "PackageVo{" +
                "Package_no=" + Package_no +
                ", PackageCate_no=" + PackageCate_no +
                ", Availability=" + Availability +
                ", PackageName='" + PackageName + '\'' +
                ", Goal='" + Goal + '\'' +
                ", Content='" + Content + '\'' +
                ", Qualification='" + Qualification + '\'' +
                ", TotalTime=" + TotalTime +
                '}';
    }
}
