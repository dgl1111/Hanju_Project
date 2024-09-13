package com.example.hanju.salling.model.entity;

import lombok.Data;

@Data
public class SaleModel {
	// 테이블 HANJU_PRODUCT 컬럼명
    private String productId;	
    private String type;
    private String productName;
    private int price;
    private String sellerId;
    private String madeBy;
    private double alcohol;		// 도수
    private int sparkling;		// 탄산
    private int sweet;			// 단맛
    private int sour;			// 신맛
    private int bitter;			// 쓴맛
    private int body;			// 바디감
    private int stock;			// 수량
    private int capacity;		// 용량
    private String color;		// 색
    private String material;	// 재료	
    
}
