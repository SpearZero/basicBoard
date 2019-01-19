package com.basicBoard.dto;

public class BoardAttachDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int bno;
	
	public BoardAttachDTO() {}

	public String getUuid() {
		return uuid;
	}
	
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public String getUploadPath() {
		return uploadPath;
	}
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public boolean isFileType() {
		return fileType;
	}
	
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
}
