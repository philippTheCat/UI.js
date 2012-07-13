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
		padding = 5;
		x = 800-(2*padding)
		y = 600-(2*padding)

		content = ""
		for child in @children
			content = content + child.draw()

		endhtml = "<div class=\"UIWidget\" id=\"class_#{cl}\" style=\"height:#{y}px;width:#{x}px\" height=\"#{x}\" width=\"#{y}\">#{content}</div>"

		if @parent
			@parent.html(endhtml)
		else
			$("body").html(endhtml)


class UIText extends UIBase
	constructor: (@text) ->

	draw: () ->
		"<p>#{@text}</p>"


class UINavigation extends UIBase
	constructor: (@buttons) ->

	draw: () ->
		list = "<ul class=\"UINavigation\">"
		for ind in @buttons
			url = ind[0]
			button = ind[1]
			list = list + "<li><a href=\"#{url}\"> #{button} </a></li>"

		list + "</ul>"



UI = {
	"UIWidget":UIWidget,
	"UIText":UIText,
	"UINavigation":UINavigation
}

window.UI = UI;