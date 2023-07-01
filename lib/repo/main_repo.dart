import 'package:react_example/services/main_service.dart';

import '../widgets/custom_error.dart';

class MainRepo {
  final MainService mainServices;
  MainRepo({
    required this.mainServices,
  });

  Future loginUser(String mail, String pass) async {
    try {
      final userData = await mainServices.login(mail, pass);

      return userData;
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }
}
