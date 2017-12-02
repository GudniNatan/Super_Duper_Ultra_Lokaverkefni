(function() {

	// Create the renderer
	let renderD3 = new dagreD3.render();
	//Prepare the dagre graph with the 'longest-path' ranker in order to maximize readability
	let g = new dagreD3.graphlib.Graph({compound:true})
		  .setGraph({rankdir: "UD",align: "UL", ranksep: 40, ranker: "tight-tree", acyclicer:"greedy", marginy:50, marginx:50, edgesep: 80, ranksep: 30})
		  .setDefaultEdgeLabel(function() { return {}; });

	let svg;

	//The main function. It fetches JSON from the HTML document, written in by Django.
	function main(argument) {
		if (jsonData) {
			//After it has the JSON, it creates the graph, and initates the rendering
			createGraph(jsonData);
			postRender();
		}
		else{
			console.log("Error fetching JSON");
			alert("JSON ERROR");
		}
		function postRender(argument) {
			// body...
			if (!svg) {
				svg = d3.select("svg");
			}

			document.querySelectorAll("g.nodes");

			d3.select("g.nodes").node().addEventListener("mouseup", function( event ) {

			    let node = crawlToNode(event.target, "node");
			    if (node && node.classList.contains("availableCourse")) {
			    	//do something
			    	courseClickUpdate(node);
			    }
			}, true);

			d3.select("g.nodes").node().addEventListener("mouseover", function( event ) {
			    let node = crawlToNode(event.target, "node")
			    if (node) {
			    	highlightAllParents(node);
			    }
			}, true);

			d3.select("g.nodes").node().addEventListener("mouseout", function( event ) {
			    let node = crawlToNode(event.target, "node")
			    if (node) {
			    	highlightAllParents(node, false);
			    }
			}, true);



			//d3.select("svg").selectAll("g.node").on("mouseup", function(id) { var _node = g.node(id); console.log("Clicked " + id,_node); });

			document.querySelector("main").addEventListener("contextmenu", function (event) {
				// body...
				event.preventDefault();
			});

			updateGraph();
		}

		document.querySelector("#submitCourses").addEventListener("click", function (event) {
			// body...
			let selected = collectSelectedCourses();
			for (var i = selected.length - 1; i >= 0; i--) {
				let node = getJSONNodeByID(selected[i]);
				node.completed = true;
			}
			updateGraph();
			//post(selected);

		});
	}

	function courseClickUpdate(courseNode) {
		// body...
		courseNode.classList.toggle("selectedCourse");


		let jsonNode;

		for (let i = jsonData.length - 1; i >= 0; i--) {
			if (jsonData[i].node == courseNode){
				jsonNode = jsonData[i];
				break;
			}
		}
		for (var i = jsonNode.precursors.length - 1; i >= 0; i--) {
			let precursor = jsonNode.precursors[i]
			switch(precursor.type){
				case '3':
					let pre_node = getJSONNodeByID(precursor.id);
					pre_node.node.classList.remove("selectedCourse");
					courseNode.classList.remove("selectedCourse", "availableCourse");
				default:
					break;
			}
		}


		for (var i = jsonNode.children.length - 1; i >= 0; i--) {
			let child = jsonNode.children[i];
			let child_node;
			switch(child.type){
				case '2':
					child_node = getJSONNodeByID(child.id);
					let this_pre = child_node.precursors.find(function (x) {
						// body...
						return x.id == jsonNode.id;
					});
					if (this_pre) {
						child_node.precursors = child_node.precursors.filter(item => item !== this_pre);
					}
					else{
						child_node.precursors.push({"id": jsonNode.id, "type": "2"});
					}
					break;
				case '3':
					child_node = getJSONNodeByID(child.id);
					child_node.node.classList.toggle("selectedCourse");
					child_node.node.classList.toggle("availableCourse");
					break;
				default:
					break;
			}
		}

	}

	function getJSONNodeByID(ID) {
		// Simply runs through all the nodes on the graph until the requested one is returned
		for (let i = jsonData.length - 1; i >= 0; i--) {
			if(jsonData[i].id == ID){
				return jsonData[i];
			}
		}
	}

	function crawlToNode(node, expectedClass) {
		// body...
		while(!node.classList.contains(expectedClass)) {
			if (node.nodeName == "BODY") {
				return false;
			}
			node = node.parentNode;
		}
		return node;
	}
	function collectSelectedCourses(){
		courses = [];
		g.nodes().forEach(function(v) {
			let elem = g.node(v).elem;
	    	if (elem && elem.classList.contains("selectedCourse")){

	    		courses.push(v);
	    	}
		});
		return courses;
	}

	function highlightCourseD3Node(d3node, on=true)
	{
		if (on) 
		{
			d3node.select("rect").transition()//Set transition
               	.style('stroke', '#ff4136')
               	.style('stroke-width', 4);

		}
		else{
			d3node.select("rect").transition()//Set transition
				.transition()
               	.style('stroke', '#bfbfbf')
               	.style('stroke-width', 1);
		}

	}

	function highlightAllParents(domNode, on=true) {
		// Gets all parents of a particular node.
		// Changes appearence of those nodes to highlight what courses need to be completed
		// before this one.
		// If on is false it will disable the highlighting.
		let node = getJSONNodeByID(domNode.textContent);
		let parents = getAllParents(node);

		if (!domNode.classList.contains('availableCourse')) {
			parents.push(node);
		}
		for (var i = parents.length - 1; i >= 0; i--) {
			highlightCourseD3Node(d3.select(parents[i].node), on);
		}

	}
	function getParents(node){
		let parents = [];
		for (var i = node.precursors.length - 1; i >= 0; i--) {
			let n = getJSONNodeByID(node.precursors[i].id);
			if (n.completed) {
				continue;
			}
			parents.push(n);
		}
		return parents;
	}
	function getAllParents(node) {
		// body...
		let queue = [node];
		let processed = [];
		let allNodes = [];
		while(queue.length > 0){
			let n = queue.pop();
			let parents = getParents(n);
			for (var i = parents.length - 1; i >= 0; i--) {
				if (processed.indexOf(parents[i]) == -1) {
					queue.push(parents[i]);
				}
				allNodes.push(parents[i]);
			}
		}
		return allNodes;
	}

	function createGraph(jsonData) { //jesús kristur, miskunna þú mér fyrir þennan kóða.
		// This function is clearly a complete monstrosity
		// So what is even going on here?
		// This function takes all the JSON data, and sorts it and prepares it for display.
		// Because the JSON will not actually include all the data needed to display the graph
		// and accurately follow all rules.
		let updateNodesPre = [];
		let updateNodesChild = [];


		//Node labeling and linking
		for (let k = jsonData.length - 1; k >= 0; k--) {
			if (!jsonData[k].children) {
				jsonData[k].children = [];
			}
			if (!jsonData[k].completed) {
				jsonData[k].completed = false;
			}
			for (var l = jsonData[k].precursors.length - 1; l >= 0; l--) {
				let pre = jsonData[k].precursors[l];
				let pre_node = getJSONNodeByID(pre.id);
				if (pre_node) 
				{
					if (!pre_node.children) {
						pre_node.children = [];
					}
					pre_node.children.push({'id': jsonData[k].id, 'type': pre.type});
				}
				else
				{
					alert("Eitthvað er að JSON frá gagnagrunninum. Líklegast vantar einn áfanga í trackcourses!") 
				}
			}
		}

		// Completion and availability followoing precursor rules.
		// Also adds css classes for quality of life 
		for (let i = jsonData.length - 1; i >= 0; i--) {
			let node = jsonData[i];
			let classes = "";
			if (node.completed) 
			{ 
				classes += "completedCourse "; 
			}
			else
			{
				let available = true;
				for (var j = node.precursors.length - 1; j >= 0; j--) {
					if(!node.precursors[j].completed)
					{
						available = false;
						break;
					}
				}
				if (available) { classes += "availableCourse "}
			}

			//Set the node on the graph with all classes
			g.setNode(node.id, {label: node.id, class:classes});

			//These next two if sentences really only matter if you take into account "fastur samfari"
			if (node.precursors.length > 0) {
				let clustered = false;
				for (let j = node.precursors.length - 1; j >= 0; j--) {
					let parent = node.precursors[j].id;
					if (node.precursors[j].type == '3') {
						let c_node = getJSONNodeByID(node.precursors[j].id);
						node.children.push.apply(node.children, c_node.children);
						c_node.children = [{"id": node.id, "type": '3'}];

						let this_node = node.children.find(function (x) {
							return x.id == node.id;
						});
						node.children = node.children.filter(item => item !== this_node);
						for (var x = node.children.length - 1; x >= 0; x--) {
							updateNodesChild.push([node.children[x].id, node, c_node]);
						}
					}
				}
			}
			if (node.children.length > 0) {
				for (var j = node.children.length - 1; j >= 0; j--) {
					if (node.children[j].type == '3') {
						let child = node.children[j].id;
						let c_node = getJSONNodeByID(child);
						node.precursors.push.apply(node.precursors, c_node.precursors);
						c_node.precursors = [{"id": node.id, "type": '3'}];

						let this_node = node.precursors.find(function (x) {
							return x.id == node.id;
						});
						node.precursors = node.precursors.filter(item => item !== this_node);
						for (var x = c_node.children.length - 1; x >= 0; x--) {
							updateNodesPre.push([c_node.children[x].id, node, c_node]);
						}
					}
				}
			}
		}
		// These next 2 for loops will correct any errors related to defining precursor type 3.
		for (var i = updateNodesPre.length - 1; i >= 0; i--) {
			let info = updateNodesPre[i];
			let n = getJSONNodeByID(info[0]);
			for (var k = n.children.length - 1; k >= 0; k--) {
				if(n.children[k].id == info[2].id){
					n.children[k].id = info[1].id;
				}
			}
		}
		for (var i = updateNodesChild.length - 1; i >= 0; i--) {
			let info = updateNodesChild[i];
			let n = getJSONNodeByID(info[0]);
			for (var k = n.precursors.length - 1; k >= 0; k--) {
				if(n.precursors[k].id == info[2].id){
					n.precursors[k].id = info[1].id;
				}
			}
		}
		//This for loop actually draws the connections between all the nodes on the graph
		for (let i = jsonData.length - 1; i >= 0; i--) {
			let node = jsonData[i];
			for (let j = node.precursors.length - 1; j >= 0; j--) {
				let parent = node.precursors[j];
				let tempid = node.id;
				let parent_node = getJSONNodeByID(parent.id);
				let samLabel;
				if (parent.type == '3') {
					samLabel = "(fastur samfari)";
				}
				if(parent.type == '2')
				{
					samLabel = "(samfari)";
				}
				let edgeminlen = 1;
				let edgeWeight = 2;
				for (let k = tempid.length - 1; k >= 0; k--) {
					try
					{
						if(tempid[k] == parent.id[k])
						{
							edgeWeight *= 2;
						}
					}
					catch (e){
						break;
					}
				}
				let edgeclass = "";
				if (tempid[tempid.length-1] != parent.id[parent.id.length-1]) { edgeWeight = parseInt(Math.sqrt(edgeWeight));}
				if (edgeWeight <= 32) 
				{
					edgeclass="low-weight";
				}
				g.setEdge(parent.id, tempid, {curve: d3.curveBasis, label: samLabel, weight: edgeWeight, class: edgeclass, minlen: edgeminlen});

			}
			if (node.precursors.length == 0 && node.children.length == 0) {
				g.setNode('singlesGroup', {class: "bg-primary"});
				g.setParent(node.id, 'singlesGroup');
			}
		}
		render();
	}

	function updateGraph() {
		// Updates the graph, locking in completed courses, and unlocking newly available courses.
		for (let i = jsonData.length - 1; i >= 0; i--) {
			let node = jsonData[i]
			let precursors = jsonData[i].precursors;
			let open = true;
			if (node.completed) {
				node.node.classList.add("completedCourse");
				node.node.classList.remove("availableCourse");
				node.node.classList.remove("selectedCourse");
				continue;
			}
			for (let j = precursors.length - 1; j >= 0; j--) {
				let node = getJSONNodeByID(precursors[j].id);
				if (!node.completed) {
					open = false;
					break;
				}
			}
			if (open) {
				node.node.classList.add("availableCourse");
			}
		}

	}

	function post(params, path="", method="post") {
		// Currently not in use, but you would need to submit to the server from this page
		// to update the main page display
	    let form = document.getElementById('courseDataForm');
	    for(let key in params) {
	        if(params.hasOwnProperty(key)) {
	            let hiddenField = document.createElement("input");
	            hiddenField.setAttribute("type", "hidden");
	            hiddenField.setAttribute("name", key);
	            hiddenField.setAttribute("value", params[key]);

	            form.appendChild(hiddenField);
	        }
	    }
	    form.submit();
	}

	function render() {

		// Set up an SVG group so that we can translate the final graph.
		let parent = d3.select(d3.select("svg").node().parentNode);
		svg = d3.select("svg");

		svg.attr("width", Math.min(svg.node().getBoundingClientRect().width, svg.node().parentNode.getBoundingClientRect().width))
		    
		let inner = svg.append("g");

		// Run the renderer. This is what draws the final graph.
		renderD3(inner, g);

		// Set up zoom support
		let zoom = d3.zoom().on("zoom", function() {
			inner.attr("transform", d3.event.transform);
		  });

		//Adds a filter, so that you will not be able to pan the graph with the left mouse button
		zoom.filter(function(i, j, k, l) {
			if (d3.event.type == 'mousedown') {
				return d3.event.button;
			}
			return !d3.event.button;
		})

		//Apply the zoom support to the main SVG
		svg.call(zoom);


		// Center the graph
		var initialScale = 0.5;
		svg.attr('height', g.graph().height * initialScale + 40);
		
		let transform = d3.zoomTransform(svg.node()).translate((svg.attr("width") - g.graph().width * initialScale) / 2, 0)
													.scale(initialScale);
		svg.call(zoom.transform, transform);



		inner.selectAll("g.node").each(function(d, i, j) {
			// body...
			j[i].classList.add('course');
			for (let k = jsonData.length - 1; k >= 0; k--) {
				if (jsonData[k].id == d){
					//Store a reference to the actual DOM node within the jsonData
					jsonData[k].node = j[i];
				}
			}
			d3.select(j[i]).select("rect")
                	.style('stroke', '#bfbfbf');
		});

	}


	//window.addEventListener("load", main, true);
	//window.addEventListener("resize", render, true);
	main();
})();