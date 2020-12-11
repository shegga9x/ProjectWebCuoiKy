package beans;

import java.util.ArrayList;

import database.ProductDAO;

public class Cart {
	private ArrayList<Product> list = new ArrayList<Product>();
	private double total;

	public ArrayList<Product> getList() {
		return list;
	}

	public void setList(ArrayList<Product> list) {
		this.list = list;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getLineItemCount() {
		return list.size();
	}

	public void deleteCart(String stt) {
		int iSTT = 0;
		try {
			iSTT = Integer.parseInt(stt);
			list.remove(iSTT - 1);
			calculateOrderTotal();
		} catch (NumberFormatException nfe) {
			System.out.println("Error while deleting cart item: " + nfe.getMessage());
			nfe.printStackTrace();
		}
	}

	public void updateCart(String stt, String quantity) {
		int iSTT = Integer.parseInt(stt);
		Product cartItem = (Product) list.get(iSTT - 1);
		double iPrice = cartItem.getGia();
		int iQuantity = Integer.parseInt(quantity);
		try {
			if (iQuantity > 0) {
				cartItem.setSluong(iQuantity);
				cartItem.setTotalCost(iPrice * iQuantity);
				calculateOrderTotal();
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while updating cart: " + nfe.getMessage());
			nfe.printStackTrace();
		}

	}

	public void addCart(String id,String description, String price, String quantity, String iName, String loai,
			String filename1) {
		double iPrice = Double.parseDouble(price);
		int iQuantity = Integer.parseInt(quantity);
		
		Product cartItem = new Product();
		try {
			if (iQuantity > 0) {
				ProductDAO my = new ProductDAO();
				cartItem = my.showByID(id);
				int c = equalsName(cartItem);
				if (c == -1) {
					cartItem.setSluong(iQuantity);
					cartItem.setTotalCost(iPrice * (0 + iQuantity));
					list.add(cartItem);
					
				} else {
					int soluong12 = list.get(c).sluong;
					cartItem.setSluong(soluong12 + iQuantity);
					cartItem.setTotalCost(iPrice * (soluong12 + iQuantity));
					list.set(c, cartItem);
				}
				calculateOrderTotal();
			}

		} catch (NumberFormatException nfe) {
			System.out.println("Error while parsing from String to primitive types: " + nfe.getMessage());
			nfe.printStackTrace();
		}
	}

	public boolean payCheck() {
		ProductDAO my = new ProductDAO();
		for (Product product : list) {
			Product p1 = product;
			int sl = my.showByID(p1.getId()).getSluong() - p1.getSluong();
			String idn = my.showByID(p1.getId()).getId();
			if (sl >= 1) {
				p1.setSluong(sl);
				p1.setId(idn);
				if (!my.updateProduct1(p1.getId(), p1)) {
					return false;
				}
			}else {
				return false;
			}
		}
		list.clear();
		return true;
	}

	protected void calculateOrderTotal() {
		double plus = 0;
		for (int i = 0; i < list.size(); i++) {
			Product cartItem = (Product) list.get(i);
			plus += cartItem.getTotalCost();

		}
		setTotal(plus);
	}

	public int equalsName(Product obj1) {

		if (list.size() == 0) {
			return -1;
		} else {
			for (int i = 0; i < list.size(); i++) {
				if (obj1.name.equals(list.get(i).name)) {
					return i;
				}
			}
		}
		return -1;

	}

}
