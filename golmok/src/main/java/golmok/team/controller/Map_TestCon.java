package golmok.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping("/Map/get_2type")
	@ResponseBody
	public List<MapVO> get_2type(@ModelAttribute MapVO vo) {
		
		System.out.println(vo.getSTORE_1TYPE_CODE());
		System.out.println(mapService.select_2type(vo).toString());
		return mapService.select_2type(vo);
	}
	
	@RequestMapping("/Map/get_3type")
	@ResponseBody
	public List<MapVO> get_3type(@ModelAttribute MapVO vo) {
		
		System.out.println(vo.getSTORE_2TYPE_CODE());
		System.out.println(mapService.select_3type(vo).toString());
		return mapService.select_3type(vo);
	}
	
	
	@RequestMapping("/Map/get_recomend")
	@ResponseBody
	public List<MapVO> get_recomend(@ModelAttribute MapVO vo) {
		
		System.out.println("선택한 업종의 type:"+ vo.STORE_TYPE_CODE.toString());
		System.out.println("추천 하는 결과값 리스트"+mapService.select_recomend(vo).toString());
		return mapService.select_recomend(vo);
	}
	
	
	
	
}
