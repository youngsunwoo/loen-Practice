package com.sunny.promotion.dao;

import java.util.List;
import java.util.Map;

import com.sunny.promotion.vo.ParticipateVO;


public interface ParticipateMapper {

    public int InsertParticipateList(ParticipateVO participate) throws Exception; 
    
    public int  getInfoUseridPromoId(Map<String, String> info) throws Exception; 
    
    public List<Map<String, Object>> getParticipateUserInfo(String promotionId) throws Exception; 
    
    public List<Map<String, Object>> getParticipateListSearch(Map<String, String> info)throws Exception; 
    
    
}