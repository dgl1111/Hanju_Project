package com.example.hanju.cart.mapper;

import com.example.hanju.cart.model.dto.CartNameDto;
import com.example.hanju.cart.model.entity.CartEntity;
import com.example.hanju.cart.model.dto.CartCheckDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {

    List<CartEntity> viewCart(Map<String, Object> map);
    CartEntity getCartItem(Map<String, Object> map);
    int storeStockCheck(Map<String, Object> map);
    int stockCheck(Map<String, Object> map);
    int cartStockChange(Map<String, Object> map);
    int cartSumPrice(Map<String, List<String>> map);
    int discountCartSumPrice(Map<String, List<String>> map);
    int cartItemDelete(Map<String, Object> map);
    int addPickupCart(Map<String, Object> map);
    int addCart(Map<String, Object> map);
    List<CartCheckDto> pickupCartCheck(Map<String, Object> map);
    List<CartCheckDto> cartCheck(Map<String, Object> map);
    int updateCart(Map<String, Object> map);
    List<CartNameDto> getCartName(Map<String,Object> map);
    void addBill(CartEntity cart);
    void addCartBill(Map<String,Object> map);
    void subPayment(Map<String,Object> map);
    void directPayment(Map<String,Object> map);
    void changeAddr(Map<String,Object> map);
    void directPickupPayment(Map<String,Object> map);
    void directPickupBill(Map<String,Object> map);
    int getDis(Map<String,Object> map);

}
