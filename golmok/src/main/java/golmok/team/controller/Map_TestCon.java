package golmok.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import golmok.team.service.impl.MapServiceImpl;
import golmok.team.vo.MapVO;

@Controller
public class Map_TestCon {

	@Inject
	MapServiceImpl mapService;
	
	@RequestMapping("/Map_Test")
	public String main_chat() {
		
		return "MapTest/Map";
	}
	
	@RequestMapping("/Map/get_1type")
	@ResponseBody
	public List<MapVO> get_1type() {
		
		return mapService.select_1type();
	}
	
	
}
