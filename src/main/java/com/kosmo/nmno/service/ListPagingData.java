package com.kosmo.nmno.service;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ListPagingData<T> {

	private List<T> lists;
	private int TotalRecordCount;
	private int pageSize;
	private int blockSize;
	private int nowPage;
	private String pagingString;
	
}//////