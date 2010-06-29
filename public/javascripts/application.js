// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function mark_for_destruction(element) {
	$(element).next('.should_destroy_telephone').value = 1;
	$(element).up('.telephone_partial').hide();
}