package com.forever.young;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.forever.young.repository")
public class ForeveryoungApplication {

	public static void main(String[] args) {
		SpringApplication.run(ForeveryoungApplication.class, args);
	}

}
