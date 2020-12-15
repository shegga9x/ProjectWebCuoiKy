package beans;

import java.util.ArrayList;

import database.ProductDAO;

public class Cart {
	private String id;
	private double total;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Cart(String id, double total) {
		super();
		this.id = id;
		this.total = total;
	}

	public Cart() {
		super();
	}

//	public int getLineItemCount() {
//		return list.size();
//	}

//	public void calculateOrderTotal() {
//		double plus = 0;
//		for (int i = 0; i < list.size(); i++) {
//			Product cartItem = (Product) list.get(i);
//			plus += cartItem.getTotalCost();
//
//		}
//		setTotal(plus);
//	}


}
