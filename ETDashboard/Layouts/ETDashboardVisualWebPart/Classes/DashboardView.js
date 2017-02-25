//function SPModalDashboard(path, FormWidth, FormHeight) {
//varoptions = SP.UI.$create_DialogOptions();
// options.url = path;
// options.width = FormWidth;
// options.height = FormHeight;
// options.allowMaximize = false;
// options.dialogReturnValueCallback = Function.createDelegate(null, CloseCallback);
// SP.UI.ModalDialog.showModalDialog(options);
// }

function SPModalDashboard(path) {
    var options = {
//        title: "My Dialog Title",
//        width: 400,
//        height: 600,
        url: path
    };

    SP.UI.ModalDialog.showModalDialog(options);


}


