// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function mark_for_destruction(element, destroy_class, div_to_hide_class) {
	$(element).next(destroy_class).value = 1;
	$(element).up(div_to_hide_class).hide();
}
