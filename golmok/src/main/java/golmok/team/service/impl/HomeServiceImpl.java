package golmok.team.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import golmok.team.dao.HomeDAO;
import golmok.team.service.HomeService;
import golmok.team.vo.UserVo;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	HomeDAO homeDao;

	@Override
	public int joinUser(UserVo uVo) {
		
		int result = homeDao.joinUser(uVo);
		
		return 0;
	}
	
}
