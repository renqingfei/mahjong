package com.rqf.mahjong.controller;

import com.rqf.mahjong.bean.Mahjong;
import com.rqf.mahjong.service.MahjongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MahjongController {

    @Autowired
    private MahjongService mahjongService;

    @GetMapping(value = "/getList")
    public List<Mahjong> getList(){
        return mahjongService.getList();
    }

    @GetMapping(value = "/del")
    public String del(Integer id){
        return mahjongService.del(id);
    }

    @PostMapping(value = "/add")
    public String add(Mahjong mahjong){
        return mahjongService.add(mahjong);
    }
}
