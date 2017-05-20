package com.er453r.hxtave;

import com.er453r.hxtave.prototypes.Node;
import com.er453r.parser.EOFToken;
import com.er453r.hxtave.nodes.ConstantNode;
import com.er453r.parser.prototypes.Token;
import com.er453r.parser.prototypes.TokenConsumer;

import com.er453r.hxtave.nodes.SpaceNode;
import com.er453r.hxtave.nodes.SemicolonNode;
import com.er453r.hxtave.nodes.NewlineNode;

import com.er453r.utils.Log;

class Branch implements TokenConsumer {
	private var nodes:Array<Node> = [];
	private var node:Node;

	public function new(){}

	private function name(token:Token):String{
		return Type.getClassName(Type.getClass(token)).split(".").pop();
	}


	public function addToken(token:Token){
		addNode(cast token);
	}

	public function addNode(node:Node){
		if(Std.is(node, SpaceNode)){
			Log.debug("Ignoring whitespace");

			return;
		}

		Log.debug('New ${name(node)}} appeared');

		if(Std.is(node, SemicolonNode) || Std.is(node, NewlineNode) || Std.is(node, EOFToken)){
			Log.debug("Semicolon/new line/EOF terminates existing expression");

			if(this.node != null)
				nodes.push(this.node);

			this.node = null;

			return;
		}

		if(node.acceptsNodes()){
			Log.debug("New consumer appeared");

			node.addNode(this.node);

			this.node = node;

			return;
		}

		if(this.node == null){
			Log.debug("Addding node");

			this.node = node;

			return;
		}

		if(this.node.acceptsNodes()){
			Log.debug("Adding to existing consumer");

			this.node.addNode(node);

			return;
		}

		throw "Do not know what to do with" + Type.typeof(node);
	}

	public function run(context:Context){
		Log.debug('Running ${nodes.length} nodes');

		for(node in nodes){
			Log.debug('Running ${name(node)}}');
		}
	}
}
