package golmok.team.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import golmok.team.vo.MapVO; 

@Repository
public class MapDAOImpl {
	
	@Inject
	SqlSession sqlSession;
	
	public List<MapVO> select_1type () {
	
		return sqlSession.selectList("map.select_1type");
	}
}
