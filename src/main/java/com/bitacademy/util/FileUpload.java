package com.bitacademy.util;

import com.bitacademy.vo.FileVo;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;


public class FileUpload {

    public FileVo saveProjectFile(MultipartHttpServletRequest multipartFile) {
        FileVo fileVo = new FileVo();
        MultipartFile file = multipartFile.getFile("projectFile");
        String projectNo = multipartFile.getParameter("detailPjtNo");

        String saveDir = "D:\\bit_file\\bit_project";
        String orgName = file.getOriginalFilename();
        //저장파일명
        String saveName = projectNo+"_"+orgName; //임의의 난수를 주는데 겹칠수도 있으니 시간을 추가해줌
        //파일패스
        String filePath = saveDir+"\\"+saveName;
        //파일사이즈
        long fileSize = file.getSize();

        try {
            byte[] fileData = file.getBytes();
            OutputStream outputStream = new FileOutputStream( saveDir + "/" + saveName );
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);

            bufferedOutputStream.write(fileData);

            if(bufferedOutputStream != null) {
                bufferedOutputStream.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        fileVo.setFileName(saveName);
        fileVo.setFilePath(filePath);
        fileVo.setFileSize(fileSize);
//        System.out.println(saveName);
//        System.out.println(filePath);
//        System.out.println(fileSize);
        return fileVo;
//        return null;
    }
}
