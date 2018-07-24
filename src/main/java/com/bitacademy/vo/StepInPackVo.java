package com.bitacademy.vo;

import java.util.List;

public class StepInPackVo {
    private int Step_no;
    private int Package_no;
    private String StepName;
    private int Level;
    private List<SubInStepVo> sublist;


    public StepInPackVo() {
    }

    public StepInPackVo(int step_no, int package_no, String stepName, List<SubInStepVo> sublist, int level) {
        Step_no = step_no;
        Package_no = package_no;
        StepName = stepName;
        this.sublist = sublist;
        Level = level;
    }

    public List<SubInStepVo> getSublist() {
        return sublist;
    }

    public void setSublist(List<SubInStepVo> sublist) {
        this.sublist = sublist;
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
    public int getLevel() { return Level; }

    public void setLevel(int level) { Level = level; }

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
                ", sublist=" + sublist +
                ", Level=" + Level +
                '}';
    }
}
