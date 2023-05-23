
package com.example.S20230501.Service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.example.S20230501.Dao.SearchDao;
import com.example.S20230501.Dao.UsersDao;
import com.example.S20230501.Model.HT_USERS_DATA;

import lombok.RequiredArgsConstructor; 
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j 
public class UsersService  implements UsersServiceImple {
	private final UsersDao usersDao;

	@Override
	public List<HT_USERS_DATA> users_DATA(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> users = usersDao.users_DATA(users_DATA);
		return users;
	}
	@Override
	public List<HT_USERS_DATA> trainer(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> trainer = usersDao.trainer(users_DATA);
		return trainer;
	}
	@Override
	public List<HT_USERS_DATA> userssearch(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> userssearch = usersDao.userssearch(users_DATA);

		return userssearch;
	}
	@Override
	public int userTotal() {
		int userTotal =usersDao.userTotal();
		return userTotal;
	}
	@Override
	public int userssearch1(HT_USERS_DATA users_DATA) {
		int userssearch1 =usersDao.userssearch1(users_DATA);
		return userssearch1;
	}
	
	@Override
	public int trainerTotal() {
		int trainerTotal =usersDao.trainerTotal();
		return trainerTotal;
	}
	@Override
	public int trainerscTotal(HT_USERS_DATA users_DATA) {
		int trainerscTotal =usersDao.trainerscTotal(users_DATA);
		return trainerscTotal;
	}
	@Override
	public List<HT_USERS_DATA> trainerSearch(HT_USERS_DATA users_DATA) {
		List<HT_USERS_DATA> trainerSearch = usersDao.trainerSearch(users_DATA);

		return trainerSearch;
	}





}
