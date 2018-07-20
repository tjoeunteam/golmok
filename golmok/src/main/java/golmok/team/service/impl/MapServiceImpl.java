package golmok.team.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import golmok.team.dao.impl.MapDAOImpl;
import golmok.team.vo.MapVO;

@Service
public class MapServiceImpl {
	
	@Inject
	MapDAOImpl mapDAO;
	
	public List<MapVO> select_1type(){
		return mapDAO.select_1type();
	}
	
	public List<MapVO> select_2type(MapVO vo){
		return mapDAO.select_2type(vo);
	}
	
	public List<MapVO> select_3type(MapVO vo){
		return mapDAO.select_3type(vo);
	}
	
	public List<MapVO> select_recomend(MapVO vo){
		return mapDAO.select_recomend(vo);
	}

}
