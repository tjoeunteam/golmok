package golmok.team.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import golmok.team.dao.HomeDAO;
import golmok.team.vo.UserVo;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int joinUser(UserVo uVo) {		
		return sqlSession.insert("user.joinUser", uVo);
	}

	@Override
	public UserVo selectByEmail(UserVo uVo) {
		return sqlSession.selectOne("user.selectByEmail", uVo);
	}

	@Override
	public int updateInfobyVerifyCode(UserVo uVo) {		
		return sqlSession.update("user.updateInfobyVerifyCode", uVo);
	}

	@Override
	public UserVo selectByEmailAndPW(UserVo uVo) {
		return sqlSession.selectOne("user.selectByEmailAndPW", uVo);
	}

	@Override
	public UserVo verifyUser(UserVo uVo) {
		return sqlSession.selectOne("user.verifyUser", uVo);
	}

	@Override
	public int updateVerifyCode(UserVo uVo) {
		return sqlSession.update("user.updateVerifyCode", uVo);
	}

	@Override
	public int modifyPWAndVerifyCode(UserVo uVo) {
		return sqlSession.update("user.modifyPWAndVerifyCode", uVo);
	}

	@Override
	public int modifyPW(UserVo uVo) {
		return sqlSession.update("user.modifyPW", uVo);
	}

	@Override
	public List<UserVo> selectAllUserInfo(UserVo uVo) {
		return sqlSession.selectList("user.selectAllUserInfo", uVo);
	}

	@Override
	public int selectInfoCount() {
		return sqlSession.selectOne("user.selectInfoCount");
	}

	@Override
	public int deleteUserInfo(UserVo uVo) {
		return sqlSession.delete("user.deleteUserInfo", uVo);
	}

	@Override
	public int modifyUserInfoWithoutEmail(UserVo uVo) {
		return sqlSession.update("user.modifyUserInfoWithoutEmail", uVo);
	}

}
