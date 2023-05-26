package com.example.S20230501.Model;

import lombok.Data;

@Data
public class Record_data_arr {

    private int[]    RCOD_ID;
	private int[]    SDU_ID;
	private String[] RECORD_DATE;
    private String[] play_type;
    private int[]    rcod_count;
	private String[] RCOD_TYPE;
	private String[] RCOD_TRCOM;
	private String[] RCOD_USCOM;

}
