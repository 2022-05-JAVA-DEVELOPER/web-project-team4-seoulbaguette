package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.CartDao;
import com.itwill.bakery.vo.Cart;

public class CartService {
	private CartDao cartDao;
	public CartService()throws Exception{
		cartDao=new CartDao();
	}
	
	//cart create
	public int CreateCart(String user_id,int p_no,int cart_qty)throws Exception{
		if(cartDao.cartProductExist(user_id,p_no)){
			return cartDao.UpdateQty(user_id, p_no, cart_qty);
		}else {
			return cartDao.insertCart(user_id,p_no,cart_qty);
		}
	}
	
	//cart update
	public int updateQtyByPNo(String user_id,int p_no,int cart_qty)throws Exception{
		return cartDao.updateQtyByPNo(user_id,p_no,cart_qty);
	}
	
	//cart deleteAll
	public int deleteCartByUserId(String userid)throws Exception{
		return cartDao.deleteCart(userid);
	}
	
	//cart deleteByCNo
	public int deleteCartByCNo(int cart_no)throws Exception{
		return cartDao.deleteCartByCNo(cart_no);
	}
	
	//select cartlist
	public List<Cart> selectCartList(String user_id)throws Exception{
		return cartDao.selectCartByUserid(user_id);
	}
	
	//select cart
	public Cart selectCart(int cart_no)throws Exception{
		return cartDao.selectCartByCartNo(cart_no);
	}
}
