<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128544771/13.2.9%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T109859)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxHtmlEditor - How to change image's attributes when inserting images via ImageSelector
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t109859/)**
<!-- run online end -->


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
<p>Using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxHtmlEditorScriptsASPxClientHtmlEditor_GetDesignViewDocumenttopic">ASPxClientHtmlEditor.GetDesignViewDocument</a> method you can get the document object inside ASPxHtmlEditor. Now it is possible to find all images via the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByTagName">getElementsByTagName</a> method:</p>


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


