package com.kosmo.nmno.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.nmno.service.ListPagingData;
import com.kosmo.nmno.service.MembersDTO;
import com.kosmo.nmno.service.MembersService;
import com.kosmo.nmno.service.PagingUtil;

//컴포넌트 스캔을 통해 IOC가 된다. (역제어)

/*
	이름 미지정시 ID값은 소문자로 시작하는 클래스명이됨
	예] oneMemoServiceImpl
	이름을 지정하려면 @Service("임의의ID값") 또는 @Service(value="임의의ID값")
*/
@Service("memoservice")
public class MembersServiceImpl implements MembersService {
	
	//OneMemoDAO 주입]
	@Resource(name="oneMemoDAO")//첫자는 소문자
	private MembersDAO dao;

	@Override
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}
	
	//(한 페이지에 표시할)페이지 사이즈
	@Value("${PAGE_SIZE}")
	private int pageSize;
	
	//(하단에 보여줄)블락 페이지
	@Value("${BLOCK_PAGE}")
	private int blockSize;
	
	@Override
	public ListPagingData<MembersDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount = dao.getTotalRecord(map);
		//전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//시작 및 끝 ROWNUM 구하기
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*blockSize;
		//페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		
		//글 전체 목록 얻기
		List lists = dao.selectList(map);
		
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockSize, nowPage, req.getContextPath()+"/OneMemo/BBS/List.do?");
		
		ListPagingData<MembersDTO> listPagingData =
				ListPagingData.builder()
				.lists(lists)
				.nowPage(nowPage)
				.pageSize(pageSize)
				.pagingString(pagingString)
				.TotalRecordCount(totalRecordCount)
				.build();
		
		//dao.selectList(map)
		return listPagingData;
	}
	
	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}

	@Override
	public MembersDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public String findNameById(String id) {
		return dao.findNameById(id);
	}

	
}/////OneMemoServiceImpl