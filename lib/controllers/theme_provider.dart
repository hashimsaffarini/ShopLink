import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_link/core/utils/app_colors.dart';

final themeProvider = StateProvider<Color>((ref) => AppColors.primaryColor);