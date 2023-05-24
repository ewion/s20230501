package com.example.S20230501.Service;

import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Model.HT_USERS_DATA_ljy;

import java.util.List;


public interface TrainerServiceImple {

    List<HT_USERS_DATA_ljy> getTrainersMemberList(HT_USERS_DATA_ljy subUsers);

    HT_USERS_DATA getTrainerInfo(String trainerId);
}
