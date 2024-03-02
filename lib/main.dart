import 'package:baraton_soko/injection_container.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/providers/users_provider.dart';
import 'package:baraton_soko/ui/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetItInjectionContainer().registerDependencies(); // Await if it's async
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GetItInjectionContainer.getIt<UsersProvider>()),
          ChangeNotifierProvider(create: (context) => GetItInjectionContainer.getIt<CategoriesProvider>()),
          ChangeNotifierProvider(create: (context) => GetItInjectionContainer.getIt<LikeDislikesProvider>()),
          ChangeNotifierProvider(create: (context) => GetItInjectionContainer.getIt<ProductsProvider>()),
        ],
        child: SignInScreen(),
      ),
    );
  }
}
