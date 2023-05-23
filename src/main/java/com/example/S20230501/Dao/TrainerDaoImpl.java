package com.example.S20230501.Dao;

import com.example.S20230501.Model.Biz;

import java.util.List;

public interface TrainerDaoImpl {

    List<String> getTrainersMemberList(String trainerId);
}
