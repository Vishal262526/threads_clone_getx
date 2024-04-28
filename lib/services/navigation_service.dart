import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone/views/home/home_page.dart';
import 'package:threads_clone/views/notification/notifications.dart';
import 'package:threads_clone/views/profile/profile.dart';
import 'package:threads_clone/views/search/search.dart';
import 'package:threads_clone/views/thread/add_thread.dart';

class NavigationService extends GetxService {
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;

  List<Widget> navigationViews = [
    const HomePage(),
    const Search(),
    const AddThread(),
    const Notifications(),
    const Profile(),
  ];

  void updateIndex(int index) {
    previousIndex.value = currentIndex.value;
    currentIndex.value = index;
  }
}
