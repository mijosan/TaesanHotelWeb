package com.spring.TaesanHotelWeb.biz.common;

public class PageMaker {
	private int totalcount;//��ü �Խù� ����
	private int pagenum;//���� ������ ��ȣ
	private int contentnum=10;//�� �������� � ǥ������
	private int startPage=1;//���� ������ ����� ���� ������
	private int endPage=10;//���� ������ ����� ������ ������
	private boolean prev=false;//���� �������� ���� ȭ��ǥ
	private boolean next;//���� �������� ���� ȭ��ǥ
	private int currentblock;//���� ������ ���
	private int lastblock;//������ ������ ���
	
	//prev & next ��ư Ȱ��ȭ
	public void prevnext(int pagenum) {
		if(pagenum>0 && pagenum<11) {
			setPrev(false);
			setNext(true);
		}else if(getLastblock() == getCurrentblock()) {
			setPrev(true);
			setNext(false);
		}else {
			setPrev(true);
			setNext(true);
		}
	}
	
	
	//��ü ������ ���� ����ϴ� �޼ҵ�
	public int calcpage(int totalcount, int contentnum) {
		
		//125 / 10 = 12.5
		//13������
		
		//50 / 10 = 5
		//5������
		
		int totalpage = totalcount / contentnum;
		if(totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	
	//�Ѻ���� ����������
	public void setStartPage(int currentblock) {
		this.startPage = (currentblock*10)-9;
		//1 2 3 4 5
		//6 7 8 9 10
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	//�Ѻ���� ������������
	public void setEndPage(int getlastblock, int getcurrentblock) {
		//��������� �϶�
		if(getlastblock == getcurrentblock) {
			this.endPage = calcpage(getTotalcount(), getContentnum()); //������ ������
		}else {
			this.endPage = getStartPage()+9;
		}
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentblock() {
		return currentblock;
	}
	
	//���� ������ ���
	public void setCurrentblock(int pagenum) {
		//������ ��ȣ�� ���ؼ� ���Ѵ�.
		this.currentblock = pagenum/10; //11������/10 = 1.05
		if(pagenum%10>0) {//11%10>0 => ��. ��������������
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	
	//������������ ���
	public void setLastblock(int lastblock) {
		//10��, 10������ => 100��
		
		//301���� �Խñ� / 100 = 3.xx��� => +1 ���༭ 4��� ����������
		this.lastblock = totalcount / (10*this.contentnum);
		if(totalcount % (10*this.contentnum)>0) {
			this.lastblock++;
		}
	}
}
