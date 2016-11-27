/**
 * 
 */

var net = new Object();
net.AjaxRequest = function(url, onload, onerror, method, params) {
	this.req = null;
	this.onload = onload;
	this.onerror = (onerror) ? onerror:this.defaultError;
	this.loadDate(url,method,params);
}





