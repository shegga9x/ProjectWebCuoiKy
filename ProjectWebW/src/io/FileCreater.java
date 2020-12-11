package io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import beans.Product;
import database.ProductDAO;

public class FileCreater {
	public FileCreater() throws IOException {
		List<Product> list = new ProductDAO().ShowAll();
		for (Product p : list) {
			String src = "WebContent/SPdon/" + p.getLoai() + "/" + p.getFilename1() + ".jsp";
			createFile(src);
		}
	}

	public void createFile(String filename) throws IOException {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		File f1 = new File("src/io/jsp.txt");
		String src = f1.getAbsolutePath();
		bis = new BufferedInputStream(new FileInputStream(new File(src)));
		bos = new BufferedOutputStream(new FileOutputStream(new File(filename)));
		int length;
		byte[] buffer = new byte[1024];
		while ((length = bis.read(buffer)) > 0) {
			bos.write(buffer, 0, length);
		}
		bis.close();
		bos.close();
	}

	public static void main(String[] args) throws IOException {
//		FileCreater fc1 = new FileCreater();
		
	}
}
