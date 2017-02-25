using System;
using System.Data;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System.Drawing;


namespace ETQuickViewVisualWebPart.ETDashboard
{
    public partial class ETDashboardUserControl : UserControl
    {
        int items9;
        string string3;
        SPSite site = SPContext.Current.Site;
        SPWeb web = SPContext.Current.Web;
        SPSiteDataQuery query = new SPSiteDataQuery();
        String viewFields = "<FieldRef Name=\"Closed_x0020_Out\" /><FieldRef Name=\"Urgent\" /><FieldRef Name=\"Created\" /><FieldRef Name=\"Author\" /><FieldRef Name=\"CurrentStatus1\" /><FieldRef Name=\"Ticket_x0020_Status\" /><FieldRef Name=\"ID\" /><FieldRef Name=\"Title\" /><FieldRef Name=\"EncodedAbsUrl\" /><FieldRef Name=\"FileRef\"/><ListProperty Name=\"Title\"/>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                newRequests(viewFields);
                hold7DaysRequests(viewFields);
                holdRequests(viewFields);
                leadershipRequests(viewFields);
                open7DaysRequests(viewFields);
                openRequests(viewFields);
                urgentRequests(viewFields);
                openMoreThan4HoursQuery(query, viewFields);//might want to put in resource file
                openWaitingforApprovalQuery();
                waitingforOperationsQuery();

            }

        }
        //new 3/17
        public string lastSortDirection
        {
            get
            {
                if (ViewState["lastSortDirection"] == null)
                    ViewState["lastSortDirection"] = "ASC";

                return ViewState["lastSortDirection"].ToString();
            }
            set
            {
                ViewState["lastSortDirection"] = value;
            }
        }

        public string currentSortColumn
        {
            get
            {
                if (ViewState["currentSortColumn"] == null)
                    ViewState["currentSortColumn"] = "ID";

                return ViewState["currentSortColumn"].ToString();
            }
            set
            {
                ViewState["currentSortColumn"] = value;
            }
        }

        public string currentSortDirection
        {
            get
            {
                if (ViewState["currentSortDirection"] == null)
                    ViewState["currentSortDirection"] = "ASC";

                return ViewState["currentSortDirection"].ToString();
            }
            set
            {
                ViewState["currentSortDirection"] = value;
            }
        }
        //end new      
        public void newRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:newRequestsQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, "<Webs Scope='SiteCollection' />", OverviewNew2, DetailsNew2);

        }

        public void hold7DaysRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:hold7DaysQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOnHoldMoreThan72, DetailsHoldMoreThan7Days2);
        }

        public void holdRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:holdRequestsQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewRequestOnHold2, DetailsHold2);
        }
        public void leadershipRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:leadershipRequestsQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", "<FieldRef Name='ForLeadership' />" + viewFields, @"<Webs Scope='SiteCollection' />", OverviewLeadership2, DetailsLeadership2);
        }
        public void open7DaysRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:open7DaysQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOpenMoreThan7Days2, DetailsOpenMoreThan7Days2);
        }
        public void openRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:openRequestsQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewOpen2, DetailsOpen2);
        }
        public void urgentRequests(String viewFields)
        {
            assignValue(SPUtility.GetLocalizedString("$Resources:urgentQuery", "Resource2", 1033), "<Lists ServerTemplate='100' />", viewFields, @"<Webs Scope='SiteCollection' />", OverviewUrgent2, DetailsUrgent2);
        }


        public void assignValue(String query, String lists, String viewFields, String webs, Button button, Button button2)
        {
            SPSiteDataQuery siteDataQuery = new SPSiteDataQuery() { Query = query, Lists = lists, ViewFields = viewFields, Webs = webs };

            button.Text = SPContext.Current.Site.RootWeb.GetSiteData(siteDataQuery).Rows.Count.ToString();
            button2.Text = button.Text;
            this.gridViewDetails.AutoGenerateColumns = false;
            siteDataQuery.RowLimit = 150;

            DataTable dt = web.GetSiteData(siteDataQuery);

            //Changed 3/7/2014
            if (button2.Text != "0")
            {
                dt.DefaultView.Sort = "ListProperty.Title";
            }

            //new 3/14
            for (int index = 0; index < dt.Rows.Count; index++)
            {
                dt.Rows[index]["Created"] = Convert.ToDateTime(dt.Rows[index]["Created"]).ToString("MM/dd/yyyy H:mm:ss tt");
                dt.Rows[index]["Author"] = Convert.ToString(dt.Rows[index]["Author"].ToString().Substring(dt.Rows[index]["Author"].ToString().IndexOf("#") + 1));
            }
            //end
            gridViewDetails.DataSource = dt; //keep this            
            gridViewDetails.DataBind();
            ViewState["mydatasource"] = dt;

        }
        public void openMoreThan4HoursQuery(SPSiteDataQuery query, String viewFields)
        {
            DateTime dtr = DateTime.Now.Subtract(new TimeSpan(0, 4, 0, 0));
            query.Query = @"<Where><And><And><BeginsWith><FieldRef Name='Ticket_x0020_Status' /><Value Type='Choice'>New</Value></BeginsWith><Eq><FieldRef Name='Closed_x0020_Out' /><Value Type='Choice'>No</Value></Eq></And><Leq><FieldRef Name='Created' /><Value Type='DateTime' IncludeTimeValue='TRUE'>" + SPUtility.CreateISO8601DateTimeFromSystemDateTime(dtr) + "</Value></Leq></And></Where>";
            query.Lists = "<Lists ServerTemplate='100' />";
            query.ViewFields = viewFields;
            query.Webs = @"<Webs Scope='SiteCollection' />";
            OverviewNewFourHours2.Text = SPContext.Current.Site.RootWeb.GetSiteData(query).Rows.Count.ToString();
            DetailsNewMoreThan4Hours2.Text = SPContext.Current.Site.RootWeb.GetSiteData(query).Rows.Count.ToString();
            this.gridViewDetails.AutoGenerateColumns = false;
            query.RowLimit = 150;
            DataTable dt = web.GetSiteData(query);
            //Changed 3/7/2014
            if (DetailsNewMoreThan4Hours2.Text != "0")
            {
                dt.DefaultView.Sort = "ListProperty.Title";
            }
            for (int index = 0; index < dt.Rows.Count; index++)
            {
                dt.Rows[index]["Created"] = Convert.ToDateTime(dt.Rows[index]["Created"]).ToString("MM/dd/yyyy H:mm:ss tt");
                dt.Rows[index]["Author"] = Convert.ToString(dt.Rows[index]["Author"].ToString().Substring(dt.Rows[index]["Author"].ToString().IndexOf("#") + 1));
            }

            gridViewDetails.DataSource = dt;
            gridViewDetails.DataBind();
            ViewState["mydatasource"] = dt;
        }


        public void openWaitingforApprovalQuery()
        {
            String string2 = "@'<Where><Eq><FieldRef Name='QueryType' /><Value Type='Choice'>Waiting_for_ApprovalManagement</Value></Eq></Where>'";
            GetMultipleLists(string2);
            OverviewWaitingForApproval2.Text = items9.ToString();
            DetailsWaitingForApproval2.Text = OverviewWaitingForApproval2.Text;
            lblErrors.Text = string3;

        }

        public void GetMultipleLists(String string4)
        {
            SPQuery queryDashboardList = new SPQuery();
            queryDashboardList.ViewFields = @"<FieldRef Name='Title' /><FieldRef Name='QueryType' /><FieldRef Name='ViewFields' /><FieldRef Name='Query' />";
            queryDashboardList.Query = string4;
            SPList list6 = web.Lists.TryGetList(SPUtility.GetLocalizedString("$Resources:QuickViewQueriesName", "Resource2", 1033));
            SPListItemCollection items7 = list6.GetItems(queryDashboardList);
            items9 = 0;

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
            //Changed 3/7 removed conversion of colabsurl2 3/7
            colID2.DataType = System.Type.GetType("System.String");
            colListTitle2.DataType = System.Type.GetType("System.String");
            colTitle2.DataType = System.Type.GetType("System.String");
            colTicketStatus2.DataType = System.Type.GetType("System.String");
            colCreated2.DataType = System.Type.GetType("System.String");
            colAuthor2.DataType = System.Type.GetType("System.String");
            colUrgent2.DataType = System.Type.GetType("System.String");
            colCurrentStatus12.DataType = System.Type.GetType("System.String");
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

            foreach (SPListItem item in items7)
            {
                SPQuery query7 = new SPQuery();
                query7.Query = item["Query"].ToString();
                query7.ViewFields = item["ViewFields"].ToString();
                SPList list7 = SPContext.Current.Web.Lists.TryGetList(item["Title"].ToString());

                if (list7 == null)
                {
                    string3 = string3 + ("Error: The QuickViewQueries list has a syntax error for the " + item.Title.ToString() + " list on row ID " + item.ID.ToString() + " of the list. Please see your administrator. <br>");
                }
                else
                {
                    SPListItemCollection items8 = list7.GetItems(query7);
                    items9 = items9 + items8.Count;
                    DataTable dt = new DataTable();
                    DataColumn colID = new DataColumn("ID");
                    DataColumn colListTitle = new DataColumn("ListProperty.Title");
                    DataColumn colTitle = new DataColumn("Title");
                    DataColumn colTicketStatus = new DataColumn("Ticket_x0020_Status");
                    DataColumn colCreated = new DataColumn("Created");
                    DataColumn colAuthor = new DataColumn("Author");
                    DataColumn colUrgent = new DataColumn("Urgent");
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
                    dt = list7.GetItems(query7).GetDataTable();

                    if (dt != null)
                    {

                        foreach (DataRow dr in dt.Rows)
                        {   
                            dt2.NewRow();
                            colListTitle2.DefaultValue = dt.TableName.ToString();
                            dt2.ImportRow(dr);
                        }
                    }
                    else
                    {
                        dt = null;

                    }
                }

            }

            this.gridViewDetails.AutoGenerateColumns = false;
            dt2.DefaultView.Sort = "ListProperty.Title";
            gridViewDetails.DataSource = dt2;
            gridViewDetails.DataBind();
            ViewState["mydatasource"] = dt2;
        }

        public void waitingforOperationsQuery()
        {
            String string2 = "@'<Where><Eq><FieldRef Name='QueryType' /><Value Type='Choice'>Waiting_for_Leadership</Value></Eq></Where>'";
            GetMultipleLists(string2);
            OverviewWaitingForOperations2.Text = items9.ToString();
            DetailsWaitingForOperations2.Text = OverviewWaitingForOperations2.Text;
            lblErrors.Text = string3;
        }


        public void GridViewDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            string path;
            string fileref;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.Attributes.Add("onMouseover", "this.style.backgroundColor='#DDDDDD'; this.style.cursor='pointer'");
                fileref = DataBinder.Eval(e.Row.DataItem, "FileRef").ToString();
                fileref = fileref.ToString().Substring(fileref.ToString().IndexOf("#") + 1);
                path = DataBinder.Eval(e.Row.DataItem, "EncodedAbsUrl").ToString() + fileref.Substring(0, fileref.LastIndexOf("/"));

                string thisListID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
                e.Row.Attributes.Add("onDblClick", "SPModalDashboard('" + path + "/DispForm.aspx?ID=" + thisListID + "')");
                e.Row.Cells[0].Visible = false;

                if (e.Row.RowState == DataControlRowState.Alternate)
                {
                    //for IE 9 bug
                    e.Row.Cells[1].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[2].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[4].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[5].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[6].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Cells[7].BackColor = System.Drawing.Color.LightGray;
                    e.Row.Attributes.Add("CssClass", "altrow");
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

        protected void DetailsNew1_Click(object sender, EventArgs e)
        {
            newRequests(viewFields);

        }

        protected void DetailsHoldMoreThan7Days1_Click(object sender, EventArgs e)
        {
            hold7DaysRequests(viewFields);

        }

        protected void DetailsOpen1_Click(object sender, EventArgs e)
        {
            openRequests(viewFields);

        }

        protected void DetailsHold1_Click(object sender, EventArgs e)
        {
            holdRequests(viewFields);

        }

        protected void DetailsLeadership1_Click(object sender, EventArgs e)
        {
            leadershipRequests(viewFields);

        }

        protected void DetailsOpenMoreThan7Days1_Click(object sender, EventArgs e)
        {
            open7DaysRequests(viewFields);

        }

        protected void DetailsNewMoreThan4Hours1_Click(object sender, EventArgs e)
        {
            openMoreThan4HoursQuery(query, viewFields);

        }

        protected void DetailsWaitingForApproval1_Click(object sender, EventArgs e)
        {
            openWaitingforApprovalQuery();

        }

        protected void DetailsWaitingForOperations1_Click(object sender, EventArgs e)
        {
            waitingforOperationsQuery();

        }

        protected void DetailsUrgent1_Click(object sender, EventArgs e)
        {
            urgentRequests(viewFields);

        }
        //new 3/17
        protected void gridViewDetails_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (lastSortDirection.ToString() == "ASC")
                currentSortDirection = "DESC";
            else
                currentSortDirection = "ASC";

            DataTable dataTable = ViewState["mydatasource"] as DataTable;
            DataSet ds = new DataSet();

            ds.Tables.Add(dataTable);
            DataView dv = new DataView(dataTable);
            dv.Sort = e.SortExpression + " " + currentSortDirection;
            lastSortDirection = currentSortDirection;
            currentSortColumn = e.SortExpression;
            gridViewDetails.DataSource = dv;
            gridViewDetails.DataBind();
            dv.Dispose();

        }


    }
}


