import 'package:baraton_soko/injection_container.dart';
import 'package:baraton_soko/providers/categories_provider.dart';
import 'package:baraton_soko/providers/like_dislikes_provider.dart';
import 'package:baraton_soko/providers/products_provider.dart';
import 'package:baraton_soko/providers/users_provider.dart';
import 'package:baraton_soko/ui/firebase_options.dart';
import 'package:baraton_soko/ui/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetItInjectionContainer().registerDependencies(); // Await if it's async
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<UsersProvider>()),
        ChangeNotifierProvider(create: (context) => getIt<CategoriesProvider>()),
        ChangeNotifierProvider(create: (context) => getIt<LikeDislikesProvider>()),
        ChangeNotifierProvider(create: (context) => getIt<ProductsProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
