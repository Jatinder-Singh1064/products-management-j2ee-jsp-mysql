package model;
/*
 * Product Entity mapped to products table in database
 */
public class Product {
	private String ProductSerialNumber, ProductName, ProductModel, ProductColor, ProductCompany;

	public String getProductSerialNumber() {
		return ProductSerialNumber;
	}

	public void setProductSerialNumber(String productSerialNumber) {
		ProductSerialNumber = productSerialNumber;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getProductModel() {
		return ProductModel;
	}

	public void setProductModel(String productModel) {
		ProductModel = productModel;
	}

	public String getProductColor() {
		return ProductColor;
	}

	public void setProductColor(String productColor) {
		ProductColor = productColor;
	}

	public String getProductCompany() {
		return ProductCompany;
	}

	public void setProductCompany(String productCompany) {
		ProductCompany = productCompany;
	}
}
