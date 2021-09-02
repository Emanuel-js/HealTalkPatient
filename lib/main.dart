import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'index.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt('initScreen');
  await pref.setInt('initScreen', 1);

  runApp(HealTalk());
}

final auth = FirebaseAuth.instance;
final userCur = auth.currentUser;

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<Patient>(
            create: (_) => FirebaseApi().patient,
            initialData: null,
          ),
          StreamProvider<List<Doctor>>(
            create: (_) => DoctorData().getdoctor(),
            initialData: null,
          ),
          StreamProvider<Request>(
            create: (_) => RequestApi().request,
            initialData: null,
          ),
          StreamProvider<List<Message>>(
            create: (_) => FirebaseApi().getMessagesfromuser(),
            initialData: null,
          ),
        ],
        child: MaterialApp(
            theme: AppTheme.define(),
            debugShowCheckedModeBanner: false,
            home: pageControll()));
  }

  Widget pageControll() {
    if (initScreen == 0 || initScreen == null) {
      return IntroScreen1();
    }
    if (userCur?.emailVerified == true && userCur != null) {
      userCur.reload();
      return HomeScreen1();
    } else {
      return FirstScreen();
    }
  }
}
