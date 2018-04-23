# ASPxHtmlEditor - How to change image's attributes when inserting images via ImageSelector


<p>Let's assume that you need to change an image's attributes when inserting an image using the Image Selector of the ASPxHtmlEditor. To do this, use the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditor_CommandExecutedtopic">ASPxClientHtmlEditor.CommandExecuted</a> event.<br /><br />First, use the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditorCommandEventArgs_commandNametopic">e.commandName</a> property to determine if the image was inserted via the Image selector and get information about image's source via the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditorCommandEventArgs_parametertopic">e.parameter</a> property: </p>


```js
	function OnCommandExecuted(s, e) {
		if (e.commandName == "insertimage") {
			var src = e.parameter.src;
 			...
			}
		};
	}

```


<p> </p>
<p>Using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditor_GetDesignViewDocumenttopic">ASPxClientHtmlEditor.GetDesignViewDocument</a> method you can get the document object inside ASPxHtmlEditor. Now it is possible to find all images via the <a href="http://www.w3schools.com/jsref/met_doc_getelementsbytagname.asp">getElementsByTagName</a> method:</p>


```js
var allImages = s.GetDesignViewDocument().getElementsByTagName("img");
 

```


<p> </p>
<p>Finally, find the inserted image and change its attributes:</p>


```js
                for (var i = 0, max = allImages.length; i < max; i++) {
                    if (allImages[i].src.replace(/^(?:\/\/|[^\/]+)*\//, "/") == src.replace(/^(?:\/\/|[^\/]+)*\//, "/")) {
                        target = allImages[i];
                        if (target) {
                            target.style.border = '2px solid red';
                            //add your attributes here
                        }
                        break;
                    }
                }

```


<p> </p>
<p> </p>
<p>Complete code:</p>


```js
        function OnCommandExecuted(s, e) {
            if (e.commandName == "insertimage") {
                var src = e.parameter.src;
                 var allImages = s.GetDesignViewDocument().getElementsByTagName("img");
                var target;
                for (var i = 0, max = allImages.length; i < max; i++) {
                    if (allImages[i].src.replace(/^(?:\/\/|[^\/]+)*\//, "/") == src.replace(/^(?:\/\/|[^\/]+)*\//, "/")) {
                        target = allImages[i];
                        if (target) {
                            target.style.border = '2px solid red';                          
                        }
                        break;
                    }
                }
            };
        }

```


<p> </p>
<p> </p>

<br/>


