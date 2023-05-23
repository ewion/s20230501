package com.example.S20230501.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.S20230501.Model.CalenderModel;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@RequiredArgsConstructor
@Slf4j
public class CalenderDao implements CalenderDaoImpl {
	private final SqlSession session;

	
	@Override
	public List<CalenderModel> getReservList() {
		List<CalenderModel> rstList		=session.selectList("lysCalender");
		
		
		return rstList;
	}


}
