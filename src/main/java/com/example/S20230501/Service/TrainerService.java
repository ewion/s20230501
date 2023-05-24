package com.example.S20230501.Service;

import com.example.S20230501.Dao.TrainerDao;
import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Model.HT_USERS_DATA_ljy;
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
}
