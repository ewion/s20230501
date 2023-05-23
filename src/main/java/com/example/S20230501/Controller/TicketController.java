package com.example.S20230501.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.S20230501.Model.TICKET_DATA;
import com.example.S20230501.Model.TICKET_USERDATE;

import com.example.S20230501.Service.TicketService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Controller
@RequiredArgsConstructor
@Slf4j
public class TicketController {
	private final TicketService ts;
	
	// 티켓 전체 리스트
	@GetMapping(value= "/ticket")
	public String ticketList(TICKET_DATA ticket_data, TICKET_USERDATE ticket_userdate, Model model) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
		Date start = dateFormat.parse("23/05/23");
		Date end = dateFormat.parse("23/07/23");
		ticket_data.setTICKET_START(start);
		ticket_data.setTICKET_END(end);

		List<TICKET_DATA> listTicket = ts.listTicket(ticket_data);
		model.addAttribute("listTicket",listTicket);
		return "/ticket";
	}
	
	

	
	
	
	
	
	
	
	
	
	
}














