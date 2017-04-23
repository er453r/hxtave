package com.er453r.hxtave;

import sys.io.File;
import haxe.macro.Context;
import haxe.macro.Expr.Field;

class TestBuilder {
	public static function build():Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();

		trace("hello from macro");

		MacroUtils.recursiveLoop("tests/" + MacroUtils.getContextPath("tests"), function(path){
			trace("found " + path);
		});

		return fields;
	}
}
