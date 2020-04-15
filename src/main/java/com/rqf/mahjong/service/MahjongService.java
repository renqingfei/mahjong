package com.rqf.mahjong.service;

import com.rqf.mahjong.MahjongDao;
import com.rqf.mahjong.bean.Mahjong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MahjongService {

    @Autowired
    private MahjongDao mahjongDao;

    public List<Mahjong> getList() {
        return mahjongDao.getList();
    }

    public String del(Integer id) {
        mahjongDao.del(id);
        return "删除成功";
    }

    public String add(Mahjong mahjong) {
        mahjongDao.add(mahjong);
        return "保存成功";
    }
}
