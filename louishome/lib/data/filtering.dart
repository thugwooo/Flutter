import 'package:flutter/material.dart';

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
    if (filteringData[i]['diet'] == 1) {
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

  if (key.length == 1 && key.contains('다이어트')) {
    return filteringData;
  }
  for (var i = 0; i < filteringData.length; i++) {
    filteringData[i]['cnt'] = 0;
    filteringData[i]['cntS'] = 0;
  }
  if (key.contains('다이어트') == false) {
    for (var i = 0; i < filteringData.length; i++) {
      for (var j = 0; j < key.length; j++) {
        if (filteringData[i]['health'].contains(key[j] + '(S)') &&
            filteringData[i]['diet'] == 0) {
          filteringData[i]['cnt'] += 1;
          filteringData[i]['cntS'] += 1;
        }
        if (filteringData[i]['health'].contains(key[j]) &&
            filteringData[i]['diet'] == 0) {
          filteringData[i]['cnt'] += 1;
        }
      }
    }
    for (var i = 0; i < filteringData.length; i++) {
      if (filteringData[i]['cnt'] > 0) {
        filteredData.add(filteringData[i]);
      }
    }
  }
  filteredData.sort((a, b) => ((b['cnt']).compareTo(a['cnt'])));

  for (var i = filteredData.length - 1; i > 0; i--) {
    for (var j = 0; j < i; j++) {
      if (filteredData[j]['cntS'] < filteredData[j + 1]['cntS'] &&
          filteredData[j]['cnt'] == filteredData[j + 1]['cnt']) {
        var temp = filteredData[j];
        filteredData[j] = filteredData[j + 1];
        filteredData[j + 1] = temp;
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
