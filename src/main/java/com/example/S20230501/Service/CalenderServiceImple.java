
package com.example.S20230501.Service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.example.S20230501.Dao.CalenderDao;
import com.example.S20230501.Model.CalenderModel;

import lombok.RequiredArgsConstructor; import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j 
public class CalenderServiceImple implements CalenderService {
	private final CalenderDao calenderDao;
	
	@Override
	public List<CalenderModel> getReservList() {
		List<CalenderModel> rstList = calenderDao.getReservList();
		
		return rstList;
	} 

}
