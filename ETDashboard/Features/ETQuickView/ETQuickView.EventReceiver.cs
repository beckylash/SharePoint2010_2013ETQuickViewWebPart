using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.Security;
using ETQuickViewUserControl;
using ETQuickViewVisualWebPart;
//namespace ETOSCQuickView.Features.feature


namespace ETQuickViewUserControl.Features.Feature1
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("c8ee3766-189f-43ac-94bc-4b2a2784b988")]
    public class Feature1EventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPSite site = properties.Feature.Parent as SPSite;

            if (site != null)
            {
                SPWeb web = site.RootWeb;               
                try
                {
                    if (web.Lists.TryGetList(SPUtility.GetLocalizedString("$Resources:QuickViewQueriesName", "Resource1", 1033)) == null)
                    {
                        web.AllowUnsafeUpdates = true;
                        web.Lists.Add("QuickViewQueries", "Queries for Quick View. Do not delete.", SPListTemplateType.GenericList);
                        SPList newList = web.Lists["QuickViewQueries"];
                        newList.Fields.Add("QueryType", SPFieldType.Choice, true);
                        SPFieldChoice chFld = (SPFieldChoice)newList.Fields["QueryType"];
                        chFld.EditFormat = SPChoiceFormatType.Dropdown;
                        chFld.Choices.Add("Waiting_for_Leadership");
                        chFld.Choices.Add("Waiting_for_ApprovalManagement");
                        chFld.Update();
                        newList.Fields.Add("ViewFields", SPFieldType.Note, true);
                        newList.Fields.Add("Query", SPFieldType.Note, true);
                        newList.Update();
                        SPView view = newList.DefaultView;
                        view.ViewFields.Add("QueryType");
                        view.ViewFields.Add("Query");
                        view.ViewFields.Add("ViewFields");
                        view.Update();
                        ETQuickViewVisualWebPart.LoadQueryData loadData = new LoadQueryData();
                        loadData.AddData(web);
                    }
                }
                catch (Exception e)
                {   SPUtility.TransferToErrorPage(string.Format("Error on ET QuickView feature activation: {0},\r\n\r\nStack trace:\r\n{1}", e.Message, e.StackTrace));
                    SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory("ET QuickView", TraceSeverity.Unexpected, EventSeverity.Error), TraceSeverity.Unexpected, e.Message, e.StackTrace);

                }
                
            }
        }
    }
    // Uncomment the method below to handle the event raised before a feature is deactivated.

    //public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
    //{
    //}


    // Uncomment the method below to handle the event raised after a feature has been installed.

    //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
    //{

    //}


    // Uncomment the method below to handle the event raised before a feature is uninstalled.

    //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
    //{
    //}

    // Uncomment the method below to handle the event raised when a feature is upgrading.

    //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
    //{
    //}
}
