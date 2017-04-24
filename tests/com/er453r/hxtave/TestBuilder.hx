package com.er453r.hxtave;

import haxe.macro.Context;
import haxe.macro.Expr.Field;
import haxe.macro.Expr;

class TestBuilder {
	public static function build():Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();

		var tests:Array<Expr> = [];

		MacroUtils.recursiveLoop("tests/" + MacroUtils.getContextPath("tests"), function(path){
			tests.push(macro $v{path} => $v{MacroUtils.getFileContent(path)});
		});

		fields.push({
			name: "tests",
			kind: FieldType.FVar(macro : Map<String, String>, macro $a{tests}),
			access: [Access.APrivate, Access.AStatic],
			pos: Context.currentPos()
		});

		return fields;
	}
}
