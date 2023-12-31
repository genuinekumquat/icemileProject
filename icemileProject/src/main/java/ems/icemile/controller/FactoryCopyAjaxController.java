package ems.icemile.controller;


import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.annotation.Logistics;
import ems.icemile.dto.RequirementDTO;
import ems.icemile.service.FactoryCopyServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/factoryCopy_ajax/*")
public class FactoryCopyAjaxController {
	

	@Inject 
	private FactoryCopyServiceImpl factoryCopyService;
	
	@Logistics
    @PostMapping("/insertRequirement")
    public ResponseEntity<String> insertRequirement(RequirementDTO requirementDTO) {
        try {
            boolean result = factoryCopyService.insertRequirement(requirementDTO);
            if(result) {
            	return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
            } else {
            	return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            log.error("Error during insertRequirement: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
    
	@Logistics
    @PostMapping("/updateRequirement")
    public ResponseEntity<String> updateRequirement(RequirementDTO requirementDTO) {
        try {
            factoryCopyService.updateRequirement(requirementDTO);
            return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
        } catch (Exception e) {
            log.error("Error during insertRequirement: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
	
    
}// class FactoryCopyAjaxController
	
