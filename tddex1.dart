import 'dart:io';



void main(List<String> arguments) {

  CmdInit();
}

class CmdInit {

  // Command String Formated Data
  late List<List<String>> cmdList = [];
  int cmdIndex = 0;


  DateTime bootUpTime= DateTime.now();  // program boot up time

  bool loginTF = false;   //  login true or false

  CmdInit() {
    bootUpTime = DateTime.now();
    //Need http, save BootupTime.
    inputData();
    startCmdString();
    statusView();
    cmdView3(cmdList, cmdIndex);


  }



  void startCmdString() {
    print("\n\n\n");
    print("Starting....\n");
    print("---- Hello, TDD. Test Driven Development. Fasting. ----\n");
    print("Have a good day. today and time: ${DateTime.now()}\n");
    print("This github, https://github.com/infott2t/dartTddEx");

  }

  void statusView() {
    print("***** Status View *****\n");
    print("Now bootUp time: $bootUpTime\n");
    print("login time     : NONE\n");
    print("login id       : N/A");
    print("");
    print("User Role      : --");
    print("Now service    : --");
    print("");
  }

  void cmdView() {
    print("***** Command View *****\n");
    print("1. Login");
    print("2. Logout");
    print("3. User Role");
    print("4. Service");
    print("5. Exit");
    print("");
  }

  void cmdView2() {
    print("***** Command View *****\n");
    print("1. Login");
    print("2. Logout");
    print("3. User Role");
    print("4. Service");
    print("5. Exit");
    print("");
  }



  /*cmdList를 만들고,  '주요값'.                              0번째 Index값은 주요 명령어 스트링 이름, "Login"등으로 저장.
                      'cmdList[index]의 이름'.               1번째 ''Index값은 실행해야할 메서드 또는 지정이름. cmdList[index]의 이름.
                      'NumberQuestion || moveStringScreen'. 2번째는 숫자값을 물어보는 형태로 진행,'NumberQuestion'., 또는 결과페이지. cmdList의 마지막 인덱스 값이 cmdList 첫번째 인덱스 값과 일치하는 인덱스로 이동하기.
                      '1.메뉴이름,2.메뉴이름,...'.             3번째는 숫자로 시작하는 메뉴들을 모아놓음. String변수. ','로 구분하여 저장.
                      '리턴할 cmdList주요값'.                 4번째는 다시 돌아갈 메뉴. cmdList의 첫번째 Index값과 동일하게 만든다. 또는 실행해야할 메서드이름과 비슷하게 작성, 또는 ''.

   */


  void inputData() {
    cmdList.add(['start',        'start',     'NumberQustion',    '1.Login,2.Logout,3.Service,4.Quit','']);
    cmdList.add(['start,1.Login','login',     'MoveStringScreen', 'ID,PW','start']);
    cmdList.add(['start,1.Login_result','login_true','MoveStringScreen', 'Log activated.'                   ,'start']);
    cmdList.add(['start,1.Login_result','login_false','MoveStringScreen','Need registe[Y/N]'                ,'regist_chk']);


  }

  void cmdView3(List<List<String>> cmdList, int cmdIndex) {
    print("***** Command View *****\n");
    List<String> cmdStrSpt = cmdList[cmdIndex][3].split(',');
    for (int i = 0; i < cmdStrSpt.length; i++) {
      print("${cmdStrSpt[i]}");
    }
    print("");
    if(cmdList[cmdIndex][2] == 'NumberQustion') {
      print("DRIVE a number:");
      int input = int.parse(stdin.readLineSync()!); // 숫자 입력 받기
      cmdIndex = input - 1; // 입력한 숫자와 메뉴 인덱스를 맞추기 위해 1을 뺌
      cmdView3(cmdList, cmdIndex);
    } else if(cmdList[cmdIndex][2] == 'MoveStringScreen') {
      print("${cmdList[cmdIndex][3]}");
      cmdIndex = cmdList[cmdIndex][4] == '' ? 0 : cmdList[cmdIndex][4] == 'start' ? 0 : 1;
      cmdView3(cmdList, cmdIndex);
    } else {
      print("Invalid menu option!");
    }
  }

  void userInputStdin(){
    print("Enter a number corresponding to the menu options:");
    int input = int.parse(stdin.readLineSync()!); // 숫자 입력 받기
  }

  void executeNumberQuestion(String menu) {
    print("Enter a number corresponding to the menu options:");
    int input = int.parse(stdin.readLineSync()!); // 숫자 입력 받기

    List<String> menuList = menu.split(','); // 메뉴 문자열을 ','로 분리하여 리스트로 저장
    int index = input - 1; // 입력한 숫자와 메뉴 인덱스를 맞추기 위해 1을 뺌

    if (index >= 0 && index < menuList.length) {
      String selectedMenu = menuList[index].trim(); // 선택한 메뉴 가져오기 (앞뒤 공백 제거)
      // 선택한 메뉴에 해당하는 동작 수행
      // ...
    } else {
      print("Invalid menu option!");
    }
  }


}


