using System;
using System.Data;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;


namespace WINTDashboardVisualWebPart.VisualWebPart1
{
    public partial class VisualWebPart1UserControl : UserControl
    {
        int items9;
        string string3;
        SPSite site = SPContext.Current.Site;
        SPWeb web = SPContext.Current.Web;
        SPSiteDataQuery query = new SPSiteDataQuery();
        String viewFields = "<FieldRef Name='Closed_x0020_Out' /><FieldRef Name='Urgent'/><FieldRef Name='Created'/><FieldRef Name='Author'/><FieldRef Name='CurrentStatus1'/><FieldRef Name='Ticket_x0020_Status'/><FieldRef Name='ID'/><FieldRef Name='Title'/><FieldRef Name='EncodedAbsUrl'/><FieldRef Name='FileRef'/><ListProperty Name='Title'/>";
        //1-29
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                //SPSite site = SPContext.Current.Site;
                //SPWeb web = SPContext.Current.Web;
                //SPSiteDataQuery query = new SPSiteDataQuery();
                //String viewFields = "<FieldRef Name='Closed_x0020_Out' /><FieldRef Name='CurrentStatus1'/><FieldRef Name='Urgent'/><FieldRef Name='Created'/><FieldRef Name='Author'/><FieldRef Name='CurrentStatus1'/><FieldRef Name='Ticket_x0020_Status'/><FieldRef Name='ID'/><FieldRef Name='Title'/><FieldRef Name='EncodedAbsUrl'/><FieldRef Name='FileRef'/><ListProperty Name='Title'/>";

                //1-23

                newRequests(web, viewFields);
                hold7DaysRequests(web, viewFields);
                holdRequests(web, viewFields);
                leadershipRequests(web, viewFields);
                open7DaysRequests(web, viewFields);
                openRequests(web, viewFields);
                urgentRequests(web, viewFields);

                openMoreThan4HoursQuery(query, viewFields, web);//might want to put in resource file

                openWaitingforApprovalQuery(web);
                waitingforOperationsQuery(web);
               

                //GetRows(web, query);
            }
        }
        //1-23

        public void newRequests(SPWeb web, String viewFields) {
            assignValue(SPUtility.GetLocalizedString("$Resources:newRequestsQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewNew2, DetailsNew2, web);

        }

        public void hold7DaysRequests(SPWeb web, String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:hold7DaysQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOnHoldMoreThan72, DetailsHoldMoreThan7Days2, web);
        }         
             
       public void holdRequests(SPWeb web, String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:holdRequestsQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewRequestOnHold2, DetailsHold2, web);
        }
        public void leadershipRequests(SPWeb web, String viewFields)
       {
           assignValue(SPUtility.GetLocalizedString("$Resources:leadershipRequestsQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", "<FieldRef Name='ForLeadership' />" + viewFields, @"<Webs Scope='SiteCollection' />", OverviewLeadership2, DetailsLeadership2, web);
       }
        public void open7DaysRequests(SPWeb web, String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:open7DaysQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOpenMoreThan7Days2, DetailsOpenMoreThan7Days2, web);
        }
        public void openRequests(SPWeb web, String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:openRequestsQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOpen2, DetailsOpen2, web);
        }
        public void urgentRequests(SPWeb web, String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:urgentQuery", "Resource1", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewUrgent2, DetailsUrgent2, web);
        }
        
        
        ///original code
        public void assignValue(String query, String lists, String viewFields, String webs, Button button, Button button2, SPWeb web)
        {
            SPSiteDataQuery siteDataQuery = new SPSiteDataQuery() { Query = query, Lists = lists, ViewFields = viewFields, Webs = webs };
            button.Text = SPContext.Current.Site.RootWeb.GetSiteData(siteDataQuery).Rows.Count.ToString();
            //added 1/22
            button2.Text = button.Text;
            this.GridViewDetails.AutoGenerateColumns = false;
            siteDataQuery.RowLimit = 150;
            DataTable dt = web.GetSiteData(siteDataQuery);
            dt.DefaultView.Sort = "ListProperty.Title";
            GridViewDetails.DataSource = dt; //keep this
            GridViewDetails.DataBind();
        }
        public void openMoreThan4HoursQuery(SPSiteDataQuery query, String viewFields, SPWeb web)
        {
            DateTime dtr = DateTime.Now.Subtract(new TimeSpan(0, 4, 0, 0));
            query.Query = @"<Where><And><And><BeginsWith><FieldRef Name='Ticket_x0020_Status' /><Value Type='Choice'>New</Value></BeginsWith><Eq><FieldRef Name='Closed_x0020_Out' /><Value Type='Choice'>No</Value></Eq></And><Leq><FieldRef Name='Created' /><Value Type='DateTime' IncludeTimeValue='TRUE'>" + SPUtility.CreateISO8601DateTimeFromSystemDateTime(dtr) + "</Value></Leq></And></Where>";
            query.Lists = "<Lists ServerTemplate='100' />";
            query.ViewFields = viewFields;
            query.Webs = @"<Webs Scope='SiteCollection' />";
            OverviewNewFourHours2.Text = SPContext.Current.Site.RootWeb.GetSiteData(query).Rows.Count.ToString();
            //1-22
            DetailsNewMoreThan4Hours2.Text = SPContext.Current.Site.RootWeb.GetSiteData(query).Rows.Count.ToString();            
            this.GridViewDetails.AutoGenerateColumns = false;
            query.RowLimit = 150;
            DataTable dt = web.GetSiteData(query);

            GridViewDetails.DataSource = dt; //keep this
            GridViewDetails.DataBind();
        }


        public void openWaitingforApprovalQuery(SPWeb web)
        {
            String string1 = "@'<Where><Eq><FieldRef Name='QueryType' /><Value Type='Choice'>Waiting_for_ApprovalManagement</Value></Eq></Where>'";
            
            GetMultipleLists(web, string1);
             OverviewWaitingForApproval2.Text = items9.ToString();
             DetailsWaitingForApproval2.Text = OverviewWaitingForApproval2.Text;
            lblErrors.Text = string3;
            //1-24

            
        }
        //For displaying errors and for implementing SPQuery not SPSiteDAtaQuery
        public void GetMultipleLists(SPWeb web, String string4)
        {
            SPQuery queryDashboardList = new SPQuery();
            queryDashboardList.ViewFields = @"<FieldRef Name='Title' /><FieldRef Name='QueryType' /><FieldRef Name='ViewFields' /><FieldRef Name='Query' />";
            queryDashboardList.Query = string4;
            SPList list6 = web.Lists.TryGetList(SPUtility.GetLocalizedString("$Resources:QuickViewQueriesName", "Resource1", 1033));
            SPListItemCollection items7 = list6.GetItems(queryDashboardList);
            items9 = 0;
            //1-24

            DataTable dt2 = new DataTable();


            DataColumn colID2 = new DataColumn("ID");
            DataColumn colListTitle2 = new DataColumn("ListProperty.Title");
            DataColumn colTitle2 = new DataColumn("Title");
            DataColumn colTicketStatus2 = new DataColumn("Ticket_x0020_Status");
            DataColumn colCreated2 = new DataColumn("Created");
            DataColumn colAuthor2 = new DataColumn("Author");
            DataColumn colUrgent2 = new DataColumn("Urgent");
            DataColumn colCurrentStatus12 = new DataColumn("CurrentStatus1");

            DataColumn colabsURL2 = new DataColumn("EncodedAbsUrl");
            DataColumn colfileRef2 = new DataColumn("FileRef");

            colID2.DataType = System.Type.GetType("System.String");
           colListTitle2.DataType = System.Type.GetType("System.String");
            colTitle2.DataType = System.Type.GetType("System.String");
            colTicketStatus2.DataType = System.Type.GetType("System.String");
            colCreated2.DataType = System.Type.GetType("System.String");
            colAuthor2.DataType = System.Type.GetType("System.String");
            colUrgent2.DataType = System.Type.GetType("System.String");
            colCurrentStatus12.DataType = System.Type.GetType("System.String");
            //set absencodedurl property because it is different format in spquery than spsitedataquery
            colabsURL2.DefaultValue = web.Url.ToString();
           
            colfileRef2.DataType = System.Type.GetType("System.String");

            dt2.Columns.Add(colID2);
            dt2.Columns.Add(colListTitle2);
            dt2.Columns.Add(colTitle2);
            dt2.Columns.Add(colTicketStatus2);
            dt2.Columns.Add(colCreated2);
            dt2.Columns.Add(colAuthor2);
            dt2.Columns.Add(colUrgent2);
            dt2.Columns.Add(colCurrentStatus12);

            dt2.Columns.Add(colabsURL2);
            dt2.Columns.Add(colfileRef2);



            ///end 1-24
            foreach (SPListItem item in items7)
            {
                SPQuery query7 = new SPQuery();
                query7.Query = item["Query"].ToString();

                query7.ViewFields = item["ViewFields"].ToString();//original

                //1-24

                //end 1-24
                SPList list7 = SPContext.Current.Web.Lists.TryGetList(item["Title"].ToString());

                if (list7 == null)
                {
                    string3 = string3 + ("Error: The QuickViewQueries list has a syntax error for the " + item.Title.ToString() + " list on row ID " + item.ID.ToString() + " of the list. Please see your administrator. <br>");
                }
                else
                {
                    SPListItemCollection items8 = list7.GetItems(query7);
                    items9 = items9 + items8.Count;
                    //1-24
                    DataTable dt = new DataTable();
                    
                    DataColumn colID = new DataColumn("ID");
                   DataColumn colListTitle = new DataColumn("ListProperty.Title");
                   DataColumn  colTitle= new DataColumn("Title");
                   DataColumn colTicketStatus = new DataColumn("Ticket_x0020_Status");
                    DataColumn  colCreated= new DataColumn("Created");
                    DataColumn  colAuthor= new DataColumn("Author");
                    DataColumn  colUrgent= new DataColumn("Urgent");
                    DataColumn colCurrentStatus1 = new DataColumn("CurrentStatus1");

                    DataColumn colabsURL = new DataColumn("EncodedAbsUrl");
                    DataColumn colfileRef = new DataColumn("FileRef");

                    colID.DataType = System.Type.GetType("System.String");
                    colListTitle.DataType = System.Type.GetType("System.String");
                    colTitle.DataType = System.Type.GetType("System.String");
                    colTicketStatus.DataType = System.Type.GetType("System.String");
                    colCreated.DataType = System.Type.GetType("System.String");
                    colAuthor.DataType = System.Type.GetType("System.String");
                    colUrgent.DataType = System.Type.GetType("System.String");
                    colCurrentStatus1.DataType = System.Type.GetType("System.String");

                    //set absencodedurl property because it is different format in spquery than spsitedataquery
                    colabsURL.DefaultValue = web.Url.ToString();
                   
                   
                    //


                                       
                    colfileRef.DataType = System.Type.GetType("System.String");

                    dt.Columns.Add(colID);
                    dt.Columns.Add(colListTitle);
                    dt.Columns.Add(colTitle);
                    dt.Columns.Add(colTicketStatus);
                    dt.Columns.Add(colCreated);
                    dt.Columns.Add(colAuthor);
                    dt.Columns.Add(colUrgent);
                    dt.Columns.Add(colCurrentStatus1);

                    dt.Columns.Add(colabsURL);
                    dt.Columns.Add(colfileRef);
                 

                    //end 1-24
                    
                    dt = list7.GetItems(query7).GetDataTable();
                  
                   if (dt != null) {

                       
                       //dt2.Merge(dt);
                       foreach (DataRow dr in dt.Rows)
                       {

                           //might be able to remove --set absencodedurl property because it is different format in spquery than spsitedataquery
                           colabsURL.DefaultValue = web.Url.ToString();

                          //                         
                           dt2.NewRow();
                           colListTitle2.DefaultValue = dt.TableName.ToString();
                           dt2.ImportRow(dr);
                           //1-25
                           
                          

                       }
                    }
                   else {

                       dt = null;

                   }
                }
                
            }


            ////datagrid binding 1-24
            this.GridViewDetails.AutoGenerateColumns = false;
            //query7.RowLimit = 150;
            //1-29

            dt2.DefaultView.Sort = "ListProperty.Title";
            //end 1-29
            GridViewDetails.DataSource = dt2; //keep this
            GridViewDetails.DataBind();
            //1-29
            

            //end 1-24



        }





        public void waitingforOperationsQuery(SPWeb web)
        {
            String string2 = "@'<Where><Eq><FieldRef Name='QueryType' /><Value Type='Choice'>Waiting_for_Operations</Value></Eq></Where>'";
            GetMultipleLists(web, string2);
            OverviewWaitingForOperations2.Text = items9.ToString();
            DetailsWaitingForOperations2.Text = OverviewWaitingForOperations2.Text;
            lblErrors.Text = string3;
        }

        //start 1-20

        //public void GetRows(SPWeb web, SPSiteDataQuery query)
        //{

        //    query.Query = @"<Where><BeginsWith><FieldRef Name='Ticket_x0020_Status' /><Value Type='Choice'>New</Value></BeginsWith></Where>";
        //    query.Lists = "<Lists ServerTemplate='100' />";
        //    query.ViewFields = "<FieldRef Name='CurrentStatus1'/><FieldRef Name='Urgent'/><FieldRef Name='Created'/><FieldRef Name='Author'/><FieldRef Name='CurrentStatus1'/><FieldRef Name='Ticket_x0020_Status'/><FieldRef Name='ID'/><FieldRef Name='Title'/><FieldRef Name='EncodedAbsUrl'/><FieldRef Name='FileRef'/><ListProperty Name='Title'/>";
        //    query.Webs = @"<Webs Scope='SiteCollection' />";

        //    this.GridViewDetails.AutoGenerateColumns = false;
        //    query.RowLimit = 150;
        //    DataTable dt = web.GetSiteData(query);

        //    GridViewDetails.DataSource = dt; //keep this

        //    GridViewDetails.DataBind();




        //}

        //double-click to display form
        public void GridViewDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            string path;
            string fileref;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseover", "this.style.backgroundColor='#DDDDDD'; this.style.cursor='pointer'");
                //dr["Path"] = dr["EncodedAbsUrl"] + dr["FileRef"].ToString().Substring(dr["FileRef"].ToString().(IndexOf("#") + 1);
                fileref = DataBinder.Eval(e.Row.DataItem, "FileRef").ToString();
                fileref = fileref.ToString().Substring(fileref.ToString().IndexOf("#") + 1);

                path = DataBinder.Eval(e.Row.DataItem, "EncodedAbsUrl").ToString() + fileref.Substring(0, fileref.LastIndexOf("/"));

                string thisListID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
                e.Row.Attributes.Add("onDblClick", "SPModalDashboard('" + path + "/DispForm.aspx?ID=" + thisListID + "')");
                e.Row.Cells[0].Visible = false;


                if (e.Row.RowState == DataControlRowState.Alternate)
                {
                    e.Row.Attributes.Add("onMouseout", "this.style.backgroundColor='#FFFFFF'");
                }
                else
                {
                    e.Row.Attributes.Add("onMouseout", "this.style.backgroundColor='#F7F6F3'");
                }


            }

            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.Cells[0].Visible = false;
        }

        ////on sort 1-29



        //1-23

        protected void DetailsNew1_Click(object sender, EventArgs e)
        {
            newRequests(web, viewFields);
        }

        protected void DetailsNew2_Click(object sender, EventArgs e)
        {
            newRequests(web, viewFields);
        }

        protected void DetailsHoldMoreThan7Days1_Click(object sender, EventArgs e)
        {
            hold7DaysRequests(web, viewFields);
        }

        protected void DetailsHoldMoreThan7Days2_Click(object sender, EventArgs e)
        {
            hold7DaysRequests(web, viewFields);
        }

        protected void DetailsOpen1_Click(object sender, EventArgs e)
        {
            openRequests(web, viewFields);
        }

        protected void DetailsOpen2_Click(object sender, EventArgs e)
        {
            openRequests(web, viewFields);
        }

        protected void DetailsHold1_Click(object sender, EventArgs e)
        {
            holdRequests(web, viewFields);
        }

        protected void DetailsHold2_Click(object sender, EventArgs e)
        {
            holdRequests(web, viewFields);
        }

        protected void DetailsLeadership1_Click(object sender, EventArgs e)
        {
            leadershipRequests(web, viewFields);
        }

        protected void DetailsLeadership2_Click(object sender, EventArgs e)
        {
            leadershipRequests(web, viewFields);
        }

        protected void DetailsOpenMoreThan7Days1_Click(object sender, EventArgs e)
        {
            open7DaysRequests(web, viewFields);
        }

        protected void DetailsOpenMoreThan7Days2_Click(object sender, EventArgs e)
        {
            open7DaysRequests(web, viewFields);
        }

        protected void DetailsNewMoreThan4Hours1_Click(object sender, EventArgs e)
        {
            openMoreThan4HoursQuery(query, viewFields, web);
        }

        protected void DetailsNewMoreThan4Hours2_Click(object sender, EventArgs e)
        {
            openMoreThan4HoursQuery(query, viewFields, web);
        }

        protected void DetailsWaitingForApproval1_Click(object sender, EventArgs e)
        {
            openWaitingforApprovalQuery(web);
        }

        protected void DetailsWaitingForApproval2_Click(object sender, EventArgs e)
        {
            openWaitingforApprovalQuery(web);
        }

        protected void DetailsWaitingForOperations1_Click(object sender, EventArgs e)
        {
            waitingforOperationsQuery(web);
        }

        protected void DetailsWaitingForOperations2_Click(object sender, EventArgs e)
        {
            waitingforOperationsQuery(web);
        }

        protected void DetailsUrgent1_Click(object sender, EventArgs e)
        {
            urgentRequests(web, viewFields);
        }

        protected void DetailsUrgent2_Click(object sender, EventArgs e)
        {
            urgentRequests(web, viewFields);
        }
        
        
        }
        

    }












