class petfoodData {
  dynamic filteringAlg(List listpetfood, key) {
    List filteredData = [];

    for (var i = 0; i < listpetfood.length; i++) {
      bool flag = true;
      for (var j = 0; j < listpetfood[i]['alg'].length; j++) {
        for (var k; k < key.length; k++) {
          if (key[k] == listpetfood[i]['alg'][j]) {
            flag = false;
          }
        }
      }
      if (flag == true) {
        filteredData.add(listpetfood[i]);
      }
    }
    return filteredData;
  }

  dynamic filteringFlavor(List listpetfood, List key) {
    List filteredData = [];

    for (var i = 0; i < listpetfood.length; i++) {
      int cnt = 0;
      for (var j; j < listpetfood[i]['flavor']; j++) {
        for (var k; k < key.length; k++) {
          if (key[k] == listpetfood[i]['flavor'][j]) {
            cnt++;
          }
        }
      }
      if (cnt > 0) {
        filteredData.add(listpetfood[i]);
      }
    }
    return filteredData;
  }

  dynamic filteringHealth(List listpetfood, List key) {
    List filteredData = [];

    for (var i = 0; i < listpetfood.length; i++) {
      bool flag = true;
      for (var j = 0; j < listpetfood[i]['health'].length; j++) {
        for (var k; k < key.length; k++) {
          if (key[k] == listpetfood[i]['health'][j]) {
            flag = false;
          }
        }
      }
      if (flag == true) {
        filteredData.add(listpetfood[i]);
      }
    }
    return filteredData;
  }
}
