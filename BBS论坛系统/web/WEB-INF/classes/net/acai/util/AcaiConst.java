package net.acai.util;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import java.text.SimpleDateFormat;
import java.text.*;
import java.util.Date;

/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      211.68.39.120��webcpu.51.net
 * @author SuperSpace
 * @version 1.0
 */
 public class AcaiConst{
	public static String getDateTime(){
		SimpleDateFormat formatter=new SimpleDateFormat();
		String NDateTime=formatter.format(new Date());
		return NDateTime;
	}
}