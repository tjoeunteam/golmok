package golmok.team.service;

import java.util.List;

import golmok.team.vo.UserVo;

public interface HomeService {

	int joinUser(UserVo uVo);

	UserVo selectByEmail(UserVo uVo);

	int updateInfobyVerifyCode(UserVo uVo);

	UserVo selectByEmailAndPW(UserVo uVo);

	UserVo verifyUser(UserVo uVo);

	int updateVerifyCode(UserVo uVo);

	int modifyPWAndVerifyCode(UserVo uVo);

	int modifyPW(UserVo uVo);

	List<UserVo> selectAllUserInfo(UserVo uVo);

	int selectInfoCount();

	int deleteUserInfo(UserVo uVo);

	int modifyUserInfoWithoutEmail(UserVo uVo);

}
