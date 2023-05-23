package com.example.S20230501.Service;

import com.example.S20230501.Dao.TrainerDao;
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
    public List<String> getTrainersMemberList(String trainerId) {
        List<String> TrainersMemberList = TD.getTrainersMemberList(trainerId);
        return TrainersMemberList;
    }
}
