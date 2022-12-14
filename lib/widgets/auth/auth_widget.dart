import 'package:buttons/Theme/app_button_style.dart';
import 'package:buttons/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your accaount'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            _FormWidget(),
            SizedBox(height: 25),
            Text(
                'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.Click to get started.',
                style: textStyle),
            SizedBox(
              height: 5,
            ),
            TextButton(
              style: AppButtonStyle.linkButton,
              child: Text('Rigister'),
              onPressed: () {},
            ),
            SizedBox(height: 25),
            Text(
                'If you signed up but didn\'t get your verification email,resend-email-verification click here to have it resent',
                style: textStyle),
            SizedBox(
              height: 5,
            ),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Verify email'),
            ),
          ],
        ));
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('open app');

      // Navigator.of(context).pushReplacementNamed('/main_screen');
      Navigator.of(context).pushNamed('/main_screen');
    } else {
      errorText = 'invalid login or password';
      print('show error');
    }
    setState(() {});
  }

  void _resetPasssword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      color: Color(0xFF212529),
    );
    final color = const Color(0xFF01B4E4);
    final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(errorText, style: TextStyle(color: Colors.red, fontSize: 17)),
          SizedBox(
            height: 20,
          ),
        ],
        Text('Username', style: textStyle),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        SizedBox(
          height: 5,
        ),
        Text('Password', style: textStyle),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ElevatedButton(
              child: Text('Login'),
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFF01B4E4),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
              ),
            ),
            SizedBox(width: 20),
            TextButton(
                onPressed: _resetPasssword,
                style: AppButtonStyle.linkButton,
                child: Text('Reset paswword'))
          ],
        )
      ],
    );
  }
}
