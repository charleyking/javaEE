package club.charleyking.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import club.charleyking.model.Diary;
import club.charleyking.util.DBConnection;

public class DiaryDao {
	private DBConnection myConnection = null;
	private Date date = null;
	
	public DiaryDao() {
		myConnection = new DBConnection();
	}
	
	public List<Diary> queryDiary(String sql) {
		List<Diary> list = new ArrayList<Diary>();
		ResultSet rs = myConnection.executeQuery(sql);
		if (rs == null) {
			System.out.println("in diary dao, rs is null");
		}
		try {
			while (rs.next()) {
				Diary diary = new Diary();
				diary.setId(rs.getInt(1));
				diary.setTitle(rs.getString(2));
				diary.setAddress(rs.getString(3));
				try {
					date = DateFormat.getDateTimeInstance().parse(rs.getString(4));
					diary.setWriteTime(date);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				diary.setUserid(rs.getInt(5));
				list.add(diary);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
