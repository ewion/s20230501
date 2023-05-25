package com.example.S20230501.Dao;

import com.example.S20230501.Model.*;

import java.util.List;

public interface TrainerDaoImpl {

    List<HT_USERS_DATA_ljy> getTrainersMemberList(HT_USERS_DATA_ljy subUsers);

    HT_USERS_DATA getTrainerInfo(String trainerId);

    HT_USERS_DATA_ljy getUserInfo(HT_USERS_DATA_ljy user);

    SCHEDULE getUserSchedule(HT_USERS_DATA_ljy user);

    List<RECORD_DATA> getUserRecordDataList(HT_USERS_DATA_ljy user);
}
