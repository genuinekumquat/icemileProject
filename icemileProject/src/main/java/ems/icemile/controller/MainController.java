package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.annotation.UnUseAOP;
import ems.icemile.service.MainServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MainServiceImpl mainService;
	
	@GetMapping("/index")
	public String index() {
		
		log.debug("index");
		
		return "main/index";
	}
	
	@UnUseAOP
	@GetMapping("/index2")
	public String index2() {
		
		log.debug("index2");
		
		return "main/index2";
	}
	
	// AOP 제외대상 어노테이션 선언
	@UnUseAOP
	// 401 권한 에러 메시지 페이지
	@GetMapping("/noPermission")
	public String noPermission() {
		
		log.debug("main/401.jsp");
		
		return "main/401";
	}
	
	// AOP 제외대상 어노테이션 선언
	@UnUseAOP
	// 500 에러 메시지 페이지
	@GetMapping("/error")
	public String error() {
			
		log.debug("main/500.jsp");
			
		return "main/500";
	}
	
	// AOP 제외대상 어노테이션 선언
	@UnUseAOP
	// 404 에러 메시지 페이지
	@GetMapping("/notFound")
	public String notFound() {
				
		log.debug("main/404.jsp");
				
		return "main/404";
	}

	@GetMapping("/tables")
	public String tables() {
		
		log.debug("tables");
		
		return "main/tables";
	}
	
	@GetMapping("/form")
	public String form() {
		
		log.debug("form");
		
		return "main/form";
	}
	
}

