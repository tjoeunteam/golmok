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
		
		return result;
	}

	@Override
	public UserVo selectByEmail(UserVo uVo) {
		UserVo resultVo = homeDao.selectByEmail(uVo);
		
		return resultVo;
	}

	@Override
	public int updateInfobyVerifyCode(UserVo uVo) {
		int result = homeDao.updateInfobyVerifyCode(uVo);
		return result;
	}

	@Override
	public UserVo selectByEmailAndPW(UserVo uVo) {
		UserVo resultVo = homeDao.selectByEmailAndPW(uVo);
		return resultVo;
	}
	
}
