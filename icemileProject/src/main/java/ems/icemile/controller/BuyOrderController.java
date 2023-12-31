package ems.icemile.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ems.icemile.annotation.Business;
import ems.icemile.dto.ProductDTO;
import ems.icemile.dto.RawOrderDTO;
import ems.icemile.dto.RowOrderListDTO;
import ems.icemile.service.BuyOrderService;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/buyOrder/*")
public class BuyOrderController {
	
	@Inject // 멤버 서비스 의존성 주입
	private BuyOrderService buyOrderService;
	
	@GetMapping("/rawOrderList")
	public String rawOrderList(Model model) {
		
		log.debug("발주 페이지");
		
		// 발주리스트를 가져오기위한 품목리스트 객체생성
		List<RowOrderListDTO> rawOrderList = new ArrayList<RowOrderListDTO>();
		rawOrderList = buyOrderService.getRawOrderList();
		
		// 총가격 저장
		for(RowOrderListDTO a : rawOrderList) {
			a.setRaw_fullprice(a.getRaw_order_amount()*a.getRaw_price());
		}
		
		// 모델에 발주리스트 DTO값 저장
		model.addAttribute("rawOrderList", rawOrderList);
		
		return "buyOrder/rawOrderList";
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("/rawOrderUpdate")
	@ResponseBody
	public boolean rawOrderUpdate(RawOrderDTO rawOrderDTO) {
		
		log.debug("발주 수정");
		log.debug("값 잘 넘어오나"+rawOrderDTO);
		
		return buyOrderService.rawOrderUpdate(rawOrderDTO);
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("/rawOrderInsert")
	@ResponseBody
	public boolean rawOrderInsert(RawOrderDTO rawOrderDTO) {
		
		log.debug("발주 등록");
		log.debug("값 잘 넘어오나"+rawOrderDTO);
		
		return buyOrderService.rawOrderInsert(rawOrderDTO);
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("/rawOrderDelete")
	@ResponseBody
	public boolean rawOrderDelete(@RequestParam("selectedRawOrderId") String[] selectedRawOrderId) {
		
		log.debug("발주 삭제");
		
		// 마이바티스에서 반복처리를 위해 배열을 리스트 타입으로 변경
		List<String> deleteRawList = Arrays.asList(selectedRawOrderId);
		
		return buyOrderService.rawOrderDelete(deleteRawList);
	}
	
	@PostMapping("/rawOrderSearch")
	@ResponseBody
	public List<RowOrderListDTO> rawOrderSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("발주 검색");
		
		// 값 확인
//		for (Entry<String, Object> entry : json.entrySet()) {
//            String key = entry.getKey();
//            Object value = entry.getValue();
//            boolean test = entry.getValue().toString().isEmpty();
//            log.debug("키값 {} 밸류 값 {}",key,value);
//            log.debug("빈값{}",test);
//        }
		
		// 발주리스트를 가져오기위한 품목리스트 객체생성
		List<RowOrderListDTO> rawOrderList = new ArrayList<RowOrderListDTO>();
		rawOrderList = buyOrderService.rawOrderSearch(json);
				
		// 총가격 저장
		for(RowOrderListDTO a : rawOrderList) {
			a.setRaw_fullprice(a.getRaw_order_amount()*a.getRaw_price());
		}
		
		return rawOrderList;
	}
	
	@GetMapping("/rawOrderListPopUp")
	public String rawOrderListPopUp(Model model) {
		
		log.debug("rawOrderListPopUp");
		
		// 완재품 리스트를 가져오기위한 완재품 리스트 객체생성
		List<RawOrderDTO> rawOrderList = new ArrayList<RawOrderDTO>();
		rawOrderList = buyOrderService.getRawOrderListPopUp();
				
		// 모델에 멤버 DTO값 저장
		model.addAttribute("rawOrderList", rawOrderList);
		
		return "buy/rawOrderListPopUp";
	}
	
}
