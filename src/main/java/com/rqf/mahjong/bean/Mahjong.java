package com.rqf.mahjong.bean;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "mahjong")
public class Mahjong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name",length = 50,columnDefinition = "varchar(50) COMMENT '牌型名'")
    private String name;

    @Column(name = "context",length = 500,columnDefinition = "varchar(500) COMMENT '内容'")
    private String context;
}
