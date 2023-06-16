import 'dart:io';

void main(){
  MenuInit();
}


class MenuInit{

  int menuIndex = 0;
  List<List<String>> menuList = [];
  bool loginTF = false;
  String writeID = "";
  String writePW = "";
  String userRole="";

  late DateTime loginTime;

  MenuInit(){
    print("--------------------");
    print("Starting...");
    print("Dart TDD~. \nDart programing. Test Driven Development(TDD). Example.\nLet's make this. After Extract model, service on Flutter, app.\nI'm making it. Not complete yet.");
    print("Github, https://github.com/infott2t/dartTddEx");
    print("Fasting.");
    initMenuList();
    boot(menuIndex);

  }

  void boot(int menuIndex) {
    String resultMenu = "";
    print("--------------------");
    if (menuList[menuIndex][2] == 'NumberQuestion') {
      //munuList[menuIndex][1]의 값을 split해서 print하기.
      //메뉴값을 저장.
      List<String> menuList0 = menuList[menuIndex][1].split(',');

      for (int i = 0; i < menuList[menuIndex][1]
          .split(',')
          .length; i++) {
        print("${menuList[menuIndex][1].split(',')[i]}");
      }
      //값 입력받기, stdin
      print("Enter a number corresponding to the menu options:");
      int input = int.parse(stdin.readLineSync()!); // 숫자 입력 받기


      resultMenu = menuList[menuIndex][0] + "," + menuList0[input - 1];
      //menuList에서 cmdList[menuIndex][0]의 값과 resultMenu값이 일치하는 부분을 찾기.
      // print(resultMenu);
      int i = 0;
      for (i = 0; i < menuList.length; i++) {
        if (menuList[i][0] == resultMenu) {
          menuIndex = i;

          break;
        }
      }
      boot(i);
    }
    else if (menuList[menuIndex][2] == "chkBool") {
      //메뉴 출력.
      print(menuList[menuIndex][1]);

      //로그인 체크.
      if (menuList[menuIndex][0] == "start,1.Login") {
        //TODO - http, 로그인 확인 하고 값 저장하기.
        // loginTF = http....

        if (loginTF) {
          resultMenu = menuList[menuIndex][0] + ",T";
          print("TRUE");
        } else {
          resultMenu = menuList[menuIndex][0] + ",F";
          print("FALSE");
        }
      } else if (menuList[menuIndex][0] ==
          "start,1.Login,F,Y,writingID,writingPassword") {
        //TODO - http, 로그인 확인하고 값 저장하기.
        // loginTF = http....
        print("---ID, $writeID");
        String resultMenu = "";
        if (loginTF) {
          resultMenu = menuList[menuIndex][0] + ",T";
          print("TRUE");
          boot(0);
        } else {
          resultMenu = menuList[menuIndex][0] + ",F";
          print("FALSE");
          boot(0);
        }
      }
      //menuList에서 cmdList[menuIndex][0]의 값과 resultMenu값이 일치하는 부분을 찾기.
      int i = 0;
      for (i = 0; i < menuList.length; i++) {
        if (menuList[i][0] == resultMenu) {
          menuIndex = i;
          //print(i);
          break;
        }
      }

      boot(i);
    }
    else if (menuList[menuIndex][2] == "YNQuestion") {
      //메뉴출력.
      print(menuList[menuIndex][1]);
      //값 입력받기, stdin
      print("Question, Y/N:");
      String input = stdin.readLineSync()!; // Y/N 입력 받기.


      if (input == "Y" || input == "y") {

        resultMenu = menuList[menuIndex][0] + ",Y";
      } else if (input == "N" || input == "n") {

        resultMenu = menuList[menuIndex][0] + ",N";
      } else {
        boot(menuIndex);
      }
      //menuList에서 cmdList[menuIndex][0]의 값과 resultMenu값이 일치하는 부분을 찾기.
      int i = 0;
      for (i = 0; i < menuList.length; i++) {
        if (menuList[i][0] == resultMenu) {
          menuIndex = i;
          //print(i);
          break;
        }
      }
      boot(i);
    }
    else if (menuList[menuIndex][2] == "StringQuestion") {
      //메뉴출력.
      print(menuList[menuIndex][1]);
      //값 입력받기, stdin
      print("String input:");
      String input = stdin.readLineSync()!; // Y/N 입력 받기.
      print(input);

      if (input != null) {
        if (menuList[menuIndex][0] == "start,1.Login,F,Y") {
          writeID = input;
          resultMenu = menuList[menuIndex][0] + ",writingID";
        } else if (menuList[menuIndex][0] == "start,1.Login,F,Y,writingID") {
          writePW = input;
          resultMenu = menuList[menuIndex][0] + ",writingPassword";
        }
      }
      //menuList에서 cmdList[menuIndex][0]의 값과 resultMenu값이 일치하는 부분을 찾기.
      int i = 0;
      for (i = 0; i < menuList.length; i++) {
        if (menuList[i][0] == resultMenu) {
          menuIndex = i;
          //print(i);
          break;
        }
      }
      boot(i);
    } else if(menuList[menuIndex][2] =="InitMenu"){
      //메뉴출력.
      print(menuList[menuIndex][1]);
      boot(0);
    }

    else if (menuList[menuIndex][0] == "start,4.Status") {
      print("Status");
      if (loginTF) {
        print("ID : $writeID");
        print("User Role : $userRole");
      } else {
        print("No Login.");
      }
      boot(0);
    }
  }

  void initMenuList() {
    menuList.add(['start','1.Login,2.Logout,3.Service,4.Status,5.Regist,6.Exit','NumberQuestion']);
    menuList.add(['start,1.Login','Check login...','chkBool']);
    menuList.add(['start,1.Login,T','Activated.','start']);
    menuList.add(['start,1.Login,F','Not Activated. \nLogin?[Y/N]','YNQuestion']);
    menuList.add(['start,1.Login,F,Y','Login..., input ID. ','StringQuestion']);
    menuList.add(['start,1.Login,F,Y,writingID','Login input Password.','StringQuestion']);
    menuList.add(['start,1.Login,F,Y,writingID,writingPassword','Login input Password.','chkBool']);
    menuList.add(['start,1.Login,F,Y,writingID,writingPassword,chkBool','Check login...','chkBool']);
    menuList.add(['start,1.Login,F,N','No login. ','InitMenu']);
    menuList.add(['start,4.Status','Status...','PrintStatus']);
  }
}