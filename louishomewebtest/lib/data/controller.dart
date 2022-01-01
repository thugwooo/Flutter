import 'package:get/get.dart';

class indexController extends GetxController {
  var selectedIndex = 0.obs;
  indexedButton(index) {
    selectedIndex.value = index;
  }
}

class userDataController extends GetxController {
  RxString userName = ''.obs;
  RxString userPhonenumber = ''.obs;
  RxString petName = ''.obs;
  RxInt periodWeek = 0.obs;
  RxString petfood = '선택된 사료 없음'.obs;
  RxString address = ''.obs;
  RxString credit = ''.obs;
  RxString registerDate = ''.obs;
  setUserName(value) {
    userName.value = value;
  }

  setUserPhonenumber(value) {
    userPhonenumber.value = value;
  }

  setPetName(value) {
    petName.value = value;
  }

  setPeriodWeek(value) {
    periodWeek.value = value;
  }

  setPetfood(value) {
    petfood.value = value;
  }

  setAddress(value) {
    petfood.value = value;
  }
}

class infoController extends GetxController {
  RxList userList = [].obs;

  setUserList(value) {
    userList.add(value);
    print(userList);
    userList.sort((a, b) => a['date'].compareTo(b['date']));
  }

  deleteUserList(value) {
    userList.removeAt(value);
  }
}
