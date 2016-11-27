package club.charleyking.util;

import java.util.ArrayList;
import java.util.List;

import club.charleyking.model.Diary;

public class Pagination {
	public List<Diary> list = null;
	private int recordCount = 0;
	private int pageSize = 0;
	private int maxPageNumber = 0;
	
	public Pagination(List<Diary> list, int page, int pageSize) {
		this.list = list;
		recordCount = list.size();
		this.pageSize = pageSize;
		this.maxPageNumber = getMaxPageNumber();
	}
	
	public List<Diary> getInitPage(List<Diary> list, int page, int pageSize) {
		List<Diary> newList = new ArrayList<Diary>();
		this.list = list;
		recordCount = list.size();
		this.pageSize = pageSize;
		this.maxPageNumber = getMaxPageNumber();
		try {
			for(int i=(page-1)*pageSize; i<=page*pageSize-1; i++) {
				try {
					if (i >= recordCount) {
						break;
					}
				} catch (Exception e) {
					newList.add(list.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newList;
	}

	public int getMaxPageNumber() {
		int maxPage = 0;
		if (recordCount%pageSize == 0) {
			maxPage = recordCount/pageSize;
		} else {
			maxPage = recordCount/pageSize + 1;
		}
		return maxPage;
	}
	
	public int getRecordCount() {
		return recordCount;
	}
	
	public int getThisPageNumber(String strPageNumber) {
		if (strPageNumber == null) {
			strPageNumber = "0";
		}
		int pageNumber = Integer.parseInt(strPageNumber);
		if (pageNumber < 1) {
			pageNumber = 1;
		} else {
			if (((pageNumber-1)*pageSize+1) > recordCount) {
				pageNumber = maxPageNumber;
			}
		}
		return pageNumber;
	}
	
	public List<Diary> getAppointPage(int page) {
		List<Diary> newList = new ArrayList<Diary>();
		try {
			for(int i=(page-1)*pageSize; i<=page*pageSize-1; i++) {
				try {
					if (i>=recordCount) {
						break;
					}
				} catch (Exception e) {
					newList.add(list.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newList;
	}
	
	public String printCtrl(int page, String url, String para) {
		String strHtml = "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"
				+ "<td height='24' align='right'>current page:[" + page +  "/" + maxPageNumber + "] &nbsp;";
		try {
			if (page>1) {
				strHtml = strHtml + "<a href='"+url+"&page=1"+para+"'>first page</a> ";
				strHtml = strHtml + "<a href='"+url+"&page="+(page-1)+para+"'>previous</a>";
			}
			if (page<maxPageNumber) {
				strHtml = strHtml + "<a href='"+url+"&page="+(page+1)+para+"'>next</a> ";
				strHtml = strHtml + "<a href='"+url+"&page="+maxPageNumber+para+"'>last&nbsp;</a>";
			}
			strHtml = strHtml + "</td> </tr>  </table>";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strHtml;
	}
	
}
