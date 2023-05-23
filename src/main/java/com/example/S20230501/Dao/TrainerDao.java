package com.example.S20230501.Dao;

import com.example.S20230501.Model.Biz;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
@Slf4j
public class TrainerDao implements TrainerDaoImpl {
	private final SqlSession session;


	@Override
	public List<String> getTrainersMemberList(String trainerId) {
		try {
			List<String> trainersMemberList = session.selectList("getTrainersMemberList", trainerId);
			return trainersMemberList;
		} catch (Exception e) {
			throw e;
		}

	}
}
