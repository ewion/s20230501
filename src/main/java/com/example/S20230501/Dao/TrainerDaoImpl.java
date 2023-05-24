package com.example.S20230501.Dao;

import com.example.S20230501.Model.Biz;
import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Model.HT_USERS_DATA_ljy;

import java.util.List;

public interface TrainerDaoImpl {

    List<HT_USERS_DATA_ljy> getTrainersMemberList(HT_USERS_DATA_ljy subUsers);

    HT_USERS_DATA getTrainerInfo(String trainerId);
}
