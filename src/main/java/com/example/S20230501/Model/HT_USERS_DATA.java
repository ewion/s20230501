package com.example.S20230501.Model;

import java.util.Date;
import lombok.Data;

@Data
public class HT_USERS_DATA {
	
	private String USERS_ID;  
	private int USER_CODE;
	private String USERS_PASS;
	private String USERS_PHONE;
	private String USERS_ADDR;
	private Date USERS_START;
	private Date USERS_END;
	private int USERS_STATE;
	private Date USERS_BIRTH;
	private int USERS_HEIGHT;
	private int USERS_WEIGHT;
	private String USERS_NAME;
	private int USERS_GENDER;

	//넘버링용
	private int ROWNUM;
	
	//검색용
	private String keyword;
	private String search;
	
	//페이징용
	private int start;
	private int end;
	
}