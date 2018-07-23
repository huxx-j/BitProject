package com.bitacademy.util;

import com.bitacademy.vo.FileVo;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class FileUpload {

    private void upload(MultipartFile file, String saveDir, String saveName){
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
    }

    public FileVo saveProjectFile(MultipartHttpServletRequest multipartFile) {
        FileVo fileVo = new FileVo();

        int file_no = 0;
        if (multipartFile.getParameter("file_no") != null) {
            file_no = Integer.parseInt(multipartFile.getParameter("file_no"));
        }
        if (!multipartFile.getFile("projectFile").isEmpty()) {
            MultipartFile file = multipartFile.getFile("projectFile");

            String saveDir = "D:\\bit_file\\bit_project";
            String orgName = file.getOriginalFilename();
            String saveName = orgName;
            String filePath = saveDir + "\\" + saveName;
            long fileSize = file.getSize();

            //파일 업로드 부분
            upload(file,saveDir,saveName);

            fileVo.setFileName(saveName);
            fileVo.setFilePath(filePath);
            fileVo.setFileSize(fileSize);
            if (file_no == 0) {
                return fileVo;
            } else {
                fileVo.setFile_no(file_no);
                return fileVo;
            }

        } else if (file_no != 0) {
            fileVo.setFile_no(file_no);
            return fileVo;
        } else {
            return fileVo;
        }
    }

    public FileVo saveScoreFile(MultipartFile file) {
        FileVo fileVo = new FileVo();

        String saveDir = "D:\\bit_file\\KUKA18-BD01\\score\\23";
        String orgName = file.getOriginalFilename();
        String saveName = orgName;
        String filePath = saveDir + "\\" + saveName;
        long fileSize = file.getSize();

        //파일 업로드 부분
        upload(file,saveDir,saveName);

        fileVo.setFileName(saveName);
        fileVo.setFilePath(filePath);
        fileVo.setFileSize(fileSize);
    return fileVo;
    }
}

