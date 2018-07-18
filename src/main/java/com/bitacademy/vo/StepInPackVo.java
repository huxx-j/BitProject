package com.bitacademy.vo;

public class StepInPackVo {
    private int Step_no;
    private int Package_no;
    private String StepName;

    public StepInPackVo() {
    }

    public StepInPackVo(int step_no, int package_no, String stepName) {
        Step_no = step_no;
        Package_no = package_no;
        StepName = stepName;
    }

    public int getStep_no() {
        return Step_no;
    }

    public void setStep_no(int step_no) {
        Step_no = step_no;
    }

    public int getPackage_no() {
        return Package_no;
    }

    public void setPackage_no(int package_no) {
        Package_no = package_no;
    }

    public String getStepName() {
        return StepName;
    }

    public void setStepName(String stepName) {
        StepName = stepName;
    }

    @Override
    public String toString() {
        return "StepInPackVo{" +
                "Step_no=" + Step_no +
                ", Package_no=" + Package_no +
                ", StepName='" + StepName + '\'' +
                '}';
    }
}
