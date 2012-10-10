/*
 * Function to check/uncheck all checkboxes based on header checkbox.
 * Accept form name as first parmeter, header check box as second.
 */
function checkedAll (formid, source) {
	var form = document.getElementById(formid);
	for (var i =0; i < form.elements.length; i++)
		form.elements[i].checked = source;
}

/*
 * Function validate that at least one checkbox is checked inside list
 * Accept form name as frist parameter.
 */
function validateForm(formid){
	return true;

	var checkboxes=[];
	var form = document.getElementById(formid);
	checkboxes = form.getElementsByTagName('input')
	for (var j = 0; j< checkboxes.length; ++j){
        if(checkboxes[j].type == "checkbox"
        	&& checkboxes[j].checked==true){
        	return true;
        	}
	}
	// At least one record should be selected
    alert('Please select at least one record')
	return false;
}
