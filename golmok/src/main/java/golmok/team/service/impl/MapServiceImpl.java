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

}
