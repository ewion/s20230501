package com.example.S20230501.Dao;

import java.util.List;

import com.example.S20230501.Model.TICKET_DATA;
import com.example.S20230501.Model.TICKET_USERDATE;


public interface TicketDao {

	List<TICKET_DATA> listTicket(TICKET_DATA ticket_data);
	

}
