---
---
(($) ->
	$ ->
		$mainImage = $ 'img#gallery-main-image'
		$thumbs = $ 'div.gallery-thumbs ul li a'
		$thumbs.each ->
			$(this).click ->
				$selectedImage = $(this)
				if $selectedImage.attr('data-image') != $mainImage.attr('src')
					$mainImage.parent().fadeOut 300, ->
						$mainImage.attr('src', $selectedImage.attr('data-image'))
							.attr 'data-credit', $selectedImage.attr('data-credit')
						console.log($selectedImage.attr('data-credit'))
						$('div.photo-credit').text('Photo Credit: ' + $mainImage.attr('data-credit'))
						$mainImage.parent().fadeIn()
		$(document).keydown (e) ->
			$currentThumb = $ 'a[data-image="' + $mainImage.attr('src') + '"]'
			switch e.which
				when 37 then $currentThumb.parent().prev().find('a').click() if !$currentThumb.is(':first')
				when 39 then $currentThumb.parent().next().find('a').click() if !$currentThumb.is(':last')
) jQuery
