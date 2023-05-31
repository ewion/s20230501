package com.example.S20230501.Model;

import java.util.Date;

import lombok.Data;

@Data
public class RECORD_DATA {
	
	
	private int    RCOD_ID;
	private int    SDU_ID;
	private Date RECORD_DATE;
	private String PLAY_TYPE;
	private int    RCOD_COUNT;
	private String RCOD_TYPE;
	private String RCOD_TRCOM;
	private String RCOD_USCOM;
	
}