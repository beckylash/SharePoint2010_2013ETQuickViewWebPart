<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ETDashboardUserControl.ascx.cs" Inherits="ETQuickViewVisualWebPart.ETDashboard.ETDashboardUserControl" %>
     <Sharepoint:ScriptLink ID="ScriptLink2" Name="sp.ui.dialog.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>   
<Sharepoint:ScriptLink ID="ScriptLink3" Name="sp.core.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>   
<Sharepoint:ScriptLink ID="ScriptLink4" Name="sp.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink> 
<Sharepoint:ScriptLink ID="ScriptLink5" Name="ETDashboardVisualWebPart/Classes/DashboardView.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>  
<Sharepoint:ScriptLink ID="ScriptLink1" Name="ETDashboardVisualWebPart/Classes/jquerycustom.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink>  
<Sharepoint:ScriptLink ID="ScriptLink6" Name="ETDashboardVisualWebPart/jquery-1.10.1.min.js" LoadAfterUI="true" Localizable="false" runat="server"></Sharepoint:ScriptLink> 
<script type="text/javascript" src="../../../_layouts/ETDashboardVisualWebPart/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../../../_layouts/ETDashboardVisualWebPart/Classes/jquerycustom.js"></script>
<script type="text/javascript" src="../../../_layouts/ETDashboardVisualWebPart/Classes/DashboardView.js"></script>
<style type="text/css">
    .activebutton 
    {
        background-color: Navy;
    }  
    .error
    {
        color: Red;
        font-size: .9em;
    }
    .Label
    {
        background-color: transparent;
        border-color: transparent;
        color: White;
        font-size: 2em;  
        cursor: pointer;  
       
    }
    .Label2
    {
        background-color: transparent;
        border-color: transparent;
        color: black;
        font-size: 2em; 
         cursor: pointer;      
    }
    
     .Label3
    {
        background-color: transparent;
        border-color: transparent;
        color: White;
        font-size: 1.5em;   
         cursor: pointer;   
       
    }
    .Label4
    {
        background-color: transparent;
        border-color: transparent;
        color: black;
        font-size: 1.5em;
         cursor: pointer;  
       
    }
  
   table.Overview
 {   
     border-collapse: separate ;     
     border-spacing: 100px 20px 10px 200px;
     
    }
   td 
   {padding: 5px;
    padding-left: 1px;
    vertical-align: top; 
     }
   
    #LeftMenu
    {       
        vertical-align: top;
        
        
    }
    
#Overview td.TotalTitle
    {
        padding-left: 10px;
        height: 60%;
        background-color: #7f7f7f;
        color: #7f7f7f;
         width: 20%;
       
    }
    
#Overview td.TotalRows 
    {
         width: 5%;
        padding-left: 1px;
        background-color: silver;
        color: Black;
        text-align: right;  
   }
    
#Details td.TotalTitle
    {
        padding-left: 1px;
        height: 60%;
        background-color: #7f7f7f;
        color: #7f7f7f;
        font-weight: bold;       
        width: 30px;
    }
    
#Details td.TotalRows
    {
        padding-left: 1px;
        background-color: silver;
        color: Black;  
        text-align: right;     
    }
 .White 
 {
    background: white;
   border: white; 
        
     }
.altrow 
 {
    background: LightGray !important; 
   color: Black  !important;
   
     
     }
#GridViewCell 
{
   
}
</style>
<div id="Overview">
<p>
    To view more details about each number, click an item in the table.
</p>
    <table class="Overview">
        <tr>
            <td class="TotalTitle">
               <asp:Button ID="OverviewNew1" runat="server" Text="New Requests" CssClass="Label" onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverviewNew()" > </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewNew2" runat="server" CssClass="Label2" 
                    onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverviewNew()"
                     ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewOpen1" runat="server" Text="Open Requests" CssClass="Label" onclick="DetailsOpen1_Click" OnClientClick="javascript: hideOverviewOpen()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOpen2" runat="server" Text="" CssClass="Label2" onclick="DetailsOpen1_Click" OnClientClick="javascript: hideOverviewOpen()" ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewRequestOnHold1" runat="server" Text="Requests on Hold" CssClass="Label" onclick="DetailsHold1_Click" OnClientClick="javascript: hideOverviewHold()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewRequestOnHold2" runat="server" Text="" CssClass="Label2" onclick="DetailsHold1_Click" OnClientClick="javascript: hideOverviewHold()"  ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="TotalTitle">
                <asp:Button ID="OverviewLeadership1" runat="server" Text="Leadership Requests" CssClass="Label" onclick="DetailsLeadership1_Click" OnClientClick="javascript: hideOverviewLeadership()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewLeadership2" runat="server" Text="" CssClass="Label2" 
                    onclick="DetailsLeadership1_Click" OnClientClick="javascript: hideOverviewLeadership()" 
                    ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewOpenMoreThan71" runat="server" Text="Open More Than 7 Days" CssClass="Label" onclick="DetailsOpenMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewOpen7Days()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOpenMoreThan7Days2" runat="server" Text="" CssClass="Label2" onclick="DetailsOpenMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewOpen7Days()" ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
               <asp:Button ID="OverviewOnHoldMoreThan7Days1" runat="server" Text="On Hold More Than 7 Days" CssClass="Label" onclick="DetailsHoldMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewHold7Days()" > </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewOnHoldMoreThan72" runat="server" Text="" CssClass="Label2" onclick="DetailsHoldMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewHold7Days()" ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="TotalTitle">
                <asp:Button ID="OverviewNewFourHours1" runat="server" Text="New More Than 4 Hours" CssClass="Label" onclick="DetailsNewMoreThan4Hours1_Click" OnClientClick="javascript: hideOverview4Hours()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewNewFourHours2" runat="server" Text="" CssClass="Label2" onclick="DetailsNewMoreThan4Hours1_Click" OnClientClick="javascript: hideOverview4Hours()" ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
                <asp:Button ID="OverviewWaitingForApproval1" runat="server" Text="Open Waiting for Approval" CssClass="Label" onclick="DetailsWaitingForApproval1_Click" OnClientClick="javascript: hideOverviewApproval()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewWaitingForApproval2" runat="server" Text="" CssClass="Label2" onclick="DetailsWaitingForApproval1_Click" OnClientClick="javascript: hideOverviewApproval()" ></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
            <td class="TotalTitle">
               <asp:Button ID="OverviewWaitingForOperations1" runat="server" Text="Open Waiting for Operations" CssClass="Label" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverviewOperations()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewWaitingForOperations2" runat="server" Text="" CssClass="Label2" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverviewOperations()" ></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White" >
                 &nbsp;</td>
            <td class="White">
                &nbsp;</td>
            <td class="White">
                &nbsp;</td>
        </tr>
        <tr>
            <td >
            </td>
            <td >
            </td>
            <td >
                &nbsp;</td>
            <td class="TotalTitle" >
                 <asp:Button ID="OverviewUrgent1" runat="server" Text="Urgent" CssClass="Label" onclick="DetailsUrgent1_Click" OnClientClick="javascript: hideOverviewUrgent()" ></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="OverviewUrgent2" runat="server" Text="" CssClass="Label2" onclick="DetailsUrgent1_Click" OnClientClick="javascript: hideOverviewUrgent()"></asp:Button>
            </td>
            <td class="White">
                &nbsp;</td>
        </tr>
    </table>
</div>
<br />
<div id="Details" style="display:none">
<p>
    To view more details about each row, double-click a row in the table.
</p>

<table id="LeftMenu" >
    <tr>
        <td>
    <table class="DetailsTable">
        <tr>
            <td  id="DetailsNew1A" class="TotalTitle">
               <asp:Button id="DetailsNew1" runat="server" text="New Requests" CssClass="Label3" 
                    onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverviewNew()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsNew2" runat="server" CssClass="Label4" 
                    onclick="DetailsNew1_Click" OnClientClick="javascript: hideOverviewNew()"></asp:Button>
            </td>
            <td rowspan="10">
                &nbsp;</td>
        </tr>
        <tr>
            <td id="DetailsOpen1A" class="TotalTitle" >
                <asp:Button id="DetailsOpen1" runat="server" Text="Open Requests" 
                    CssClass="Label3" onclick="DetailsOpen1_Click" OnClientClick="javascript: hideOverviewOpen()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsOpen2" runat="server" Text="" CssClass="Label4" 
                    onclick="DetailsOpen1_Click" OnClientClick="javascript: hideOverviewOpen()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsHold1A" class="TotalTitle" >
             <asp:Button id="DetailsHold1" runat="server" Text="Requests on Hold" 
                    CssClass="Label3" onclick="DetailsHold1_Click" OnClientClick="javascript: hideOverviewHold()"></asp:Button> </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsHold2" runat="server" Text="" CssClass="Label4" 
                    onclick="DetailsHold1_Click" OnClientClick="javascript: hideOverviewHold()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsLeadership1A" class="TotalTitle" >
              <asp:Button ID="DetailsLeadership1" runat="server" Text="Leadership Requests" 
                    CssClass="Label3" onclick="DetailsLeadership1_Click" OnClientClick="javascript: hideOverviewLeadership()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsLeadership2" runat="server" Text="" CssClass="Label4" 
                    onclick="DetailsLeadership1_Click" OnClientClick="javascript: hideOverviewLeadership()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsOpenMoreThan7Days1A" class="TotalTitle" >
               <asp:Button id="DetailsOpenMoreThan7Days1" runat="server" 
                    Text="Open More Than 7 Days" CssClass="Label3" 
                    onclick="DetailsOpenMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewOpen7Days()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsOpenMoreThan7Days2" runat="server" Text="" 
                    CssClass="Label4" onclick="DetailsOpenMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewOpen7Days()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td  id="DetailsHoldMoreThan7Days1A" class="TotalTitle" >
               <asp:Button id="DetailsHoldMoreThan7Days1" runat="server" 
                    Text="On Hold More Than 7 Days" CssClass="Label3" 
                    onclick="DetailsHoldMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewHold7Days()"> </asp:Button></td>
            <td class="TotalRows">
                <asp:Button ID="DetailsHoldMoreThan7Days2" runat="server" Text="" CssClass="Label4" onclick="DetailsHoldMoreThan7Days1_Click" OnClientClick="javascript: hideOverviewHold7Days()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsNewMoreThan4Hours1A" class="TotalTitle" >
               <asp:Button id="DetailsNewMoreThan4Hours1" runat="server" 
                    Text="New More Than 4 Hours" CssClass="Label3" 
                    onclick="DetailsNewMoreThan4Hours1_Click" OnClientClick="javascript: hideOverview4Hours()"> </asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsNewMoreThan4Hours2" runat="server" Text="" 
                    CssClass="Label4" onclick="DetailsNewMoreThan4Hours1_Click" OnClientClick="javascript: hideOverview4Hours()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsWaitingForApproval1A" class="TotalTitle">
       <asp:Button id="DetailsWaitingForApproval1" runat="server" 
                    Text="Open Waiting for Approval" CssClass="Label3" 
                    onclick="DetailsWaitingForApproval1_Click" OnClientClick="javascript: hideOverviewApproval()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsWaitingForApproval2" runat="server" Text="" 
                    CssClass="Label4" onclick="DetailsWaitingForApproval1_Click" OnClientClick="javascript: hideOverviewApproval()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsWaitingForOperations1A" class="TotalTitle" >
    <asp:Button id="DetailsWaitingForOperations1" runat="server" Text="Open Waiting for Operations" CssClass="Label3" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverviewOperations()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsWaitingForOperations2" runat="server" Text="" CssClass="Label4" onclick="DetailsWaitingForOperations1_Click" OnClientClick="javascript: hideOverviewOperations()"></asp:Button>
            </td>
        </tr>
        <tr>
            <td id="DetailsUrgent1A" class="TotalTitle" >
           <asp:Button id="DetailsUrgent1" runat="server" Text="Urgent Requests" 
                    CssClass="Label3" onclick="DetailsUrgent1_Click" OnClientClick="javascript: hideOverviewUrgent()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="DetailsUrgent2" runat="server" Text="" CssClass="Label4" onclick="DetailsUrgent1_Click" OnClientClick="javascript: hideOverviewUrgent()"></asp:Button>
            </td>
        </tr>


        <tr>
            <td class="TotalTitle" >
           <asp:Button id="Home1" runat="server" Text="Overview"  CssClass="Label3" OnClientClick="javascript: hideDetails()"></asp:Button>
            </td>
            <td class="TotalRows">
                <asp:Button ID="Home2" runat="server" Text="" CssClass="Label4" OnClientClick="javascript: hideDetails()"></asp:Button>
            </td>
        </tr>
    </table>
        </td>
        <td id="GridViewCell">
                        <asp:UpdatePanel ID="updatePanelETDashboard" runat="server" 
                RenderMode="Inline" EnableViewState="true">
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
                                <asp:AsyncPostBackTrigger ControlID="Home1" EventName="Click" />
                                 <asp:AsyncPostBackTrigger ControlID="Home2" EventName="Click" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label runat="server" ID="reportTitleLabel" CssClass="reportTitle"></asp:Label>
                                <div runat="server" id="report" class="report">
                                    <asp:GridView ID="gridViewDetails" runat="server" CellPadding="4" EnableModelValidation="True"
                                        ForeColor="#333333" GridLines="None" Width="100%" 
                                        OnRowDataBound="GridViewDetails_OnRowDataBound" PageSize="500" 
                                                                               EmptyDataText="No items found." 
                                        AutoGenerateColumns="False"  ShowFooter="True" AllowSorting="true" EnableViewState="true" OnSorting="gridViewDetails_Sorting"                                
                                        >

                                        <Columns>

                <asp:BoundField DataField="ID" HeaderText="ID"  />
                <asp:BoundField DataField="ListProperty.Title" HeaderText="Request List" SortExpression="ListProperty.Title" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"   />
                <asp:BoundField DataField="Ticket_x0020_Status" HeaderText="Request Status" SortExpression="Ticket_x0020_Status"  />
                
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created"  />
                <asp:BoundField DataField="Author" HeaderText="Created By" SortExpression="Author" />
                <asp:BoundField DataField="Urgent" HeaderText="Urgent" SortExpression="Urgent"  />
                <asp:BoundField DataField="CurrentStatus1" HeaderText="Current Status" SortExpression="CurrentStatus1"  />
                
                  
                <asp:BoundField DataField="EncodedAbsUrl" HeaderText="EncodedAbsUrl" Visible="false" />
                <asp:BoundField DataField="FileRef" HeaderText="FileRef" Visible="false" />

            </Columns>
                                        <AlternatingRowStyle CssClass="altrow" BackColor="White" ForeColor="#284775" />
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
                    </td>
    </tr>
</table>


</div>
<p class="error">
    <asp:Label ID="lblErrors" runat="server"></asp:Label>
</p>

