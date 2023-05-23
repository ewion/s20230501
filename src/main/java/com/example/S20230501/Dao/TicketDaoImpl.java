package com.example.S20230501.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.S20230501.Model.TICKET_DATA;
import com.example.S20230501.Model.TICKET_USERDATE;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class TicketDaoImpl implements TicketDao {
	private final SqlSession session;
	
	// 티켓 전체 리스트
	@Override
	public List<TICKET_DATA> listTicket(TICKET_DATA ticket_data) {
		List<TICKET_DATA> ticketList = null;
		System.out.println("TicketDaoImpl listTicket 시작");
		try {
			ticketList = session.selectList("ListTicket" , ticket_data);
		} catch (Exception e) {
			System.out.println("TicketDaoImpl e.getMessage()->"+e.getMessage());
		}
		return ticketList;
	}
	
	
}
