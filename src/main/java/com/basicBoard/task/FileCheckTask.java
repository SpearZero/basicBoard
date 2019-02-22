package com.basicBoard.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.basicBoard.dto.BoardAttachDTO;
import com.basicBoard.mapper.BoardAttachMapper;

@Component
public class FileCheckTask {
	private static Logger logger = LoggerFactory.getLogger(FileCheckTask.class);
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles() throws Exception{
		logger.warn("File Check Task run.....................");
		logger.warn(new Date().toString());
		
		List<BoardAttachDTO> fileList = attachMapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream().map(dto -> Paths.get("c:\\upload", dto.getUploadPath(), dto.getUuid() + "_" + dto.getFileName()))
				.collect(Collectors.toList());
		
		fileList.stream().filter(dto -> dto.isFileType() == true).map(dto -> Paths.get("c:\\upload", dto.getUploadPath(), "s_" + dto.getUuid() + "_"+ dto.getFileName()))
				.forEach(dto -> fileListPaths.add(dto));
		
		logger.warn("========================================");
		
		File targetDir = Paths.get("c:\\upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		logger.warn("----------------------------------------");
		for(File file : removeFiles) {
			file.delete();
		}
	}
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
}
