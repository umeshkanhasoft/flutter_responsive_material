import 'dart:io';

void main() {
  // List of folders to create under lib
  final List<String> folders = [
    'lib/bindings',
    'lib/common/themes',
    'lib/common/widgets',
    'lib/core',
    'lib/data/models',
    'lib/data/repositories',
    'lib/data/services',
    'lib/features/auth/widgets',
    'lib/features/home/widgets',
    'lib/features/profile/widgets',
    'lib/routes',
    'lib/utils',
  ];

  // Map of files to create and their content
  final Map<String, String> files = {
    'lib/bindings/app_binding.dart': '''
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Register your dependencies here
  }
}
''',
    'lib/bindings/feature_binding.dart': '''
import 'package:get/get.dart';

class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    // Register your feature-specific dependencies here
  }
}
''',
    'lib/common/themes/app_colors.dart': '''
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6200EA);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF6F6F6);
}
''',
    'lib/common/themes/app_text_styles.dart': '''
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
  );
}
''',
    'lib/common/themes/app_theme.dart': '''
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      backgroundColor: AppColors.background,
      textTheme: TextTheme(
        headline1: AppTextStyles.heading,
        bodyText1: AppTextStyles.body,
      ),
    );
  }
}
''',
    'lib/common/widgets/custom_button.dart': '''
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
''',
    'lib/common/widgets/loading_widget.dart': '''
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
''',
    'lib/core/api_service.dart': '''
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, Map<String, dynamic> data) async {
    return await _dio.post(url, data: data);
  }
}
''',
    'lib/core/app_config.dart': '''
class AppConfig {
  static const String apiBaseUrl = 'https://api.example.com';
}
''',
    'lib/data/models/user_model.dart': '''
class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
''',
    'lib/data/models/product_model.dart': '''
class ProductModel {
  final String id;
  final String name;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
''',
    'lib/routes/app_pages.dart': '''
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    // Define your GetX routes here
  ];
}
''',
    'lib/routes/app_routes.dart': '''
class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
}
''',
    'lib/utils/constants.dart': '''
class Constants {
  static const String appName = 'Flutter App';
}
''',
    'lib/utils/validators.dart': '''
class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@\\s]+@[^@\\s]+\\.[^@\\s]+\$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
''',
    'lib/main.dart': '''
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
}
''',
    'lib/app.dart': '''
import 'package:flutter/material.dart';

import 'common/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text('Welcome to Flutter!'),
        ),
      ),
    );
  }
}
''',
  };

  // Create folders
  for (var folder in folders) {
    Directory(folder).createSync(recursive: true);
    print('Created folder: $folder');
  }

  // Create files with content
  files.forEach((filePath, content) {
    File(filePath).writeAsStringSync(content);
    print('Created file: $filePath');
  });

  print('Project structure with content created in lib folder!');
}