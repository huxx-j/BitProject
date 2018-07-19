package com.bitacademy.vo;

public class FileVo {
    private int file_no;
    private long fileSize;
    private String filePath;
    private String fileName;

    public FileVo() {
    }

    public FileVo(int file_no, long fileSize, String filePath, String fileName) {
        this.file_no = file_no;
        this.fileSize = fileSize;
        this.filePath = filePath;
        this.fileName = fileName;
    }

    public int getFile_no() {
        return file_no;
    }

    public void setFile_no(int file_no) {
        this.file_no = file_no;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "FileVo{" +
                "file_no=" + file_no +
                ", fileSize=" + fileSize +
                ", filePath='" + filePath + '\'' +
                ", fileName='" + fileName + '\'' +
                '}';
    }
}
