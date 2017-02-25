<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WINTQuickView.ascx.cs"
    Inherits="WINTDashboardVisualWebPart.VisualWebPart1.VisualWebPart1UserControl" %>
 <Sharepoint:ScriptLink ID="ScriptLink2" Name="sp.ui.dialog.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>   
<Sharepoint:ScriptLink ID="ScriptLink3" Name="sp.core.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>   
<Sharepoint:ScriptLink ID="ScriptLink4" Name="sp.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink> 
<Sharepoint:ScriptLink ID="ScriptLink5" Name="WINTQuickViewVisualWebPart/Classes/DashboardView.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>  
<Sharepoint:ScriptLink ID="ScriptLink1" Name="WINTQuickViewVisualWebPart/Classes/jquerycustom.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>  

<Sharepoint:ScriptLink ID="ScriptLink6" Name="WINTQuickViewVisualWebPart/jquery-1.10.1.min.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>  

<script type="text/javascript" src="../../../_layouts/WINTQuickViewVisualWebPart/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../../../_layouts/WINTQuickViewVisualWebPart/Classes/jquerycustom.js"></script>
<script type="text/javascript" src="../../../_layouts/WINTQuickViewVisualWebPart/Classes/DashboardView.js"></script>
<style type="text/css">

    
    .QuickView.tr
    {
        
    }
    
    
   td.TotalTitle
    {
        padding-left: 15px;
        height: 60%;
        background-color: #7f684e;
        color: #dedede;
        font-weight: bold;       
        font-size: 1.5em;
    }
    
   td.TotalRows
    {
        border: 3px;
        padding-left: 15px;
        background-color: silver;
        color: Black;
        font-weight: bold;
        width: 10%;
        
    }
    .Urgent
    {
        padding-left: 15px;
        font-size: 1.5em;
        background-color: #dedede;
        color: Black;
        font-weight: bold;
        width: 10%;
        height: 60%;
        border: 10px solid silver;

    }
    .error
    {
        color: Red;
        font-size: .9em;
    }
    .Label
    {
        font-size: .75em;
        background-color: transparent;
        border-color: transparent;
        color: White;
    }
    .Label2
    {
        font-size: 1em;
        background-color: transparent;
        border-color: transparent;
        color: black;
    }
   table.Overview
 {   
    
     border-collapse: separate ;
     border-spacing: 20px;
  
    }
   td 
   {padding: 5px;
   }
</style>
<div id="Overview">
    <table class="Overview">
        <tr>
            <td class="TotalTitle">
               <asp:Button ID="OverviewNew1" runat="server" Text="New Requests" CssClass="Label" onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverview()" > </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewNew2" runat="server" CssClass="Label2" onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewOpen1" runat="server" Text="Open Requests" CssClass="Label" onclick="DetailsOpen1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOpen2" runat="server" Text="" CssClass="Label2" onclick="DetailsOpen2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewRequestOnHold1" runat="server" Text="Requests on Hold" CssClass="Label" onclick="DetailsHold1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewRequestOnHold2" runat="server" Text="" CssClass="Label2" onclick="DetailsHold2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="TotalTitle">
                <asp:Button ID="OverviewLeadership1" runat="server" Text="Leadership Requests" CssClass="Label" onclick="DetailsLeadership1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewLeadership2" runat="server" Text="" CssClass="Label2" onclick="DetailsLeadership2_Click"></asp:Button>
            </td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewOpenMoreThan71" runat="server" Text="Open More Than 7 Days" CssClass="Label" onclick="DetailsOpenMoreThan7Days1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOpenMoreThan7Days2" runat="server" Text="" CssClass="Label2" onclick="DetailsOpenMoreThan7Days2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalTitle">
               <asp:Button ID="OverviewOnHoldMoreThan7Days1" runat="server" Text="On Hold More Than 7 Days" CssClass="Label" onclick="DetailsHoldMoreThan7Days1_Click" OnClientClick="javascript: hideOverview()" > </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOnHoldMoreThan72" runat="server" Text="" CssClass="Label2" onclick="DetailsHoldMoreThan7Days2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="TotalTitle">
                <asp:Button ID="OverviewNewFourHours1" runat="server" Text="New More Than 4 Hours" CssClass="Label" onclick="DetailsNewMoreThan4Hours1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewNewFourHours2" runat="server" Text="" CssClass="Label2" onclick="DetailsNewMoreThan4Hours2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewWaitingForApproval1" runat="server" Text="Open Waiting for Approval" CssClass="Label" onclick="DetailsWaitingForApproval2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewWaitingForApproval2" runat="server" Text="" CssClass="Label2" onclick="DetailsWaitingForApproval2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalTitle">
               <asp:Button ID="OverviewWaitingForOperations1" runat="server" Text="Open Waiting for Operations" CssClass="Label" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewWaitingForOperations2" runat="server" Text="" CssClass="Label2" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
            <td class="TotalTitle" style="height: 60%">
                 <asp:Button ID="OverviewUrgent1" runat="server" Text="Urgent" CssClass="Label" onclick="DetailsUrgent2_Click" OnClientClick="javascript: hideOverview()" ></asp:Button>
            </td>
            <td class="Urgent">
                <asp:Button ID="OverviewUrgent2" runat="server" Text="" CssClass="Label2" onclick="DetailsUrgent2_Click" OnClientClick="javascript: hideOverview()"></asp:Button>
            </td>
        </tr>
    </table>
</div>
<br />
<div id="Details" style="display:none" >
    <table class="DetailsTable">
        <tr>
            <td  class="TotalTitle">
               <asp:Button id="DetailsNew1" runat="server" text="New Requests" CssClass="Label" 
                    onclick="DetailsNew1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsNew2" runat="server" CssClass="Label2" 
                    onclick="DetailsNew2_Click"></asp:Button>
            </td>
            <td rowspan="10">
                <div runat="server" id="reportWindow" class="reportWindow">
                    <div class="reportContainer">
                        <asp:UpdatePanel ID="updatePanel1" runat="server" RenderMode="Inline" EnableViewState="true">
                            <Triggers>
                               <asp:AsyncPostBackTrigger ControlID="OverviewNew1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewNew2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewOpen1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewOpen2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewRequestOnHold1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewRequestOnHold2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewLeadership1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewLeadership2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewOpenMoreThan71" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewOpenMoreThan7Days2" EventName="Click" />
                                
                                <asp:AsyncPostBackTrigger ControlID="OverviewOnHoldMoreThan7Days1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewOnHoldMoreThan72" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewNewFourHours1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewNewFourHours2" EventName="Click" />


                                <asp:AsyncPostBackTrigger ControlID="OverviewWaitingForApproval1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewWaitingForApproval2" EventName="Click" />

                                <asp:AsyncPostBackTrigger ControlID="OverviewWaitingForOperations1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewWaitingForOperations2" EventName="Click" />

                                <asp:AsyncPostBackTrigger ControlID="OverviewUrgent1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="OverviewUrgent2" EventName="Click" />


                           
                                <asp:AsyncPostBackTrigger ControlID="DetailsNew1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsNew2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsOpen1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsOpen2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsHold1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsHold2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsLeadership1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsLeadership2" EventName="Click" />


                                <asp:AsyncPostBackTrigger ControlID="DetailsOpenMoreThan7Days1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsOpenMoreThan7Days2" EventName="Click" />
                               

                                <asp:AsyncPostBackTrigger ControlID="DetailsHoldMoreThan7Days1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsHoldMoreThan7Days2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsNewMoreThan4Hours1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsNewMoreThan4Hours2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsWaitingForApproval1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsWaitingForApproval2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsWaitingForOperations1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsWaitingForOperations2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsUrgent1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="DetailsUrgent2" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label runat="server" ID="reportTitleLabel" CssClass="reportTitle"></asp:Label>
                                <div runat="server" id="report" class="report">
                                    <asp:GridView ID="GridViewDetails" runat="server" CellPadding="4" EnableModelValidation="True"
                                        ForeColor="#333333" GridLines="None" Width="100%" 
                                        OnRowDataBound="GridViewDetails_OnRowDataBound" PageSize="500" 
                                                                               EmptyDataText="No items found." 
                                        AutoGenerateColumns="False"  ShowFooter="True"                                          
                                        >

                                        <Columns>

                <asp:BoundField DataField="ID" HeaderText="ID"  />
                <asp:BoundField DataField="ListProperty.Title" HeaderText="Request List" SortExpression="RequestList" />
                <asp:BoundField DataField="Title" HeaderText="Title"  />
                <asp:BoundField DataField="Ticket_x0020_Status" HeaderText="Request Status"  />
                
                <asp:BoundField DataField="Created" HeaderText="Created"  />
                <asp:BoundField DataField="Author" HeaderText="Created By"  />
                <asp:BoundField DataField="Urgent" HeaderText="Urgent"  />
                <asp:BoundField DataField="CurrentStatus1" HeaderText="Current Status"  />
                
                  
                <asp:BoundField DataField="EncodedAbsUrl" HeaderText="EncodedAbsUrl" Visible="false" />
                <asp:BoundField DataField="FileRef" HeaderText="FileRef" Visible="false" />

            </Columns>





                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" >
                <asp:Button id="DetailsOpen1" runat="server" Text="Open Requests" 
                    CssClass="Label" onclick="DetailsOpen1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsOpen2" runat="server" Text="" CssClass="Label2" 
                    onclick="DetailsOpen2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" >
             <asp:Button id="DetailsHold1" runat="server" Text="Requests on Hold" 
                    CssClass="Label" onclick="DetailsHold1_Click"></asp:Button> </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsHold2" runat="server" Text="" CssClass="Label2" 
                    onclick="DetailsHold2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="TotalTitle" style="width: 69px">
              <asp:Button ID="DetailsLeadership1" runat="server" Text="Leadership Requests" 
                    CssClass="Label" onclick="DetailsLeadership1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsLeadership2" runat="server" Text="" CssClass="Label2" 
                    onclick="DetailsLeadership2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" >
               <asp:Button id="DetailsOpenMoreThan7Days1" runat="server" 
                    Text="Open More Than 7 Days" CssClass="Label" 
                    onclick="DetailsOpenMoreThan7Days1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsOpenMoreThan7Days2" runat="server" Text="" 
                    CssClass="Label2" onclick="DetailsOpenMoreThan7Days2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" >
               <asp:Button id="DetailsHoldMoreThan7Days1" runat="server" 
                    Text="On Hold More Than 7 Days" CssClass="Label" 
                    onclick="DetailsHoldMoreThan7Days1_Click"> </asp:Button>
            &nbsp;</td>
            <td class="TotalRows">
                <asp:Button ID="DetailsHoldMoreThan7Days2" runat="server" Text="" CssClass="Label2" onclick="DetailsHoldMoreThan7Days1_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" >
               <asp:Button id="DetailsNewMoreThan4Hours1" runat="server" 
                    Text="New More Than 4 Hours" CssClass="Label" 
                    onclick="DetailsNewMoreThan4Hours1_Click"> </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsNewMoreThan4Hours2" runat="server" Text="" 
                    CssClass="Label2" onclick="DetailsNewMoreThan4Hours2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" style="width: 69px">
       <asp:Button id="DetailsWaitingForApproval1" runat="server" 
                    Text="Open Waiting for Approval" CssClass="Label" 
                    onclick="DetailsWaitingForApproval1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsWaitingForApproval2" runat="server" Text="" 
                    CssClass="Label2" onclick="DetailsWaitingForApproval2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" style="width: 69px">
    <asp:Button id="DetailsWaitingForOperations1" runat="server" Text="Open Waiting for Operations" CssClass="Label" onclick="DetailsWaitingForOperations1_Click"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsWaitingForOperations2" runat="server" Text="" CssClass="Label2" onclick="DetailsWaitingForOperations2_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  class="TotalTitle" style="width: 69px">
           <asp:Button id="DetailsUrgent1" runat="server" Text="Urgent Requests" 
                    CssClass="Label" onclick="DetailsUrgent1_Click"></asp:Button>
            </td>
            <td class="Urgent">
                <asp:Button ID="DetailsUrgent2" runat="server" Text="" CssClass="Label2" onclick="DetailsUrgent2_Click"></asp:Button>
            </td>
        </tr>
    </table>
</div>
<p class="error">
    <asp:Label ID="lblErrors" runat="server"></asp:Label>
</p>
