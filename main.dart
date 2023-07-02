import 'dart:io';

void main() {
  List<List<String>> doList = [
    ['Eat things', 'Buy', 'fluit', 'Apple'],
    ['Eat things', 'Buy', 'fluit', 'Banana'],
    ['Eat things', 'Buy', 'Begitable', 'Onian'],
    ['Eat things', 'Meals', 'Asia food', 'Soup', 'Kimch jige'],
    ['Eat things', 'Meals', 'America food', 'Meat', 'Porkautu'],
    ['Shoping', 'Clothes', 'top', 'T-shirt'],
    ['Shoping', 'Clothes', 'top', 'Sweter'],
    ['Shoping', 'Clothes', 'down', 'Jean'],
    ['Shoping', 'Clothes', 'down', 'Sweat pants'],
    ['Shoping', 'Accesory', 'wallet', 'Card wallet'],
    ['Shoping', 'Accesory', 'wallet', 'wallet'],
    ['Shoping', 'Accesory', 'Belt'],
  ];

  int dept = 0;
  bool running = true;

  List<String> beforeMenu = [];
  List<String> menu = []; //선택한 메뉴
  String chooseString = ''; //선택한 메뉴 값.
  List<String> chooseStrList = []; //선택한 메뉴 값들의 리스트.

  do {
    //dept의 값에 따라 전 메뉴(beforeMenu)를 담아놓는다.
    //do문의 반복실행이므로, menu값을 초기화한다.
    menu = [];

    if (dept == 0) {
      for (int i = 0; i < doList.length; i++) {
        if (!beforeMenu.contains(doList[i][dept])) {
          beforeMenu.add(doList[i][dept]);
        }
      }
    }

    print('Menu Dept: $dept');
    print('Interested in now time?');
    for (int i = 0; i < beforeMenu.length; i++) {
      print('${i + 1}. ${beforeMenu[i]}');
    }
    print('0. Exit');
    print('Please select a menu (Number): ');
    String? input = stdin.readLineSync();

    int? number = int.tryParse(input!);
    if (number != null) {
      if (number == 0) {
        print('Exit the program.');
        running = false;
        continue;
      }
      chooseString = beforeMenu[number - 1];
      print('$chooseString ...choose String.');
      chooseStrList.add(chooseString);
      //선택된 값, chooseString값이 doList에 마지막 요소인지 검사한다.
      //마지막 요소라면, 선택된 값들을 출력하고 프로그램을 종료한다.
      for (int i = 0; i < doList.length; i++) {
        int j = doList[i].length - 1;
        if (chooseString == doList[i][j]) {
          print('Choise value: $chooseString');
          print('Exit the program.');
          running = false;
          continue;
        }
      }
      if (running == false) continue;

      dept++;

      for (int i = 0; i < doList.length; i++) {
        if (doList[i][dept - 1] == chooseString &&
            !menu.contains(doList[i][dept])) {
          menu.add(doList[i][dept]);
        }
      }
      print(menu);
      beforeMenu = menu;
    } else {
      print('Input err: Please input number.\n\n');
      continue;
    }
  } while (running);
}
