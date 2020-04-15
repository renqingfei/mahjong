package com.rqf.mahjong;

import com.rqf.mahjong.bean.Mahjong;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MahjongDao {


    @Select(value = "select * from mahjong")
    List<Mahjong> getList();

    @Delete(value = "delete from mahjong where id = #{id}")
    int del(@Param(value = "id") Integer id);

    @Insert(value = "insert into mahjong set name = #{name},context = #{context}")
    int add(Mahjong mahjong);
}
