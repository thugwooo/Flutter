import 'dart:io';

void main() {
  showData();
}

void showData() async {
  startTask();
  String account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String> accessData() async {
  String account = "";
  Duration time = Duration(seconds: 3);

  if (time.inSeconds > 2) {
    //sleep(time);
    await Future.delayed(time, () {
      account = '8500';
      print(account);
    });
  } else {
    String info2 = '데이터를 가져옴';
    print(info2);
  }
  return account;
}

void fetchData(String account) {
  String info3 = '$account 입니다';
  print(info3);
}
