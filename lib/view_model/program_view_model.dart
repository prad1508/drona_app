import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/program_model.dart';
import '../view/registeration/choose_program.dart';
import '/data/response/api_response.dart';
import '/respository/program_repository.dart';

class ProgramViewViewModel with ChangeNotifier {
  int count=0;
  int _activeTabIndex = 0;

  int get activeTabIndex => _activeTabIndex;

  set activeTabIndex(int index) {
    _activeTabIndex = index;
    print("my index is $_activeTabIndex");
    notifyListeners();
  }

  /// level
  bool selectingBylevel = true;
  bool bylevelBeginner = false;
  bool bylevelIntermediate = false;
  bool bylevelAdvance = false;
  bool bylevelprof = false;
  bool bylevelBeginner2 = false;
  bool bylevelIntermediate2 = false;
  bool bylevelProf2 = false;
  bool bylevelAdvance2 = false;
  bool customTileExpanded = false;

  /// age
    bool bylevelUnder12 = false;
    bool bylevelUnder14 = false;
    bool bylevelUnder16 = false;
    bool bylevelAdult = false;
    bool bylevelUnder12Second = false;
    bool bylevelUnder14Second = false;
    bool bylevelUnder16Second = false;
    bool bylevelAdultSecond = false;

       /// custom
      List<GroupControllers> groupControllers = [];
      List<TextField> nameFields = [];
      List<TextField> amountFields = [];
      late List customChecked;

      //custom program registration fee
      late List customChecked2;
      List<GroupControllers> groupControllers2 = [];
      List<TextField> nameFields2 = [];
      List<TextField> amountFields2 = [];

  /// focus node by level
  final List<FocusNode> focusNodes = List.generate(8, (_) => FocusNode());

  /// focus node by age
  final List<FocusNode> focusNodesByage = List.generate(8, (_) => FocusNode());

  /// focus node by custom
  final List<FocusNode> customfocusNodes =  List.generate(8, (_) => FocusNode());


  /// controllers for by level
  TextEditingController txtBylevelBeginner = TextEditingController();
  TextEditingController txtBylevelIntermediate = TextEditingController();
  TextEditingController txtBylevelAdvance = TextEditingController();
  TextEditingController txtBylevelprof = TextEditingController();
  TextEditingController txtBylevelBeginner2 = TextEditingController();
  TextEditingController txtBylevelIntermediate2 = TextEditingController();
  TextEditingController txtBylevelAdvance2 = TextEditingController();
  TextEditingController txtBylevelProf2 = TextEditingController();
  ValueNotifier<bool> isContinueButtonEnabled = ValueNotifier<bool>(false);

  /// controllers for by age
  TextEditingController txtBylevelUnder12 = TextEditingController();
  TextEditingController txtBylevelUnder14 = TextEditingController();
  TextEditingController txtBylevelUnder16 = TextEditingController();
  TextEditingController txtBylevelAdult = TextEditingController();
  TextEditingController txtBylevelUnder12Second = TextEditingController();
  TextEditingController txtBylevelUnder14Second = TextEditingController();
  TextEditingController txtBylevelUnder16Second = TextEditingController();
  TextEditingController txtBylevelAdultSecond = TextEditingController();


  void updateContinueButtonEnabled() {
    if(_activeTabIndex == 0)
      {
        print("active index 0");
        bool isEnabled =
            (bylevelBeginner && txtBylevelBeginner.text.isNotEmpty) ||
                (bylevelIntermediate && txtBylevelIntermediate.text.isNotEmpty) ||
                (bylevelAdvance && txtBylevelAdvance.text.isNotEmpty) ||
                (bylevelprof && txtBylevelprof.text.isNotEmpty);

        isContinueButtonEnabled.value = isEnabled;
        clearage();
        groupControllers.clear();
        nameFields.clear();
        amountFields.clear();

      }
    else if(_activeTabIndex ==1)
      {
        print("active index 1");
        bool isEnabled =
            (bylevelUnder12 && txtBylevelUnder12.text.isNotEmpty) ||
                (bylevelUnder14 && txtBylevelUnder14.text.isNotEmpty) ||
                (bylevelUnder16 && txtBylevelUnder16.text.isNotEmpty) ||
                (bylevelAdult && txtBylevelAdult.text.isNotEmpty);

        isContinueButtonEnabled.value = isEnabled;
        print("btn is $isContinueButtonEnabled");
       clearlevel();
        groupControllers.clear();
        nameFields.clear();
        amountFields.clear();
      }
    else{
      bool isEnabled = false;
      for(var i=0 ; i<groupControllers.length;i++)
        {
          if(customChecked[i])
            {
              isEnabled = true;
              break;
            }
        }
      isContinueButtonEnabled.value = isEnabled;
      clearlevel();
      clearage();
    }

  }

  clearlevel()
  {
    txtBylevelBeginner.text='';
     txtBylevelIntermediate.text ='';
     txtBylevelAdvance.text='';
     txtBylevelprof.text='';
     txtBylevelBeginner2.text='';
     txtBylevelIntermediate2.text ='';
      txtBylevelAdvance2.text='';
      txtBylevelProf2.text='';
    selectingBylevel = true;
    bylevelBeginner = false;
     bylevelIntermediate = false;
     bylevelAdvance = false;
     bylevelprof = false;
     bylevelBeginner2 = false;
     bylevelIntermediate2 = false;
     bylevelProf2 = false;
     bylevelAdvance2 = false;

    notifyListeners();
  }

  clearage()
  {
    txtBylevelUnder12.text = '';
     txtBylevelUnder14.text = '';
   txtBylevelUnder16.text = '';
     txtBylevelAdult.text = '';
    txtBylevelUnder12Second.text = '';
   txtBylevelUnder14Second.text = '';
     txtBylevelUnder16Second.text = '';
    txtBylevelAdultSecond.text = '';
    bylevelUnder12 = false;
    bylevelUnder14 = false;
     bylevelUnder16 = false;
     bylevelAdult = false;
     bylevelUnder12Second = false;
     bylevelUnder14Second = false;
     bylevelUnder16Second = false;
     bylevelAdultSecond = false;

    notifyListeners();
  }

  @override
  void dispose() {
    txtBylevelBeginner.dispose();
    txtBylevelIntermediate.dispose();
    txtBylevelAdvance.dispose();
    txtBylevelprof.dispose();
    super.dispose();
  }

  /// toggle for by age

    int get getCount=>count;
    incrementCount(){
    count++;
    notifyListeners();
    }
    resetcounter(){
      count = 0;
    notifyListeners();
    }

  void togglebycustom(index) {
    customChecked[index] =!customChecked[index];
    notifyListeners();
  }

  void togglebycustom2(index) {
    customChecked2[index] =!customChecked2[index];
    notifyListeners();
  }


  void CustomTileExpanded() {
    customTileExpanded = !customTileExpanded;
    notifyListeners();
  }

  void handleTextFieldChange(String value) {
    updateContinueButtonEnabled();
  }

  void togglebylevelUnder12() {
    bylevelUnder12 = !bylevelUnder12;
    if (!bylevelUnder12) {
      txtBylevelUnder12.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }

  void togglebylevelUnder14() {
    bylevelUnder14 = !bylevelUnder14;
    if (!bylevelUnder14) {
      txtBylevelUnder14.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }

  void togglebylevelUnder16() {
    bylevelUnder16 = !bylevelUnder16;
    if (!bylevelUnder16) {
      txtBylevelUnder16.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }

  void togglebylevelAdult() {
    bylevelAdult = !bylevelAdult;
    if (!bylevelAdult) {
      txtBylevelAdult.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }

  void togglebylevelUnder12Second() {
    bylevelUnder12Second = !bylevelUnder12Second;
    notifyListeners();
  }

  void togglebylevelUnder14Second() {
    bylevelUnder14Second = !bylevelUnder14Second;
    notifyListeners();
  }

  void togglebylevelUnder16Second() {
    bylevelUnder16Second = !bylevelUnder16Second;
    notifyListeners();
  }

  void togglebylevelAdultSecond() {
    bylevelAdultSecond = !bylevelAdultSecond;
    notifyListeners();
  }


  void togglebylevelBeginner() {
    bylevelBeginner = !bylevelBeginner;
    if (!bylevelBeginner) {
      txtBylevelBeginner.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }

  void togglebylevelBeginner2() {
    bylevelBeginner2 = !bylevelBeginner2;
    notifyListeners();
  }

  void togglebylevelIntermediate() {
    bylevelIntermediate = !bylevelIntermediate;
    if (!bylevelIntermediate) {
      txtBylevelIntermediate.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }
  void togglebylevelIntermediate2() {
    bylevelIntermediate2 = !bylevelIntermediate2;
    notifyListeners();
  }

  void togglebylevelAdvance() {
    bylevelAdvance = !bylevelAdvance;
    if (!bylevelAdvance) {
      txtBylevelAdvance.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }
  void togglebylevelAdvance2() {
    bylevelAdvance2 = !bylevelAdvance2;
    notifyListeners();
  }

  void togglebylevelprof() {
    bylevelprof = !bylevelprof;
    if (!bylevelprof) {
      txtBylevelprof.text = ''; // Clear the text field if the checkbox is unchecked
    }
    notifyListeners();
  }
  void togglebylevelprof2() {
    bylevelProf2 = !bylevelProf2;
    notifyListeners();
  }
  final _myRepo = ProgramRepository();

  ApiResponse<ProgramListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<ProgramListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchProgramListApi(dynamic data)async{
    setDataList(ApiResponse.loading());
    _myRepo.fetchProgramListApi(data).then((value){
      print(value.data![0].catName.toString());
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}


