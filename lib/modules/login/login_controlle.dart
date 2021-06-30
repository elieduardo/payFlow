import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSingIng(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoURL: response.photoUrl);
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
    }
  }

  Future<void> googleLogout(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print("ERRO LOGOUT --> $error");
    }
  }
}
