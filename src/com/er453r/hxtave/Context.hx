package com.er453r.hxtave;

class Context {
	private var variables:Map<String, Variable> = new Map<String, Variable>();
	private var parent:Context;
	private var lock:Bool;
	private var name:String;

	public function new(?parent:Context, ?name:String) {
		this.parent = parent;
		this.name = name;
	}

	public function setVariable(name:String, value:Variable):Void{
		var context:Context = findContextWithVariable(name);

		if(context == null || context == this){
			trace('[${this.name}] Setting variable "${name}" to value "${value.getFloatValue()}"');

			variables.set(name, value);
		}
		else
			context.setVariable(name, value);
	}

	public function getVariable(name:String):Variable{
		var context:Context = findContextWithVariable(name);
		var temp:Variable;

		if(context == this){
			temp = variables[name];

			trace('[${this.name}] Getting float variable "${name}" of value "${temp.getFloatValue()}"');
		}
		else if(context == null)
			throw "No such variable!!!";
		else
			temp = context.getVariable(name);

		return temp;
	}

	public function isLcoked():Bool{
		return this.lock;
	}

	public function setLcok(isLocked:Bool):Void{
		this.lock = isLocked;
	}

	public function hasVariable(name:String):Bool{
		return variables.get(name) != null;
	}

	public function getParent():Context{
		return parent;
	}

	private function findContextWithVariable(name:String):Context{
		var context:Context = this;

		while(context != null && !context.hasVariable(name))
			context = context.getParent();

		return context;
	}
}
