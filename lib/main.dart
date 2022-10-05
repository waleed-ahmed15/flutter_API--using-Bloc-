import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsimplest/blocs/app_bloc.dart';
import 'package:flutterblocsimplest/blocs/app_events.dart';
import 'package:flutterblocsimplest/blocs/app_states.dart';
import 'package:flutterblocsimplest/models/user_model.dart';
import 'package:flutterblocsimplest/repos/repos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: Home(),
      ),
      // home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserDataLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserDataLoadedState) {
              List<UserModel> userlist = state.users;
              return ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(userlist[index].avatar!)),
                    title: Text(userlist[index].firstName!),
                    subtitle: Text(userlist[index].email!),
                  );
                },
              );
            } else if (state is DataErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            } else {
              return Text('data');
            }
          },
        ),
      ),
    );
  }
}
