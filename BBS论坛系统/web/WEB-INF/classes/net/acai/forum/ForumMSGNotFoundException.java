package net.acai.forum;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import java.io.PrintStream;
import java.io.PrintWriter;
public class ForumMSGNotFoundException extends Exception
{
	private Throwable testThrowable=null;
	public ForumMSGNotFoundException()
	{
		super();
	}
	public ForumMSGNotFoundException(String msg)
	{
		super(msg);
	}
	public ForumMSGNotFoundException(Throwable testThrowable)
	{
		this.testThrowable=testThrowable;
	}
	public ForumMSGNotFoundException(String msg ,Throwable testThrowable){
		super(msg);
		this.testThrowable=testThrowable;
	}
	public void printStackTrace(){
		super.printStackTrace();
		if(testThrowable!=null){
			testThrowable.printStackTrace();
		}
	}
	public void printStackTrace(PrintStream ps){
		super.printStackTrace(ps);
		if(testThrowable!=null){
			testThrowable.printStackTrace(ps);
		}
	}
	public void printStackTrace(PrintWriter pw){
		super.printStackTrace(pw);
		if(testThrowable!=null){
			testThrowable.printStackTrace(pw);
		}
	}
}
