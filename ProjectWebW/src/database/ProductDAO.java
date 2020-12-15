package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Product;

public class ProductDAO {
	private boolean biendoi = false;

	public boolean isBiendoi() {
		return biendoi;
	}

	public void setBiendoi(boolean biendoi) {
		this.biendoi = biendoi;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ProductDAO() {
		super();
		conn = Connect.getConnection();
	}

	// INSERT
	public boolean addProduct(Product p) {
		boolean b = false;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO SANPHAM ([id] ,[name] ,[gia],[loai],[sluong],[filename1],[description])  VALUES (?,?,?,?,?,?,?)");
			pstmt.setString(1, p.getId());
			pstmt.setString(2, p.getName());
			pstmt.setDouble(3, p.getGia());
			pstmt.setString(4, p.getLoai());
			pstmt.setDouble(5, p.getSluong());
			pstmt.setString(6, p.getFilename1());
			pstmt.setString(7, p.getDescription());
			b = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return b;
	}

	// LIST ALL
	public ArrayList<Product> showProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SANPHAM");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				Product product = new Product(id, name, gia, loai, sluong, filename1, description);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// VIEW EDIT
	public Product showByID(String id) {
		Product p = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SanPham WHERE id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				p = new Product(id, name, gia, loai, sluong, filename1, description);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return p;
	}

	public Product showByfilename1(String sp_fname) {
		Product p = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SanPham WHERE filename1 = ?");
			pstmt.setString(1, sp_fname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				p = new Product(id, name, gia, loai, sluong, filename1, description);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return p;
	}

	// UPDATE
	public boolean updateProduct(String id, Product p) {
		boolean b = false;
		try {
			pstmt = conn.prepareStatement(
					"UPDATE SanPham SET [name] = ?,[gia] = ?,[loai] = ?,[sluong] = ?,[filename1] = ?,[description] = ? WHERE id =?");
			pstmt.setString(1, p.getName());
			pstmt.setDouble(2, p.getGia());
			pstmt.setString(3, p.getLoai());
			pstmt.setInt(4, p.getSluong());
			pstmt.setString(5, p.getFilename1());
			pstmt.setString(6, p.getDescription());
			pstmt.setString(7, id);
			b = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return b;
	}

	public boolean updateProduct1(String id, Product p) {
		boolean b = false;
		try {
			pstmt = conn.prepareStatement(
					"UPDATE SanPham SET [gia] = ?,[loai] = ?,[sluong] = ?,[filename1] = ?,[description] = ? WHERE id =?");
			pstmt.setDouble(1, p.getGia());
			pstmt.setString(2, p.getLoai());
			pstmt.setInt(3, p.getSluong());
			pstmt.setString(4, p.getFilename1());
			pstmt.setString(5, p.getDescription());
			pstmt.setString(6, id);
			b = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return b;
	}

	// DELETE
	public boolean deleteProduct(String name) {
		boolean b = false;
		try {
			pstmt = conn.prepareStatement("DELETE FROM SanPham WHERE id = ?");
			pstmt.setString(1, name);
			b = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	// LIST SEARCH
	public ArrayList<Product> listByName(String first_Name) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SanPham WHERE name= ? ");
			pstmt.setString(1, first_Name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				Product product = new Product(id, name, gia, loai, sluong, filename1, description);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<Product> listByType(String type) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SanPham WHERE loai= ? ");
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				Product product = new Product(id, name, gia, loai, sluong, filename1, description);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<Product> ShowAll() {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SanPham  ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double gia = rs.getDouble("gia");
				String loai = rs.getString("loai");
				int sluong = rs.getInt("sluong");
				String filename1 = rs.getString("filename1");
				String description = rs.getString("description");
				Product product = new Product(id, name, gia, loai, sluong, filename1, description);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<String> idList() {
		ArrayList<String> list = new ArrayList<String>();
		for (Product product : showProduct()) {
			list.add(product.getId());
		}
		return list;

	}

	public ArrayList<String> getIMG(String id) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement("select * from PImg where idP = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				list.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getcarQ(String idU, String idP) {
		int sluong = 0;
		try {
			pstmt = conn.prepareStatement("select * from CARTitem where idU = ? and idP = ?");
			pstmt.setString(1, idU);
			pstmt.setString(2, idP);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sluong = rs.getInt("sluong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sluong;
	}
}