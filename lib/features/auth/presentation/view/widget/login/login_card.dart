import 'package:flutter/material.dart';
import '../../login_view.dart';
import 'login_form.dart';
class LoginCard extends StatelessWidget {
  const LoginCard();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<LoginViewState>()!;

    return SlideTransition(
      position: state.slideAnimation,
      child: FadeTransition(
        opacity: state.fadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
