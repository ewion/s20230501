package com.example.S20230501.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.S20230501.Model.Biz;
import com.example.S20230501.Model.HT_USERS_DATA;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@RequiredArgsConstructor
@Slf4j
public class UsersDaoImpl implements UsersDao {
	private final SqlSession session;
	@Override
	public List<HT_USERS_DATA> users_DATA(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> users = session.selectList("lysUsers",users_DATA);
		return users;
	}
	@Override

	public List<HT_USERS_DATA> trainer(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> trainer = session.selectList("lystrainer",users_DATA);
		return trainer;
	}
	@Override
	public List<HT_USERS_DATA> userssearch(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> userssearch=session.selectList("lysuserssearch",users_DATA);
		return userssearch;
	}
	@Override
	public int userTotal() {
		int userTotal =session.selectOne("lysusersTotal");
		return userTotal;
	}
	@Override
	public int userssearch1(HT_USERS_DATA users_DATA) {
		int userssearch1 =session.selectOne("lysusersSearch1",users_DATA);
		return userssearch1;
	}
	@Override
	public int trainerTotal() {
		int trainerTotal =session.selectOne("lystrainerTotal");
		return trainerTotal;
	}

	@Override
	public int trainerscTotal(HT_USERS_DATA users_DATA) {
		int trainerscTotal =session.selectOne("lystrainerscTotal",users_DATA);
		return trainerscTotal;
	}
	@Override
	public List<HT_USERS_DATA> trainerSearch(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> trainerSearch=session.selectList("lystrainerSearch",users_DATA);
		return trainerSearch;
	}
	@Override
	public int editForm(HT_USERS_DATA data) {
		int editForm =session.update("lysEditForm",data);
		return editForm;
	}



}