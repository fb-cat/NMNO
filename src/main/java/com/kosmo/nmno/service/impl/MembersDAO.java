package com.kosmo.nmno.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.nmno.service.MembersDTO;

@Repository
public class MembersDAO {

	@Resource(name="template") 
	private SqlSessionTemplate sqlMapper;
	
	
	public int join(Map map) {
		return sqlMapper.insert("memoInsert",map);
	}
	
	
	
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("memoIsLogin",map)==1? true:false;
	}

	
	public List<MembersDTO> selectList(Map map) {
		return sqlMapper.selectList("memoSelectList",map);
	}

	
	public int getTotalRecord(Map map) {
		return sqlMapper.selectOne("memoTotalCount",map);
	}

	
	public MembersDTO selectOne(Map map) {
		return sqlMapper.selectOne("memoSelectOne",map);
	}

	
	public int insert(Map map) {
		return sqlMapper.insert("memoInsert",map);
	}

	
	public int delete(Map map) {
		return sqlMapper.delete("memoDelete",map);
	}

	
	public int update(Map map) {
		return sqlMapper.update("memoUpdate",map);
	}

	//아이디로 이름 찾는 메소드]
	public String findNameById(String id) {
		return sqlMapper.selectOne("memoFindNameById",id);
	}
	
	
}/////////