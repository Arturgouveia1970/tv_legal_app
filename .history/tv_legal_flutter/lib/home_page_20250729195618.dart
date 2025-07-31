import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> canais = [
    {
      'title': 'Al Jazeera',
      'url': 'https://live-hls-web-aje.getaj.net/AJE/index.m3u8',
      'icon': 'assets/images/aljazeera.png',
      'category': 'News'
    },
    {
      'title': 'DW News',
      'url': 'https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/index.m3u8',
      'icon': 'assets/images/dw.png',
      'category': 'News'
    },
    {
      'title': 'Red Bull TV',
      'url': 'https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master.m3u8',
      'icon': 'assets/images/redbull.png',
      'category': 'Sports'
   
