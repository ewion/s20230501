
package com.example.S20230501.Service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.example.S20230501.Dao.TicketDao;
import com.example.S20230501.Model.TICKET_DATA;
import com.example.S20230501.Model.TICKET_USERDATE;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j 
public class TicketServiceImple implements TicketService {
	private final TicketDao td;
	
	// 티켓 전체 리스트
	@Override
	public List<TICKET_DATA> listTicket(TICKET_DATA ticket_data) {
		List<TICKET_DATA> ticketList = null;
		System.out.println("TicketServiceImple listTicket 시작");
		ticketList = td.listTicket(ticket_data);
		return ticketList;
	}
	
	


}
