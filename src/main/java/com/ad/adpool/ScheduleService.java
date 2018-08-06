package com.ad.adpool;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.adpool.service.BoardService;

@Service
public class ScheduleService {
	@Autowired
	BoardService bs;
	public void deleteLog() {
		//servlet-content.xml task:scheduled 설정
			bs.deletelog();
			System.out.println("deleteLog");
	}
}
