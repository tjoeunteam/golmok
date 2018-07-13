package golmok.team.dao.impl;

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

}
