package com.er453r.hxtave;

import haxe.unit.TestCase;

class ScriptTest extends TestCase{
	private var name:String;
	private var test:String;

	public function new(name:String, test:String){
		super();

		this.name = name;
		this.test = test;
	}

	public function testScript() {
		Math.random() > 0.1 ? assertEquals("A", "A") : assertEquals("A", "B");
	}
}
