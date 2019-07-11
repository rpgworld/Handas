package com.spring.handas;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class Upload {
	String ps = File.pathSeparator;
	String uploadPath = "C:\\Desktop\\Spring\\Handas\\Handas_ex2\\src\\main\\webapp\\resources\\images\\shop_images";
	
	
	
	// 업로드 메서드
	public String uploadFile(String pname, String originalName, byte[] fileData) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMdd_HHmmss");
		Date today = new Date();
		
		UUID uid = UUID.randomUUID();
		String savedName = format.format(today) + "_" + pname + "_" + uid.toString() + "_" + originalName;
		File file = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, file);
		return savedName;
	}
	
	// 파일 삭제
	public void deleteFile(String img) throws Exception {
		File file = new File(uploadPath);
     
		if( file.exists() ){
	        if(file.delete()){
	            System.out.println("파일삭제 성공");
	        }else{
	            System.out.println("파일삭제 실패");
	        }
	    }else{
	        System.out.println("파일이 존재하지 않습니다.");
	    }
	}
}
