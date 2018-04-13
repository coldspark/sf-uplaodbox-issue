<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="FileUpload" AutoEventWireup="true" CodeBehind="FileUploadFeatures.aspx.cs" Inherits="SyncfusionUploader1.FileUploadFeatures" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>FileUpload Features:</h2>
<br />
<li> FileInput</li>
<li> DrogandDrop</li>
<li> Synchronus Upload</li>
<li> API</li>
<li> Localization - en-US</li>
<li> Theme - Bootstrap-Theme</li>
<br/>
     <script src='<%= Page.ResolveClientUrl("~/Scripts/ej/i18n/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
			<script src='<%= Page.ResolveClientUrl("~/Scripts/ej/l10n/ej.localetexts.en-US.min.js")%>' type="text/javascript"></script>
<div id = "ControlRegion">
   <div class="frame">
        <div class="control">
            <div class="posupload">
                <ej:UploadBox ID="Upload1" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" DropAreaText="ABC" Locale="en-US"
           AllowDragAndDrop="true"
             AsyncUpload="true" MultipleFilesSelection="true" runat="server"></ej:UploadBox>
           <ej:Button ID="post" CssClass="post" Type="Submit" runat="server" OnClick="post_Click" Text="Submit"/>
</div>
        </div>
    </div>
               <div id="sampleProperties" class="jumbotron">
        <div >
            <div >
                Extensions:
            </div>
        </div>
        <div>
            <div>
                <input type="text" id="fileallow"  />
            </div>
            <div >
                <ej:Button ID="upbutton1" Type="Button" CssClass="e-btn" Text="Allow" ClientSideOnClick="allowfiletype" runat="server"></ej:Button>
            </div>
        </div>
        <div>
            <div>
                <input type="text" id="filedeny" />
            </div>
            <div>
                <ej:Button ID="upbutton2" Type="Button" CssClass="e-btn" Text="Deny" ClientSideOnClick="denyfiletype" runat="server"></ej:Button>
            </div>
    </div>
    </div>
    <script type="text/javascript">
        var uploadobject;
        $(function () {
        });
        function allowfiletype() {
            uploadobject = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            uploadobject.option('extensionsAllow', $("#fileallow").val());
            uploadobject.option('extensionsDeny', "");
            $("#filedeny").val('');
        }
        function denyfiletype() {
            uploadobject = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            uploadobject.option('extensionsAllow', "");
            uploadobject.option('extensionsDeny', $("#filedeny").val());
            $("#fileallow").val('');
        }
    </script>
              <h2>API</h2>
              <div class="row jumbotron">
                <div class="col-md-3">
                    Enable/Disable :
                </div>
                <div class="col-md-3">
                    <div class="enableButton">
                        <input type="checkbox" id="enableButton" class="e-togglebtn" value="checkuncheck" checked="checked" />
                    </div>
                </div>
            </div>
           <script type="text/javascript">
        var target;
        $(function () {
            target = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            $("#enableButton").ejToggleButton({
                defaultText: "Disable",
                activeText: "Enable",
                size: "sminimall",
                change: "onCheckUncheckAll"
            });
        });
        function onCheckUncheckAll(args) {
            if (args.isChecked)
                target.disable();
            else
                target.enable();
        }
    </script>
</div>
</asp:Content>
