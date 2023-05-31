package com.example.S20230501.Model;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class HT_USERS_DATA_ljy {
	
	private String users_id;
	private int users_code;
	private String users_pass;
	private String users_phone;
	private String users_addr;
	private Date users_start;
	private Date users_end;
	private int users_state;
	private Date users_birth;
	private int users_height;
	private int users_weight;
	private String users_name;
	private int users_gender;

	//넘버링용
	private int rownum;
	
	//검색용
	private String keyword;
	private String search;
	
	//페이징용
	private int start;
	private int end;

	//조인용
	private String trainer_id;

	private String ticket_end;

	private String selectDate;

	private int checkSchedule;
	private int checkDiet;		//
	private int checkActivities;	// 숙제를 0 안함, 1 하긴함, 2 다함

	// record_data 조인용
	private int    RCOD_ID;
	private int    SDU_ID;
	private Date RECORD_DATE;
	private String PLAY_TYPE;
	private int    RCOD_COUNT;
	private String RCOD_TYPE;
	private String RCOD_TRCOM;
	private String RCOD_USCOM;

	private String SDU_COM;

	private int max_trcom;
	private int nn_uscom;
	



	
}