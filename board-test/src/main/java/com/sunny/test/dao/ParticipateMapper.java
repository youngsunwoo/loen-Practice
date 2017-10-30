package com.sunny.test.dao;

import java.util.Map;

import com.sunny.test.vo.ParticipateVO;

public interface ParticipateMapper {

    public int InsertParticipateList(ParticipateVO participate) throws Exception; 
    
    public int  getInfoUseridPromoId(Map info) throws Exception; 
}