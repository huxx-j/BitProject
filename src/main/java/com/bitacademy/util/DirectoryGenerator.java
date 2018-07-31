package com.bitacademy.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.Map;

@Repository
public class DirectoryGenerator {
    @Autowired
    SqlSession sqlSession;

    //파일 분류별로 저장될 디렉토리를 리턴해주는 메소드
    public String DirectoryGenerator(MultipartHttpServletRequest multipartHttpServletRequest, String param){
        String saveDir;
        if(param.equals("project")) {
            int pjtCurriNo = Integer.parseInt(multipartHttpServletRequest.getParameter("detailCurriNo"));
            String gisu = sqlSession.selectOne("gisu.getGisu", pjtCurriNo);
            saveDir = "D:\\bit_file\\"+gisu+"\\project";
            makeDir(saveDir);
            return saveDir;
        } else if (param.equals("score")) {
            int scoreSisNo = Integer.parseInt(multipartHttpServletRequest.getParameter("iSisNo"));
            Map<String, Object> map = sqlSession.selectOne("subject.getSubjectNoForDirGen",scoreSisNo);
            String gisu = String.valueOf(map.get("GisuName"));
            String subNo = String.valueOf(map.get("Subject_no"));
            saveDir = "D:\\bit_file\\"+gisu+"\\score\\"+subNo;
            makeDir(saveDir);
            return saveDir;
        } else {
            int testSisNo = Integer.parseInt(multipartHttpServletRequest.getParameter("testSisNo"));
            Map<String, Object> map = sqlSession.selectOne("subject.getSubjectNoForDirGen",testSisNo);
            String gisu = String.valueOf(map.get("GisuName"));
            String subNo = String.valueOf(map.get("Subject_no"));
            saveDir = "D:\\bit_file\\"+gisu+"\\score\\"+subNo;
            makeDir(saveDir);
            return saveDir;
        }
    }

    //디렉토리가 없으면 만들어 주는 메소드
    private void makeDir(String saveDir) {
        File dir = new File(saveDir);
        if (!dir.exists()){
            dir.mkdirs();
        }
    }
}
