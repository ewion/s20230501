package com.example.S20230501.Model;

import java.util.Date;

import lombok.Data;

@Data
public class TICKET_DATA {
	
	
	private int    TICKET_ID;
	private int    TICKET_CODE;
	private Date TICKET_BUY;
	private Date TICKET_START;
	private Date TICKET_END;
	private String TICKET_ING;
	private String TICKET_COM;
	
}