package com.er453r.utils;

import haxe.PosInfos;

enum LogLevel{
	INFO;
	DEBUG;
	ERROR;
}

class Log {
	public static var level:LogLevel = LogLevel.DEBUG;

	private static var time:Float = 0;

	public static inline function info(message:String, ?pos : PosInfos){
		var temp:Float = Date.now().getTime();
		var diff:Float = temp - time;
		time = temp;

		logTrace('${DateTools.format(Date.now(), '%H:%m:%S')} [INFO] ${pos.fileName}:${pos.lineNumber} (${pos.methodName}) ${message} (dt: ${diff} ms.)');
	}

	public static inline function debug(message:String, ?pos : PosInfos){
		if(level == LogLevel.DEBUG){
			#if debug
			var temp:Float = Date.now().getTime();
			var diff:Float = temp - time;
			time = temp;

			logTrace('${DateTools.format(Date.now(), '%H:%m:%S')} [DEBUG] ${pos.fileName}:${pos.lineNumber} (${pos.methodName}) ${message} (dt: ${diff} ms.)');
			#end
		}
	}

	public static inline function error(message:String, ?pos : PosInfos){
		var temp:Float = Date.now().getTime();
		var diff:Float = temp - time;
		time = temp;

		logTrace('${DateTools.format(Date.now(), '%H:%m:%S')} [ERROR] ${pos.fileName}:${pos.lineNumber} (${pos.methodName}) ${message} (dt: ${diff} ms.)');
	}

	private static inline function logTrace(message:String){
		#if js
		untyped __js__("console").log(message);
		#else
		trace(message);
		#end
	}
}
