var main = function() {

	var extraAttendingGuests = $(".extra-guest:not(.not-attending)")
	if (extraAttendingGuests.length > 0) {
		var extraAttendingGuest = extraAttendingGuests.first();
		$("#extra-guests").append(extraAttendingGuest);
	}
	
	//var modalGallery = new ModalGallery();
	
	var currentImage;
	$(".photo-grid").on("click",".photo-square",function(e) {
		e.preventDefault();
		currentImage = $(this);
		var currentImageURL = $(this).attr("href");
        $("#photo-modal-gallery img").attr("src", currentImageURL);
		$("#photo-modal-gallery").show();

	    $("#next-image").click(showNextImage);	
		$("#previous-image").click(showPreviousImage);
		$("#close-modal").click(closeImage);

		$(document).keydown(function(e){
			if(e.keyCode ==27) {
				closeImage();
				e.preventDefault();
				$(document).off('keydown');
			} else if (e.keyCode==37) {
				showPreviousImage();
				e.preventDefault();
			} else if (e.keyCode==39) {
				showNextImage();
				e.preventDefault();
			}
		})
	
	})

	function closeImage() {
		$("#photo-modal-gallery").hide();
		$("#close-modal").off('click');
		$("#next-image").off('click');
		$("#previous-image").off('click');
	}
	function showNextImage() {
    	var nextImage = currentImage.closest("li").next();	
    	if (nextImage.length == 0) {
    		return;
    	}
    	var nextImageURL= nextImage.find(".photo-square").attr("href");
    	currentImage = nextImage ;
    	$("#photo-modal-gallery img").attr("src",nextImageURL);
     }
	function showPreviousImage(){
    	var previousImage = currentImage.closest("li").prev();	
    	if (previousImage.length == 0) {
    		return;
    	}
    	var previousImageURL= previousImage.find(".photo-square").attr("href");
    	currentImage = previousImage ;
    	$("#photo-modal-gallery img").attr("src",previousImageURL);	
     }


	$("#rsvp-button").click(function(){
		$("#rsvp-modal").addClass('show');
		$(document).keydown(function(e){
			if(e.keyCode ==27) {
				e.preventDefault();
				closeRsvpModal();
			}
		})	
	})

	function closeRsvpModal() {
		$("#rsvp-modal").removeClass('show');
		$(document).off('keydown');
		$("#rsvp-modal").removeClass(
			'rsvp-submission-coming',
			'rsvp-submission-not-coming',
			'rsvp-submission-error');
	}

	$("#close-rsvp").click(closeRsvpModal);

	$("#add-extra-guest").click(function(e) {
		e.preventDefault();
		if ($(".extra-guest.not-attending").length < 1) { 
			return;
		}
		var extraGuest = $(".extra-guest.not-attending").first();
		extraGuest.removeClass('not-attending');
		$("#extra-guests").append(extraGuest);
		if ($(".extra-guest.not-attending").length < 1) {
			$(this).hide();
		}
	});

	$("#wedding_invite_is_coming_true, #wedding_invite_is_coming_false").change(function(e) {
		var showAttendanceInfo = (this.value == 'true');
		$("#attendance-info").toggleClass('show', showAttendanceInfo);
	});

	$("#extra-guests").on("click", ".remove-guest", function(e) {
		e.preventDefault();
		var extraGuest = $(this).closest('.extra-guest');
		extraGuest.addClass('not-attending');
		extraGuest.find('input[type=text]').val("")
		extraGuest.find('input[type=radio]').removeAttr("checked");
		$("#add-extra-guest").show();
	});

	$("#rsvp-form form").submit(function() {
		var valuesToSubmit = $(this).serialize();
	    $.ajax({
	        type: "POST",
	        url: $(this).attr('action'), //sumbits it to the given url of the form
	        data: valuesToSubmit,
	        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
	    }).success(function(json){
	        if (json['is_coming']) {
	        	$("#rsvp-modal").addClass('rsvp-submission-coming');
	        } else {
	        	$("#rsvp-modal").addClass('rsvp-submission-not-coming');
	        }
	    }).fail(function() {
	    	$("#rsvp-modal").addClass('rsvp-submission-error');
	    }).complete(function() {
	    	setTimeout(closeRsvpModal, 2000);
	    });
		return false;
	});

	// Image Delay Loading
	// Background CSS Image Loading
	$('body').addClass('lazy-load-bg');
	// Image src Loading
	$('.delay-loaded-image').each(function() {
		var el = $(this);
		var src = el.data('delayed-src');
		el.attr('src', src);
	});
	// Preload image gallery
	function preload(imageArray, index) {
	    index = index || 0;
	    if (imageArray && imageArray.length > index) {
        var img = new Image ();
        img.onload = function() {
	            preload(imageArray, index + 1);
	        }
	        img.src = $(preloadedImageLinks[index]).attr('href');
		}
	};
	/* images is an array with image metadata */
	var preloadedImageLinks = $(".photo-grid a");
	setTimeout(function() {
		preload(preloadedImageLinks);
	}, 2000);
}

$(document).ready(main);