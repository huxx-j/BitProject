package com.bitacademy.vo;

import java.util.List;

public class AllStepVo {
    private List<StepInPackVo> steplist;
    public AllStepVo() {
    }

    public AllStepVo(List<StepInPackVo> steplist) {
        this.steplist = steplist;
    }

    public List<StepInPackVo> getSteplist() {
        return steplist;
    }

    public void setSteplist(List<StepInPackVo> steplist) {
        this.steplist = steplist;
    }



    @Override
    public String toString() {
        return "AllStepVo{" +
                "steplist=" + steplist+
                '}';
    }
}
