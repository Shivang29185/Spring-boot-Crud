$(document).ready(function(){
	$('.AddupdateCustomer').click(function(){
		$('#myModal').show(2000);
		
	});
	
	$('#update').click(function(){
		$('#myModal').show(2000);
		
	});
	
	$('.close').click(function(){
		$("#myModal").hide(2000);
	});
	
	$('input[id$=#date]').datepicker({
		dateFormat: 'dd-mm-yy'
	});
});