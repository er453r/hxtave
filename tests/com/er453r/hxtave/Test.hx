package com.er453r.hxtave;

@:build(com.er453r.hxtave.TestBuilder.build())
class Test{
	public static function main(){
		new Test();
	}

	public function new(){
		new TestUtils();
	}
}
