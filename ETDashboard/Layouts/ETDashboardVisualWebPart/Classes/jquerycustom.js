//jquery effects on documentready
$(document).ready(function () {

    $("#Details").css("display", "none");
   
});

function hideOverview(){
// $("#Overview").hide(1000);
    // $("#Details").show(1000);

$("#Overview").slideUp(50);
$("#Details").slideDown(1000);
 return false;

}

function hideDetails() {
    // $("#Overview").hide(1000);
    // $("#Details").show(1000);
    $("#Details").slideUp(50);
    $("#Overview").slideDown(1000);

    return false;

}
function hideOverviewNew() {
   hideOverview();
   $("#DetailsNew1A").css("background", "#5D7B9D");
   $("#DetailsOpen1A").css("background", "#7f7f7f");
   $("#DetailsHold1A").css("background", "#7f7f7f");
   $("#DetailsLeadership1A").css("background", "#7f7f7f");
   $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
   $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
   $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
   $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
   $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
   $("#DetailsUrgent1A").css("background", "#7f7f7f");
      return false;

}
function hideOverviewOpen() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#5D7B9D");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewHold() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#5D7B9D");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewLeadership() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#5D7B9D");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewOpen7Days() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#5D7B9D");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewHold7Days() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#5D7B9D");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverview4Hours() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#5D7B9D");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewApproval() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#5D7B9D");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewOperations() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#5D7B9D");
    $("#DetailsUrgent1A").css("background", "#7f7f7f");
    return false;

}
function hideOverviewUrgent() {
    hideOverview();
    $("#DetailsNew1A").css("background", "#7f7f7f");
    $("#DetailsOpen1A").css("background", "#7f7f7f");
    $("#DetailsHold1A").css("background", "#7f7f7f");
    $("#DetailsLeadership1A").css("background", "#7f7f7f");
    $("#DetailsOpenMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsHoldMoreThan7Days1A").css("background", "#7f7f7f");
    $("#DetailsNewMoreThan4Hours1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForApproval1A").css("background", "#7f7f7f");
    $("#DetailsWaitingForOperations1A").css("background", "#7f7f7f");
    $("#DetailsUrgent1A").css("background", "#5D7B9D");
    return false;

}
