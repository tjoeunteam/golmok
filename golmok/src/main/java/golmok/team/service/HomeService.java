package golmok.team.service;

import golmok.team.vo.UserVo;

public interface HomeService {

	int joinUser(UserVo uVo);

	UserVo selectByEmail(UserVo uVo);

	int updateInfobyVerifyCode(UserVo uVo);

	UserVo selectByEmailAndPW(UserVo uVo);

}
