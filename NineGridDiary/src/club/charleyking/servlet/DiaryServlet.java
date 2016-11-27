package club.charleyking.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import club.charleyking.dao.DiaryDao;
import club.charleyking.model.Diary;
import club.charleyking.util.DBConnection;
import club.charleyking.util.Pagination;

/**
 * Servlet implementation class DiaryServlet
 */
@WebServlet("/DiaryServlet")
public class DiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Pagination pagination = null;
	DiaryDao diaryDao = new DiaryDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("preview".equals(action)) {
			preview(request, response);
		} else if ("save".equals(action)) {
			save(request, response);
		} else if ("listAllDiary".equals(action)) {
			listAllDiary(request, response);
		} else if ("listMyDiary".equals(action)) {
			listMyDiary(request, response);
		} else if ("deleteDiary".equals(action)) {
			deleteDiary(request, response);
		}
	}

	private void deleteDiary(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void listMyDiary(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void listAllDiary(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		String strPageNumber = (String) request.getParameter("page");
		int pageNumber = 1;
		int pageSize = 4;
		List<Diary> list = null;
		if (strPageNumber == null) {
			String sql = "select * from tb_diary";
			list = diaryDao.queryDiary(sql);
			pagination = new Pagination(list, pageNumber, pageSize);
			request.getSession().setAttribute("pagination", pagination);
		} else {
			pagination = (Pagination) request.getSession().getAttribute("pagination");
			pageNumber = pagination.getThisPageNumber(strPageNumber);
			list = pagination.getAppointPage(pageNumber);
		}
		request.setAttribute("diaryList", list);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("url", "listAllDiary");
		System.out.println(list.size());
		request.getRequestDispatcher("listAllDiary.jsp").forward(request, response);
	}

	private void save(HttpServletRequest request, HttpServletResponse response)  {
		// TODO Auto-generated method stub
		
	}

	private void preview(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
