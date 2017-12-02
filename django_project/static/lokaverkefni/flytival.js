(function() {
	let buttons = document.querySelectorAll(".courseCheckbox");
	let submit = document.getElementById('submitCourses');
	let form = document.getElementById('courseDataForm');
	let einingarfjoldi = document.getElementById('einingarfjoldi');

	submit.addEventListener("click", function (event) {
		//Add all the checkboxes to the form and submit
		for (var i = buttons.length - 1; i >= 0; i--) {
			if (buttons[i].classList.contains("active")){
				let hiddenField = document.createElement("input");
			    hiddenField.setAttribute("type", "hidden");
			    hiddenField.setAttribute("name", "courses[]");
			    hiddenField.setAttribute("value", buttons[i].id);
			    hiddenField.id = buttons[i].id;
				form.appendChild(hiddenField);
			}
		}
		form.submit();
	});

	document.body.addEventListener("click", function(event){
		//Reikna einingarfjolda
		let fjoldi = 0;
		for (var i = buttons.length - 1; i >= 0; i--) {
			if (buttons[i].classList.contains("active")){
				fjoldi++;
			}
		}
		einingarfjoldi.textContent = fjoldi;
		if (fjoldi > 35) {
			submit.setAttribute("disabled");
		}
	});
})();