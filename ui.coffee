class UIBase
	constructor: (@parent, @padding) ->
			@children = []
			@parent = null
			@padding = @padding || 10

	draw: () ->
		endhtml = ""
		for child in @children
			endhtml = endhtml + child.draw()

		endhtml

	set_parent: (@parent) ->
 
	add_child: (child) ->
		@children.push child
		child.set_parent(@)

class UIWidget extends UIBase
	constructor: (@xsize,@ysize,@padding) ->
		@padding = @padding || 5
		@children = []


	draw: () ->
		cl = "class"
		padding = 5;
		x = @xsize-(2*padding)
		y = @ysize-(2*padding)

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
		@text = @text || "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

	draw: () ->
		"<p>#{@text}</p>"


class UINavigation extends UIBase
	constructor: (@buttons) ->

	draw: () ->
		list = "<ul class=\"UINavigation\">"
		for ind in @buttons
			url = ind[0]
			button = ind[1]
			list = list + """<li><a href=\"#{url}\"> #{button} </a></li>"""

		list + "</ul>"


class UIRowLayout extends UIBase
	constructor: (@rownr) ->
		@rows = []
		for i in [1..@rownr]
			@rows[i-1] = new Array()

	draw: () ->
		console.log @rows
		xsize = @parent.xsize


		layout = "<div class=\"rowlayout_#{@rownr}rows rows\" style=\"float:left\">"
		for i in [1..@rownr]

			content = ""
			console.log i-1
			for child in @rows[i-1]
				console.log child
				content += child.draw()

			border_right = "border_right"

			if i == @rownr
				border_right = ""

			console.log border_right, i

			layout += """<div class=\"row_#{i} row #{border_right}\" style=\"
			width: #{Math.floor(xsize / @rownr)-@parent.padding-1}px; 
			padding:#{Math.floor((@parent.padding/2))-2};
			\">#{content}</div>"""

		
		layout += "</div>"
		layout

	set_row: (row,content) ->
		@rows[row].push content


UI = {
	"UIWidget":UIWidget,
	"UIText":UIText,
	"UINavigation":UINavigation,
	"UIRowLayout":UIRowLayout
}

window.UI = UI;