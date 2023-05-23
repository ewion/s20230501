package com.example.S20230501.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.S20230501.Model.Biz;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@RequiredArgsConstructor
@Slf4j
public class SearchDao implements SearchDaoImpl {
	private final SqlSession session;

	@Override
	public List<Biz> serchList(Biz biz) {
		 List<Biz> serchList= session.selectList("lysSearch",biz);
		 
		 return serchList;
	}


}
