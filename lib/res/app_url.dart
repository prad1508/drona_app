class AppUrl {
  static var baseUrl = 'https://apidrona.moozetech.in';

  static var registrationListEndPoint = '$baseUrl/ouser/getstarteddev';
  static var forgetPasswordListEndPoint = '$baseUrl/ouser/forgetpassword';
  static var otpListEndPoint = '$baseUrl/ouser/verifyotp';
  static var resetotpVerify = '$baseUrl/ouser/passresetverifyotp';
  static var verifynewPassword = '$baseUrl/ouser/setnewpassword';

  static var postofficeListEndPoint = 'https://api.postalpincode.in/pincode/';
  static var categoryListEndPoint = '$baseUrl/academy/cat';
  static var basicDetailsListEndPoint = '$baseUrl/academy/basicdetail';
  static var serviceListEndPoint = '$baseUrl/academy/service/';
  static var serviceProgramListEndPoint = '$baseUrl/academy/facilityprogram/';
  static var serviceIconEndPoint = '$baseUrl/static/service/';
  static var profileserviceIconEndPoint = '$baseUrl/static/profile/';
  static var facilityGalleryImageEndPoint = '$baseUrl/static/facility/';



  static var facilityListEndPoint = '$baseUrl/academy/facility/';
  static var facilityeAddListEndPoint = '$baseUrl/academy/facility';
  static var facilityeEditEndPoint = '$baseUrl/academy/facility';
  static var facilityGetEndPoint = '$baseUrl/academy/myfacility/';
  static var programListEndPoint = '$baseUrl/academy/program/';
  static var programListEndPoint1 = '$baseUrl/academy/program';
  static var myProgramListEndPoint = '$baseUrl/academy/myprogram/';
  static var myservicesListEndPoint = '$baseUrl/academy/myservices';
  static var detailsOwnerListEndPoint = '$baseUrl/academy/ownercoachdetail';
  static var ouserProfileimgListEndPoint = '$baseUrl/ouser/profileimg';
  static var myprofiListEndPoint = '$baseUrl/ouser/myprofile';

  //coach
  static var UserprofileAdd = '$baseUrl/academy/coach';
  static var coachlistListEndPoint = '$baseUrl/academy/coach';
  static var coachlistfilteroint = '$baseUrl/academy/coach/10/1';
  static var coachActivate = '$baseUrl/academy/coach/activate';
  static var coachDeactivate = '$baseUrl/academy/coach/deactivate';

  //batch
  static var createbatchListEndPoint = '$baseUrl/academy/batch';
  static var EditbatchListEndPoint = '$baseUrl/academy/batch';
  static var batchListListEndPoint = '$baseUrl/academy/batch';
  static var batchsearch = '$baseUrl/academy/batch';

  static var userloginEndPint = '$baseUrl/ouser/login';
  static var academyRegistrationTrackEndPint = '$baseUrl/academy';
  static var userLogout = '$baseUrl/ouser/logout';

  //trainee

  static var traineeAddinBatchEndpoint = "$baseUrl/academy/addtraineeinbatch";
  static var recordPayment = "$baseUrl/academy/recordpayment";
  static var traineeListinBatchEndpoint = "$baseUrl/academy/trainee/10/1";
  static var ledgerEndpoint = "$baseUrl/academy/trainee/ledger";
  static var activateTrainee = "$baseUrl/academy/trainee/activate";
  static var deactivateTrainee = "$baseUrl/academy/trainee/deactivate";
  static var traineeBatchEdit = "$baseUrl/academy/trainee/editbatch";

  //session
  static var createsessionListEndPoint = "$baseUrl/session/create";
  static var sessionListEndPoint = '$baseUrl/academy/session';
  static var sessionDetailsListEndPoint = '$baseUrl/academy/session/view';
  static var markAttendance = '$baseUrl/session/markattendance';
  static var sessionCancel = '$baseUrl/session/cancel';
  static var sessionClose = '$baseUrl/session/close';
  static var sessionUpdate = '$baseUrl/session/update';

  // dashboard
  static var dashBoardHome = "$baseUrl/academy/dashboard";
  static var bankDetails = "$baseUrl/academy/bankdetails";
  // academy
  static var academydetails = "$baseUrl/academy/academy";
  static var uploadLogo = "$baseUrl/academy/logo";
  static var academylogo = "$baseUrl/static/logo/";

  // facility gallery image upload
  static var facilityGalleryImg = "$baseUrl/academy/myfacility/gallery/";

  //sigle program update
  static var singleProgramUpdateApi = "$baseUrl/academy/single-program";



  static var uploadQr = "$baseUrl/static/qr/";
  static var uploadQrImg = "$baseUrl/academy/uploadqr";
  static var billingInvoiceMonthly = '$baseUrl/academy/billing_invoice/month';
  static var billingViewInvoiceMonthly =
      '$baseUrl/academy/invoice_payment/month';
}
