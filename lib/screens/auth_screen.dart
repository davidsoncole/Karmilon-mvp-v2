import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/get_auth.dart';
import 'package:karmilon/models/http_exception.dart';

/*void navigateToSignin(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}*/

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override

  // void initState() {
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<GetAuth>(context, listen: false).getUser();
  //   });
  //   super.initState();
  // }

  void initState() {
    super.initState();
    getData();
    // getTrans();
  }

  Future<void> getData() async {
    // setState(() {
    //   _isLoading = true;
    // });
    try {
      await Provider.of<GetAuth>(context, listen: false).getUser(
      );
      Navigator.of(context).pushReplacementNamed('/dashboard_screen');
    } on HttpException catch (_) {
      // print("move to verification");
      Navigator.of(context).pushReplacementNamed('/verification_screen');
    } catch (error) {
      //var errorMessage = '$error';
      // var errorMessage = 'Could not authenticate you';
      // _showErrorsnack(errorMessage);
    }
    // setState(() {
    //   _isLoading = false;
    // });
  }

  // Future<void> getTrans() async {
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //   try {
  //     await Provider.of<GetAuth>(context, listen: false).getTransList(
  //     );
  //     print("get transactions successful");
  //   } on HttpException catch (_) {
  //     print("get transaction failed");
  //   } catch (error) {
  //     print("get transaction error");
  //     //var errorMessage = '$error';
  //     // var errorMessage = 'Could not authenticate you';
  //     // _showErrorsnack(errorMessage);
  //   }
  //   // setState(() {
  //   //   _isLoading = false;
  //   // });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }
}
