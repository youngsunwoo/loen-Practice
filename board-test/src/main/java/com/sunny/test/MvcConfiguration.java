package com.sunny.test;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.sunny.test.CertificationInterceptor;

@Configuration
public class MvcConfiguration extends WebMvcConfigurerAdapter
{
	@Bean
	public InternalResourceViewResolver setupViewResolver()  {
	        InternalResourceViewResolver resolver =  new InternalResourceViewResolver();
	        resolver.setPrefix ("/WEB_INF/jsp/");
	        resolver.setSuffix (".jsp");
	        resolver.setViewClass (JstlView.class);
	        return resolver;
	}
	
	
	@Bean
	public CertificationInterceptor certificationInterceptor() {
	    return new CertificationInterceptor();
	}

	public @Override void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(certificationInterceptor()).addPathPatterns("/**");
	}
	//@Autowired
    //CertificationInterceptor certificationInterceptor;
    
    // @Override
    // public void addInterceptors(InterceptorRegistry registry) {
    //     registry.addInterceptor(certificationInterceptor)
    //             .addPathPatterns("/**/*Promotion");
    //  }
    //
}
