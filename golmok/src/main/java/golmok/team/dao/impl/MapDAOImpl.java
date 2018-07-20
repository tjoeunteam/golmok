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
	
	public List<MapVO> select_2type (MapVO vo) {
		
		return sqlSession.selectList("map.select_2type",vo);
	}
	
	public List<MapVO> select_3type (MapVO vo) {
		
		return sqlSession.selectList("map.select_3type",vo);
	}
	
	public List<MapVO> select_recomend (MapVO vo) {
		
		return sqlSession.selectList("recomend.get_recomend",vo);
	}
}
