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

        int file_no = 0;
        System.out.println("ㄱ");
        if (multipartFile.getParameter("file_no") != null) {
            System.out.println("ㄴ");
            file_no = Integer.parseInt(multipartFile.getParameter("file_no"));
        }
        System.out.println("ㄷ");
        if (!multipartFile.getFile("projectFile").isEmpty()) {
            MultipartFile file = multipartFile.getFile("projectFile");

            String saveDir = "D:\\bit_file\\bit_project";
            String orgName = file.getOriginalFilename();
            String saveName = orgName;
            String filePath = saveDir + "\\" + saveName;
            long fileSize = file.getSize();

            //파일 업로드 부분
            try {
                byte[] fileData = file.getBytes();
                OutputStream outputStream = new FileOutputStream(saveDir + "/" + saveName);
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
                bufferedOutputStream.write(fileData);
                if (bufferedOutputStream != null) {
                    bufferedOutputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            fileVo.setFileName(saveName);
            fileVo.setFilePath(filePath);
            fileVo.setFileSize(fileSize);
            System.out.println(saveName);
            System.out.println(filePath);
            System.out.println(fileSize);
            System.out.println(file_no);
            if (file_no == 0) {
                System.out.println("파일 신규등록");
                return fileVo;
            } else {
                System.out.println("파일 수정");
                fileVo.setFile_no(file_no);
                return fileVo;
            }

        } else if (file_no != 0) {
            System.out.println("파일이 등록되어 있고 내용수정만"); //확인되면 나중에 else로 합쳐질것
            fileVo.setFile_no(file_no);
            return fileVo;
        } else {
            System.out.println("파일없이 신규등록");
            return fileVo;
        }
    }
}
