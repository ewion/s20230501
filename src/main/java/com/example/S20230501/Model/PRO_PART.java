package com.example.S20230501.Model;

import java.util.Date;

import lombok.Data;

@Data
public class PRO_PART {
	
	private int PRSDU_ID;
	private int PART_NUM;
	private String PART_COM;
	private Date PART_DATE;
	private String PART_USCOM;
	private String PART_TRCOM;
	private String PART_COMPLETE;
	
}