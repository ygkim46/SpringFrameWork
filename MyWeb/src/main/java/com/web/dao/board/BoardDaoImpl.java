package com.web.dao.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.web.dto.board.BoardInfo;

@Repository("boardDao")
public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	public List<BoardInfo> getBoardList(Map<String, Object> parameterMap) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("BoardInfo.getBoardList", parameterMap);
	}

	public long getBoardListCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("BoardInfo.getBoardListCount");
	}

}
