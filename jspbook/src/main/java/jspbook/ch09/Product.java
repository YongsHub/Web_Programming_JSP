package jspbook.ch09;

public class Product {
	private String[] productList = {"item1(핸드폰)", "item2(시계)", "item3(오디오)", "item4(컴퓨터)", "item5(노트북)"};
	
	private int num1 = 10;
	private int num2 = 20;
	
	public int getNum1() {
		return num1;
	}
	
	public int getNum2() {
		return num2;
	}
	
	public String[] getProductList() {
		return productList;
	}
}
