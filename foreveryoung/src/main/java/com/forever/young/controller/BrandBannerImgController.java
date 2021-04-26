package com.forever.young.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forever.young.entity.BrandBannerImg;

@Controller
public class BrandBannerImgController {
	
	@PostMapping(value = "/bannerImg", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<BrandBannerImg> bannerImg(HttpSession session, MultipartFile[] imgFile){
		
		BrandBannerImg img = new BrandBannerImg();
		
		String path = "/Users/yujin/Documents/upload/brand";
		for(MultipartFile multipartFile : imgFile) {
			System.out.println(session.getAttribute("check"));
		img.setImage_name(multipartFile.getOriginalFilename());
		img.setFile_size((int)multipartFile.getSize());
		img.setFile_type(multipartFile.getContentType());
		img.setBan_no((int)session.getAttribute("check"));
		
		UUID uuid = UUID.randomUUID();
		
		String save_name = uuid.toString() + "_" + multipartFile.getOriginalFilename();
		
		try {
			File saveName = new File(path, save_name);
			multipartFile.transferTo(saveName);
			
			img.setImage_save_name(save_name);
		}
			
		catch(Exception e) {
			e.printStackTrace();
		}
		}
		
	return new ResponseEntity<> (img, HttpStatus.OK);
		
	}
	
	// 이미지 업로드 후 이미지 확인
	@GetMapping("/bannerImgCk")
	@ResponseBody
	public ResponseEntity<byte[]> bannerImgCk(String fileName) {
		// 파일의 경로가 포함된 fileName 을 파라미터로 받고 byte[]를 리턴
		
		// byte[] 이미지 파일 전송 시 MIME 타입 종류
		// - probeContentType() 으로 적절한 MIME 타입을 Http 헤더에 포함한다.
		
		// ***경로 수정***
		File file = new File("/Users/yujin/Documents/upload/brand/" + fileName);
		
		ResponseEntity<byte[]> result =null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			// MIME 타입 확인 후 header 에 add
			header.add("Content-Type", Files.probeContentType(file.toPath()));;
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 이미지 삭제
	@PostMapping("/bannerImgDel")
	@ResponseBody
	public ResponseEntity<String> bannerImgDel(String fileName) {
		
		try {
			File file = new File("/Users/yujin/Documents/upload/brand/" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
				
		} catch(UnsupportedEncodingException e) { // URLDecoder 의 예외처리
			e.printStackTrace();
			return new ResponseEntity<> (HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("delete", HttpStatus.OK);
	}

}
