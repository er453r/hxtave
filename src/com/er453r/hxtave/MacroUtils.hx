package com.er453r.hxtave;

import sys.FileSystem;
import sys.io.File;
import haxe.macro.Context;

class MacroUtils {
	static public function getContextPath(fileName:String):String {
		var classString:String = Context.getLocalClass().toString();

		var parts:Array<String> = classString.split(".");
		parts.pop();
		var path:String = parts.join("/");

		return path + "/" + fileName;
	}

	static public function contextFileExists(fileName:String):Bool {
		var exists:Bool = false;

		try{
			Context.resolvePath(getContextPath(fileName));

			exists = true;
		}
		catch(err:String){}

		return exists;
	}

	static public function getFileContent(fileName:String):String {
		return File.getContent(Context.resolvePath(getContextPath(fileName)));
	}

	static public function recursiveLoop(path:String, handler:String->Void){
		if (FileSystem.exists(path)){
			for(file in FileSystem.readDirectory(path)){
				var path = path + "/" + file;

				if(FileSystem.isDirectory(path))
					recursiveLoop(path + "/", handler)
				else
					handler(path);
			}
		}
	}
}
