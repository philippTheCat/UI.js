var UI = {

};

(function(){
	$.extend(UI,{

		UIWidget: function(arguments){
			this.template = '<div class="UIWidget" id="class_%(name)s" height="%(size.x)s" width="%(size.y)s">%(content)s</div>';

			this.args = $.extend(arguments,
				{
					"name":"untitled",
					"content":"THISISCONTENT!",
					"frame":$("#body"),
					"size":
						{"x":800,
						"y":600}
					}
			);



			this.render = function(){
				content = sprintf(this.template,this.args);
				console.log(content);
				this.args.frame.html(content);

			}

			return this;


		}


	});

	window.UI = UI;
	}
)();