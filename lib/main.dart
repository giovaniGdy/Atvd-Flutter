import 'package:flutter/material.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'User Login'),
    );
  }
}

showLogadoAlert(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      textAlign: TextAlign.center,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alerta = AlertDialog(
      backgroundColor: Color.fromRGBO(225, 225, 225, 70),
      title: Text(
        "Logado!",
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Parabéns você está logado!",
        textAlign: TextAlign.center,
      ),
      actions: [okButton]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      });
}

showInvalidoAlert(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      textAlign: TextAlign.center,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alerta = AlertDialog(
      backgroundColor: Color.fromRGBO(225, 225, 225, 70),
      title: Text(
        "Erro!",
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Credenciais Inválidas!",
        textAlign: TextAlign.center,
      ),
      actions: [okButton]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      });
}

logar(username, password, context) {
  if (username == "admin" && password == "petsaojoao") {
    showLogadoAlert(context);
  } else {
    showInvalidoAlert(context);
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: username,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Input your Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: password,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          logar(username.text, password.text, context);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
