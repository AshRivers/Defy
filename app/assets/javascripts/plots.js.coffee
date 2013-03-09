# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	new ImageCropper()

class ImageCropper
	constructor: ->

		$('#cropbox_for_plot').Jcrop
			aspectRatio: 1
			minSize: [300,300]
			setSelect: [0,0,480,480]
			bgFade: true
			onSelect: @updateplot
			onChange: @updateplot

	updateplot: (coords) =>
		$('#plot_crop_x').val(coords.x)
		$('#plot_crop_y').val(coords.y)
		$('#plot_crop_w').val(coords.w)
		$('#plot_crop_h').val(coords.h)