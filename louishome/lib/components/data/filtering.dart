dynamic filteringGeneral(var filteringData, var key) {
  var fileredGeneral = [];
  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['pet'] == key &&
        filteringData[i]['food_type'] == '건식') {
      fileredGeneral.add(filteringData[i]);
    }
  }
  return fileredGeneral;
}

dynamic filteringAge(var filteringData, var key) {
  var filteredData = [];

  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['age'].contains('무관') ||
        filteringData[i]['age'] == [''] ||
        filteringData[i]['age'].contains(key)) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringSize(var filteringData, var key) {
  var filteredData = [];

  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['size'].contains('무관') ||
        filteringData[i]['size'] == [''] ||
        filteringData[i]['size'].contains(key)) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringBCS(var filteringData) {
  var filteredData = [];
  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['health'].contains('체중조절')) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringAlg(var filteringData, var key) {
  var filteredData = [];
  if (key.contains('잘 모르겠어요')) {
    for (var i = 0; i < filteringData.length; i++) {
      if (filteringData[i]['sprotein'] == 1) {
        filteredData.add(filteringData[i]);
      }
    }
  } else {
    for (var i = 0; i < filteringData.length; i++) {
      var flag = true;
      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['alg'].contains(key[j])) {
          flag = false;
        }
      }
      if (flag) {
        filteredData.add(filteringData[i]);
      }
    }
  }

  return filteredData;
}

dynamic filteringFlavor(var filteringData, var key) {
  var filteredData = [];
  if (key.length < 1) {
    filteredData = filteringData;
  }
  for (var i = 0; i < filteringData.length; i++) {
    int cnt = 0;
    for (var j = 0; j < key.length; j++) {
      if (filteringData[i]['flavor'].contains(key[j])) {
        cnt++;
      }
    }
    if (cnt > 0) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringHealth(var filteringData, var key) {
  var filteredData = [];
  if (key.length < 1) {
    filteredData = filteringData;
  } else {
    for (var i = 0; i < filteringData.length; i++) {
      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['health'].contains(key[j] + '(S)')) {
          filteredData.add(filteringData[i]);
        }
      }
    }
    for (var i = 0; i < filteringData.length; i++) {
      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['health'].contains(key[j])) {
          filteredData.add(filteringData[i]);
        }
      }
    }
  }
  return filteredData;
}
