package com.example.S20230501.Model;

import java.util.Date;
import lombok.Data;

@Data
public class TRAINER {
	
	private String TRAINER_ID;  
	private String BIZ_ID;
	private int TRAINER_PCODE;
	private Date CONTRACT;
	private Date CONTRACT_START;
	private Date CONTRACT_END;
	private String CONTRACTING;
	
}