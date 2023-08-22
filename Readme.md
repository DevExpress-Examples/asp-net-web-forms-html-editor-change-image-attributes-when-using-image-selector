<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128544771/13.2.9%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T109859)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Html Editor for ASP.NET Web Forms - How to change image's attributes when inserting images with ImageSelector
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t109859/)**
<!-- run online end -->

This example demonstrates how to use [ASPxClientHtmlEditor.CommandExecuted](https://docs.devexpress.com/AspNet/js-ASPxClientHtmlEditor.CommandExecuted) event to change an image's attributes when inserting an image with the Image Selector.

## Overview

Use the event's [commandName](https://docs.devexpress.com/AspNet/js-ASPxClientHtmlEditorCommandEventArgs.commandName) argument property to determine if the image was inserted with the Image selector and the [parameter](https://docs.devexpress.com/AspNet/js-ASPxClientHtmlEditorCommandEventArgs.parameter) argument property to get information about image's source.

```js
function OnCommandExecuted(s, e) {
    if (e.commandName == "insertimage") {
        var src = e.parameter.src;
    }
}

```

Call the editor's client-side [GetDesignViewDocument](https://docs.devexpress.com/AspNet/js-ASPxClientHtmlEditor.GetDesignViewDocument) method to get the document object inside the editor. Then call the [getElementsByTagName](https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByTagName) method to find all images.

```js
var allImages = s.GetDesignViewDocument().getElementsByTagName("img");
```

Finally, find the inserted image and change its attributes:


```js
for (var i = 0, max = allImages.length; i < max; i++) {
    if (allImages[i].src.replace(/^(?:\/\/|[^\/]+)*\//, "/") == src.replace(/^(?:\/\/|[^\/]+)*\//, "/")) {
        target = allImages[i];
        if (target) {
            target.style.border = '2px solid red';
            // add your attributes here
        }
        break;
    }
}
```

## Files to Review

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
