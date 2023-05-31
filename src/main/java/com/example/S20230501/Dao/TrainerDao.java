package com.example.S20230501.Dao;

import com.example.S20230501.Model.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Repository
@RequiredArgsConstructor
@Slf4j
public class TrainerDao implements TrainerDaoImpl {
	private final SqlSession session;


	@Override
	public List<HT_USERS_DATA_ljy> getTrainersMemberList(HT_USERS_DATA_ljy subUsers) {
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
			String today = LocalDate.now().format(formatter);
			System.out.println("오늘 날짜 = "+today);
			List<HT_USERS_DATA_ljy> trainersMemberList = session.selectList("getTrainersMemberList", subUsers);

			return trainersMemberList;
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public HT_USERS_DATA getTrainerInfo(String trainerId) {
		try {
			return session.selectOne("getTrainerInfo", trainerId);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public HT_USERS_DATA_ljy getUserInfo(HT_USERS_DATA_ljy user) {
		try {
			String trainer_id = user.getTrainer_id();
			String today = user.getSelectDate();
			user = session.selectOne("getUserInfo", user);
			user.setTrainer_id(trainer_id);
			user.setSelectDate(today);
			return user;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public SCHEDULE getUserSchedule(HT_USERS_DATA_ljy user) {
		try {
			SCHEDULE userSchedule = session.selectOne("getUserSchedule", user);
			if (userSchedule == null) session.insert("insertUserSchedule", user);
			return session.selectOne("getUserSchedule", user);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<RECORD_DATA> getUserRecordDataList(HT_USERS_DATA_ljy user) {
		try {
			return session.selectList("getUserRecordDataList", user);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int deleteRecord(int rcodId) {
		try {
			return session.delete("deleteRecord", rcodId);
 		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertRecord(HT_USERS_DATA_ljy data) {
		try {
			SCHEDULE schedule = session.selectOne("getUserSchedule", data);
			data.setSDU_ID(schedule.getSDU_ID());
			session.insert("insertRecord", data);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertTrainerScheldules(HT_USERS_DATA_ljy schedule) {
		try {
			session.update("insertTrainerScheldules", schedule);
		} catch (Exception e) {
			throw e;
		}
	}
}
