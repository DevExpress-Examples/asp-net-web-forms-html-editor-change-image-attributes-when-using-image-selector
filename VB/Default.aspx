<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
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

	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server">
			<ClientSideEvents CommandExecuted="OnCommandExecuted" />
		</dx:ASPxHtmlEditor>
	</form>
</body>
</html>