package com.forever.young.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

import com.forever.young.entity.ProductFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class ProductFileController {
	

	@PostMapping(value = "/productImg", produces = MediaType.APPLICATION_JSON_VALUE)
 	@ResponseBody
	public ResponseEntity<List<ProductFile>> productImg(MultipartFile[] uploadFile) {
		
		List<ProductFile> productFileList = new ArrayList<>();
		
		// 파일 저장 경로
		// **경로 수정**
		String uploadFolder = "/Users/yujin/Documents/upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			
			ProductFile productFile = new ProductFile();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			productFile.setFile_size((int)multipartFile.getSize());
			productFile.setImage_name(uploadFileName);
			productFile.setFile_type(multipartFile.getContentType());
			
			// 파일 이름 랜덤 생성
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveName = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveName);
				
				productFile.setImage_save_name(uploadFileName);
				
				// 업로드 이미지 썸네일 생성
				FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadFolder, "s_" + uploadFileName));
				// 사이즈 100 x 100
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
				productFileList.add(productFile);
			}
				
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<> (productFileList, HttpStatus.OK);
	}
	
	
	// 이미지 업로드 후 이미지 확인
	@GetMapping("/viewImg")
	@ResponseBody
	public ResponseEntity<byte[]> viewImg(String fileName) {
		// 파일의 경로가 포함된 fileName 을 파라미터로 받고 byte[]를 리턴
		
		// byte[] 이미지 파일 전송 시 MIME 타입 종류
		// - probeContentType() 으로 적절한 MIME 타입을 Http 헤더에 포함한다.
		
		// **경로 수정**
		File file = new File("/Users/yujin/Documents/upload/" + fileName);
		
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
	@PostMapping("/deleteImg")
	@ResponseBody
	public ResponseEntity<String> deleteImg(String fileName, String type) {
		
		File file;
		
		try {
			// **경로 수정**
			// 파일명에 특수문자가 있을 수 있으니 디코더 처리
			file = new File("/Users/yujin/Documents/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
				
			// 썸네일 이미지 삭제
			String thumbnail = file.getAbsolutePath().replace("s_", "");
			file = new File(thumbnail);
			file.delete();
		} catch(UnsupportedEncodingException e) { // URLDecoder 의 예외처리
			e.printStackTrace();
			return new ResponseEntity<> (HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("delete", HttpStatus.OK);
	}
}