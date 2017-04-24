package com.er453r.hxtave;

import haxe.unit.TestRunner;

@:build(com.er453r.hxtave.TestBuilder.build())
class Test{
	public static function main(){
		var testRunner = new TestRunner();

		for(key in tests.keys())
			testRunner.add(new ScriptTest(key, tests.get(key)));

		testRunner.run();
	}
}
