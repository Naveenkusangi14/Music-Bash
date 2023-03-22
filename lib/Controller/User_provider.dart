import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:spotify/Databasehelper/Auth_Helper.dart';

List <SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => AuthHelper(),
  lazy: false,
  )
];