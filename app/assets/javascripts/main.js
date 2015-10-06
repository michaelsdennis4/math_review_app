$('document').ready(function() {

	console.log("main.js linked");

	var confirmDelete = function(event) {
		var target = event.target.getAttribute('id');
		if (window.confirm('Are you sure you want to delete this '+target+'?\r\nIt cannot be undone.') != true) {
				event.preventDefault();
		 };
	};

	var checkFileSelected = function(event) {
		var form = event.target.parentElement;
		var selector = form.querySelector('input[name="image"]');
		var files = selector.files.length;
		if (files == 0) {
			window.alert("Please select a file to upload.");
			event.preventDefault();
		};
	};

	var revealAnswer = function(event) {
		event.preventDefault();
		console.log(event);
		$("div.answer").toggleClass("hidden");
		if (event.target.defaultValue == "Reveal Answer") {
			event.target.defaultValue = "Hide Answer"
		} else {
			event.target.defaultValue = "Reveal Answer"
		};
	};

	var checkStudentSelected = function(event) {
		var form = event.target.parentElement;
		var student = form.querySelector('select[name="student_id"]');
		if (student.value == 0) {
			window.alert("Please select a student.");
			event.preventDefault();
		};		
	};

	var changeTestType = function(event) {
		var section = $('div#paper_test');
		section.toggleClass('hidden');
	};

	var openTest = function(event) {
		event.preventDefault();
		var link = event.target.getAttribute('href');
		window.open(
	    link,
	    "Final Test",
	    "resizable,scrollbars,status"
	  );	
	};

	$(".delete").bind('click', confirmDelete);

	$("input.upload").bind('click', checkFileSelected);

	$("input.reveal").bind('click', revealAnswer);

	$("input#add_assessment").bind('click', checkStudentSelected);

	$("input[name=test_type]").bind('change', changeTestType);

	$('a#test_link').on('click', openTest);

});
