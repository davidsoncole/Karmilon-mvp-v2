import 'package:flutter/material.dart';
import 'package:karmilon/providers/auth.dart';
import 'package:karmilon/providers/flutterwave.dart';
import 'package:karmilon/providers/get_auth.dart';
import 'package:karmilon/providers/reset_auth.dart';
import 'package:karmilon/providers/vet_auth.dart';
import 'package:karmilon/screens/auth_screen.dart';
import 'package:karmilon/screens/dashboard_screen.dart';
import 'package:karmilon/screens/deposit_screen.dart';
import 'package:karmilon/screens/signin_screen.dart';
import 'package:karmilon/screens/signup_screen.dart';
import 'package:karmilon/screens/splash_screen.dart';
import 'package:karmilon/screens/transaction_screen.dart';
import 'package:karmilon/screens/verification_screen.dart';
import 'package:karmilon/screens/verified_screen.dart';
import 'package:karmilon/screens/wallet_screen.dart';
import 'package:karmilon/screens/withdrawal_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, VetAuth>(
          create: (ctx) => VetAuth('', 0, ''), update: (context, auth, previousVetAuth) => VetAuth(
            auth.token, auth.userId, auth.userEmail
          ),
        ),
        ChangeNotifierProxyProvider<Auth, GetAuth>(
          create: (ctx) => GetAuth(''), update: (context, auth, previousGetAuth) => GetAuth(
            auth.token
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Flutterwave>(
          create: (ctx) => Flutterwave(''), update: (context, auth, previousFlutterwave) => Flutterwave(
            auth.token
          ),
        ),
        ChangeNotifierProvider.value(
          value: ResetAuth(),
        ),
        
      ],
      child: MaterialApp(
        //title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const SplashScreen(),
        routes: {
          '/signin_screen': (context) => const SignInScreen(),
          '/signup_screen': (context) => const SignUpScreen(),
          '/verification_screen': (context) => const VerificationScreen(),
          '/verified_screen': (context) => const VerifiedScreen(),
          '/auth_screen': (context) => const AuthScreen(),
          '/dashboard_screen': (context) => const DashboardScreen(),
          '/wallet_screen': (context) => WalletScreen(),
          '/transaction_screen': (context) => TransactionScreen(),
          '/deposit_screen': (context) => DepositScreen(),
          '/withdrawal_screen': (context) => WithdrawalScreen(),
        },

        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          );
        },
      ),
    );
  }
}
