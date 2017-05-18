package com.er453r.hxtave;

import com.er453r.hxtave.HxtaveParser;
import com.er453r.utils.Log;
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
		print('Script ${name} ');

		var parser:HxtaveParser = new HxtaveParser();

		Log.debug('\nScript contents:\n\n${this.test}\n\n');

		parser.parse(this.test);

		parser.run();

		// if the parser does not throw an exception - OK
		assertTrue(true);
	}
}
