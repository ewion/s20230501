package com.example.S20230501.Model;

import java.util.Date;
import lombok.Data;

@Data
public class HT_DIET {
	
	private Date DIET_DATE;  
	private String TRAINER_ID;
	private String USER_ID;
	private String DIET_TRCOM;
	private String DIET_USCOM;
	private int TICKET_ID;
	
}