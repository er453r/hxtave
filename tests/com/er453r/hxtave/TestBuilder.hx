package com.er453r.hxtave;

import haxe.macro.Context;
import haxe.macro.Expr.Field;

class TestBuilder {
	public static function build():Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();

		trace("hello from macro");

		return fields;
	}
}
