import 'package:flutter/material.dart';

Widget showLoader() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget showRefresh() {
  return const Center(
    child: Icon(Icons.refresh),
  );
}

Widget showError() {
  var errorMessage = 'Problems getting data';
  return Center(
    child: Text(
      errorMessage,
      textAlign: TextAlign.center,
      textScaleFactor: 1.3,
    ),
  );
}
