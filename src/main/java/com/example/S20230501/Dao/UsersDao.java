
package com.example.S20230501.Dao;

import java.util.List;

import com.example.S20230501.Model.Biz;
import com.example.S20230501.Model.HT_USERS_DATA;

public interface UsersDao {

	List<HT_USERS_DATA> users_DATA(HT_USERS_DATA users_DATA);

	List<HT_USERS_DATA> trainer(HT_USERS_DATA users_DATA);

	List<HT_USERS_DATA> userssearch(HT_USERS_DATA users_DATA);

	int userTotal();

	int userssearch1(HT_USERS_DATA users_DATA);

	int trainerTotal();


	List<HT_USERS_DATA> trainerSearch(HT_USERS_DATA users_DATA);

	int trainerscTotal(HT_USERS_DATA users_DATA);

	int editForm(HT_USERS_DATA data);
}
