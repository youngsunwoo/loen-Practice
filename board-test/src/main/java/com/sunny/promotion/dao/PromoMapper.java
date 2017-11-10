package com.sunny.promotion.dao;

import java.util.List;
import java.util.Map;

import com.sunny.promotion.vo.BenefitVO;
import com.sunny.promotion.vo.PromotionVO;

public interface PromoMapper {

	
	//프로모션상세정보 가져오기 
    public PromotionVO getPromotionById(String promo_id)throws Exception; 

    public List<PromotionVO> getPromotionList(Map param)throws Exception; 
    
    public int getMaxPromoId(String insert_date)throws Exception; //추가
    
    public int InsertPromotion(PromotionVO p)throws Exception ;
    
    public List<BenefitVO>getBenefit(Map<String, Object> para)throws Exception; 
    
    public int UpdatePromotionJoinCnt(String PromoId)throws Exception; 

    public int terminatePromotion(String PromoId)throws Exception; 
    
    
}