package com.sunny.promotion.dao;

import java.util.Map;

import com.sunny.promotion.vo.ParticipateVO;


public interface ParticipateMapper {

    public int InsertParticipateList(ParticipateVO participate) throws Exception; 
    
    public int  getInfoUseridPromoId(Map info) throws Exception; 
}