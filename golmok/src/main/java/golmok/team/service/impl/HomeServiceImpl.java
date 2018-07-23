package golmok.team.service.impl;

import java.util.List;

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

	@Override
	public UserVo verifyUser(UserVo uVo) {
		UserVo resultVo = homeDao.verifyUser(uVo);
		return resultVo;
	}

	@Override
	public int updateVerifyCode(UserVo uVo) {
		int resultNum = homeDao.updateVerifyCode(uVo);
		return resultNum;
	}

	@Override
	public int modifyPWAndVerifyCode(UserVo uVo) {
		int resultNum = homeDao.modifyPWAndVerifyCode(uVo);
		return resultNum;
	}

	@Override
	public int modifyPW(UserVo uVo) {
		int resultNum = homeDao.modifyPW(uVo);
		return resultNum;
	}

	@Override
	public List<UserVo> selectAllUserInfo(UserVo uVo) {
		List<UserVo> resultVo = homeDao.selectAllUserInfo(uVo);
		
		return resultVo;
	}

	@Override
	public int selectInfoCount() {
		int resultNum = homeDao.selectInfoCount();
		return resultNum;
	}

	@Override
	public int deleteUserInfo(UserVo uVo) {
		int resultNum = homeDao.deleteUserInfo(uVo);
		return resultNum;
	}
	
	@Override
	public int modifyUserInfoWithoutEmail(UserVo uVo) {
		int resultNum = homeDao.modifyUserInfoWithoutEmail(uVo);
		return resultNum;
	}

}
