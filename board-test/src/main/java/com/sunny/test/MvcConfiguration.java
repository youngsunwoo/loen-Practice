package com.sunny.test;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

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

}
