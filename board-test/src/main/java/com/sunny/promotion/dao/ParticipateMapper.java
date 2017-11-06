package com.sunny.promotion.dao;

import java.util.List;
import java.util.Map;

import com.sunny.promotion.vo.ParticipateVO;


public interface ParticipateMapper {

    public int InsertParticipateList(ParticipateVO participate) throws Exception; 
    
    public int  getInfoUseridPromoId(Map info) throws Exception; 
    
    public List<Map<String, String>> getParticipateUserInfo(String promotionId) throws Exception; 
    
    
    
}