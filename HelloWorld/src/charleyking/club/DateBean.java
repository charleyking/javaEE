package charleyking.club;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateBean {
	private String dateTime;
	private String week;
	private String[] weeks = {"Sunday","Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
	private Calendar calendar = Calendar.getInstance();
	
	public String getDateTime() {
		Date currentDate = calendar.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateTime = sdf.format(currentDate);
		return dateTime;
	}
	
	public String getWeek() {
		int index = calendar.get(Calendar.DAY_OF_WEEK);
		week = weeks[index-1];
		return week;
	}
}
