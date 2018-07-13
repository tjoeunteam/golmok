package golmok.team.dao;

import golmok.team.vo.UserVo;

public interface HomeDAO {

	int joinUser(UserVo uVo);

	UserVo selectByEmail(UserVo uVo);

	int updateInfobyVerifyCode(UserVo uVo);

	UserVo selectByEmailAndPW(UserVo uVo);

}
