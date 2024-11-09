
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'main_repo.dart';

// GET METHOD
/*Note-- The return type depends on what response.data is expected to be.
 If it's complex, you might need to return dynamic.*/

Future<Response?> getData(String endpoint) async {
  try {
    final response = await MainRepo.dio.get(endpoint);
    return response;
  } catch (e) {
    MainRepo.handleError(e);
    return null;
  }
}