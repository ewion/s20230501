package com.example.S20230501.Service;

import com.example.S20230501.Dao.TrainerDao;
import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Model.HT_USERS_DATA_ljy;
import com.example.S20230501.Model.RECORD_DATA;
import com.example.S20230501.Model.SCHEDULE;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TrainerService implements TrainerServiceImple {

    private final TrainerDao TD;

    @Override
    public List<HT_USERS_DATA_ljy> getTrainersMemberList(HT_USERS_DATA_ljy subUsers) {
        List<HT_USERS_DATA_ljy> subUsersList = TD.getTrainersMemberList(subUsers);
        return subUsersList;
    }

    @Override
    public HT_USERS_DATA getTrainerInfo(String trainerId) {
        return TD.getTrainerInfo(trainerId);

    }

    @Override
    public HT_USERS_DATA_ljy getUserInfo(HT_USERS_DATA_ljy user) {
        return TD.getUserInfo(user);
    }

    @Override
    public SCHEDULE getUserSchedule(HT_USERS_DATA_ljy user) {
        return TD.getUserSchedule(user);
    }

    @Override
    public List<RECORD_DATA> getUserRecordDataList(HT_USERS_DATA_ljy user) {
        return TD.getUserRecordDataList(user);
    }

    @Override
    public int deleteRecord(int rcodId) {
        return TD.deleteRecord(rcodId);
    }

    @Override
    public void insertRecord(HT_USERS_DATA_ljy data) {
        TD.insertRecord(data);
    }

    @Override
    public void insertTrainerScheldules(HT_USERS_DATA_ljy schedule) {
        TD.insertTrainerScheldules(schedule);
    }
}
