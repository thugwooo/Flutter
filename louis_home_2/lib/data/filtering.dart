dynamic filteringPet(var filteringData, var key) {
  var filteredData = [];
  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['pet'] == key) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringBcs(var filteringData) {
  var filteredData = [];
  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['health'].contains('다이어트')) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringAlg(var filteringData, var key) {
  var filteredData = [];
  if (key.contains('잘 모르겠어요')) {
    for (var i = 0; i < filteringData.length; i++) {
      if (filteringData[i]['sprotein'] == '1') {
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

dynamic filteringHealth(var filteringData, var key) {
  var filteredData = [];

  if (key.length < 1) {
    filteredData = filteringData;
  } else {
    for (var i = 0; i < filteringData.length; i++) {
      var flag = false;

      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['health'].contains(key[j] + '(S)')) {
          flag = true;
        }
      }
      if (flag) {
        filteredData.add(filteringData[i]);
      }
    }
    for (var i = 0; i < filteringData.length; i++) {
      var flag = false;

      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['health'].contains(key[j])) {
          flag = true;
        }

        if (flag) {
          filteredData.add(filteringData[i]);
        }
      }
    }
  }
  return filteredData;
}

dynamic filteringSize(var filteringData, var key) {
  var filteredData = [];

  for (var i = 0; i < filteringData.length; i++) {
    if (filteringData[i]['size'].contains('무관') ||
        filteringData[i]['size'].contains(key) ||
        filteringData[i]['size'] == ['']) {
      filteredData.add(filteringData[i]);
    }
  }
  return filteredData;
}

dynamic filteringAge(var filteringData, var key) {
  var filteredData = [];
  if (key == 'G(3~)') {
    for (var i = 0; i < filteringData.length; i++) {
      if (filteringData[i]['age'].contains(key) ||
          filteringData[i]['age'].contains('G') ||
          filteringData[i]['age'].contains('무관')) {
        filteredData.add(filteringData[i]);
      }
    }
  } else {
    for (var i = 0; i < filteringData.length; i++) {
      if (filteringData[i]['age'].contains(key) ||
          filteringData[i]['age'].contains('무관')) {
        filteredData.add(filteringData[i]);
      }
    }
  }
  return filteredData;
}
