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

    //처음에 해야할 일, 반복.
    boot(cmdIndex);


  }

  //처음에 시작해야하는 일들.
  void boot(int cmdIndex){

    startCmdString();           // 메뉴 상위부분 출력
    statusView();                // 사용자 상태 값 출력
    cmdView(cmdList, cmdIndex); // cmdIndex값에 따라, cmdList[cmdIndex][3]. 메뉴를 출력.
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




  /*cmdList를 만들고,  '주요값'.                              0번째 Index값은 주요 명령어 스트링 이름, "Login"등으로 저장.
                      'cmdList[index]의 이름'.               1번째 ''Index값은 실행해야할 메서드 또는 지정이름. cmdList[index]의 이름.
                      'NumberQuestion || moveStringScreen'. 2번째는 숫자값을 물어보는 형태로 진행,'NumberQuestion'., 또는 결과페이지. cmdList의 마지막 인덱스 값이 cmdList 첫번째 인덱스 값과 일치하는 인덱스로 이동하기.
                      '1.메뉴이름,2.메뉴이름,...'.             3번째는 숫자로 시작하는 메뉴들을 모아놓음. String변수. ','로 구분하여 저장.
                      '리턴할 cmdList주요값'.                 4번째는 다시 돌아갈 메뉴. cmdList의 첫번째 Index값과 동일하게 만든다. 또는 실행해야할 메서드이름과 비슷하게 작성, 또는 ''.

   */


  void inputData() {
    cmdList.add(['start',        'start',     'NumberQustion',    '1.Login,2.Logout,3.Service,4.Quit','']);
    cmdList.add(['start,1.Login','login',     'MoveStringScreen', 'MoveScreenLoginTF','start,1.Login_resultTF']);
    cmdList.add(['start,1.Login_resultTF','login_true','MoveStringScreen', 'Log activated.'                   ,'start']);
    cmdList.add(['start,1.Login_resultTF','login_false','MoveStringScreen','Need registe[Y/N]'                ,'regist_chk']);


  }

  void cmdView(List<List<String>> cmdList, int cmdIndex) {
    print("***** Command View *****\n");

    // 명령어 메뉴값. split으로 각각 나눔. '1.메뉴이름, 2.메뉴이름,3.메뉴이름'
    List<String> cmdStrSpt = cmdList[cmdIndex][3].split(',');

    // 사용자에게 입력받는 숫자값. cmdList[cmdIndex][2]의 값이 'NumberQustion'일 경우 사용.
    int input=0;



    for (int i = 0; i < cmdStrSpt.length; i++) {
      print("${cmdStrSpt[i]}");
    }
    print("");

   //cmdList[cmdIndex][2]의 값이 'NumberQustion'일 경우, 숫자값을 입력받는 로직을 실행시킨다.
    if(cmdList[cmdIndex][2] == 'NumberQustion') {
      print("INPUT a number:");

      try {
        input = int.parse(stdin.readLineSync()!); // 숫자 입력 받기
      }catch(e){
        print(e);
        print("Error. Back to First Menu.");
        //input값이 예외값인 경우, 다시 cmdIndex값을 0으로 하여, 메뉴를 처음부터 작동시킨다.
        boot(0);
      }
      input = input - 1; // 입력한 숫자와 메뉴 인덱스를 맞추기 위해 1을 뺌
      print("***** Comment View *****\n");
      print("Input Number is '${input +1}'. and cmdList[][3], '${cmdList[cmdIndex][3]}'. \n");
      //cmdList[cmdIndex][3]의 값을 split한다.1
      List<String> menuStrs = cmdList[cmdIndex][3].split(',');
      print("So, menu value is '${menuStrs[input]}'. Next make code, //TODO.");
      //메뉴값을 가져올 수 있으므로, 해당 일을 시켜주면 된다.
      //TODO next this line~~. 메뉴값을 가져올수 있으므로, if문에 대입해서, cmdList를 진행시켜주면 됨니다.
      //입력받은 input이 명령어 숫자를 넘어섰는지 확인.
      try{

      }catch(e){
        print(e);
        print("Error. Back to First Menu.");
        //input값이 예외값인 경우, 다시 cmdIndex값을 0으로 하여, 메뉴를 처음부터 작동시킨다.
        boot(0);
      }

      //cmdView(cmdList, cmdIndex);
    } else if(cmdList[cmdIndex][2] == 'MoveStringScreen') {
      print("${cmdList[cmdIndex][3]}");
      cmdIndex = cmdList[cmdIndex][4] == '' ? 0 : cmdList[cmdIndex][4] == 'start' ? 0 : 1;
      //cmdView(cmdList, cmdIndex);
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


