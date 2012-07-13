class UIBase
	constructor: (@parent) ->
			@children = []
	draw: () ->
		endhtml = ""
		for child in @children
			endhtml = endhtml + child.draw()

		endhtml

class UIWidget extends UIBase
	draw: () ->
		cl = "class"
		x = 800
		y = 600
		

		content = ""
		for child in @children
			console.log @children
			console.log child
			content = content + child.draw()

		endhtml = "<div class=\"UIWidget\" id=\"class_#{cl}\" height=\"#{x}\" width=\"#{y}\">#{content}</div>"

		if @parent
			@parent.html(endhtml)
		else
			$("body").html(endhtml)


class UIText extends UIBase
	constructor: (@text) ->

	draw: () ->
		"<p>#{@text}</p>"

UI = {
	"UIWidget":UIWidget,
	"UIText":UIText
}

window.UI = UI;