package com.sunny.test;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;



@SpringBootApplication
public class BoardTestApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(BoardTestApplication.class, args);
	}
	
    
	 
}
