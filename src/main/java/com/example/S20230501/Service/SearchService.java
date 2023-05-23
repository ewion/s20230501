
package com.example.S20230501.Service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.example.S20230501.Dao.CalenderDao;
import com.example.S20230501.Dao.SearchDao;
import com.example.S20230501.Model.Biz;
import com.example.S20230501.Model.CalenderModel;

import lombok.RequiredArgsConstructor; import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j 
public class SearchService  implements SearchServiceImple {
	private final SearchDao searchDao;


	@Override
	public List<Biz> serchList(Biz biz) {
		List<Biz>  serchList =searchDao.serchList(biz);
		return serchList;
	}


}
