package com.basicBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.basicBoard.dto.AttachFileDTO;

import net.coobird.thumbnailator.Thumbnailator;

@RestController
public class FileController {
	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			logger.info("------------------------------------------");
			logger.info("Upload File Name : " + multipartFile.getOriginalFilename());
			logger.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
					thumbnail.close();
				}
				
				list.add(attachDTO);
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFiles(String fileName) {
		logger.info("fileName : " + fileName);
		
		File file = new File("c:\\upload\\"+fileName);
		
		logger.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		logger.info("deleteFile : " + fileName);
		
		File file;
		
		try {
			file = new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			
			file.delete();
			
			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				logger.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deletec", HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
