package com.example.S20230501.Model;


import java.util.Date;

import lombok.Data;

@Data
public class SCHEDULE {
	
	private int SDU_ID;
	private String TRAINER_ID;
	private String USERS_ID;
	private Date SDU_DATE;
	private String SDU_COM;
	private int TICKET_ID;
	
}