package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.HeadDAOImpl;
import ems.icemile.dao.WareHouseCopyDAOImpl;
import ems.icemile.dto.ResultDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HeadServiceImpl implements HeadService{

	@Inject // DAO 의존성 주입
	private HeadDAOImpl headDAO;
	
	@Inject // 완제품 수정에 의한 DAO 의존성 주입
	private WareHouseCopyDAOImpl wareHouseDAO;

	@Override
	public List<ResultDTO> getResultList() {
		log.debug("서비스|getResultList");
		return headDAO.getResultList();
	}

	@Override
	public List<ResultDTO> resultSearch(HashMap<String, Object> json) {
		log.debug("서비스 | 실적 검색 기능");
		return headDAO.resultSearch(json);
	}

	@Override
	public boolean resultInsert(ResultDTO resultDTO) {
		log.debug("서비스 | 실적 추가 기능");
		
		String getNum = headDAO.getNewRSCode();
		
		int result_code = 0;
		// DB에 데이터가없다면 초기값(1)이되고
		if(getNum == null) {
			result_code = 1;
		// 아니라면 +1을 더한다
		} else {
			result_code = Integer.parseInt(getNum.replaceAll("[^0-9]", ""))+1;
		}
		
		//고유 번호 부여
		resultDTO.setResult_code(Integer.toString(result_code));
		
		headDAO.resultInsert(resultDTO);
		
		// 생산 실적이 추가 되면 완제품 수량 업데이트
		return wareHouseDAO.updateProdAmount(resultDTO);
	}

	@Override
	public boolean resultUpdate(ResultDTO resultDTO) {
		log.debug("서비스 | 실적 수정 기능");
		return headDAO.resultUpdate(resultDTO);
	}

	@Override
	public boolean resultDelete(List<String> deleteRSList) {
		log.debug("서비스 | 실적 삭제 기능");
		return headDAO.resultDelete(deleteRSList);
	}
	
}
