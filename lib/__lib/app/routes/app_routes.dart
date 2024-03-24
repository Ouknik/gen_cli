part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ROOT = _Paths.ROOT;
  static const SPALSH_SCREEN = _Paths.SPALSH_SCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const CARTS = _Paths.CARTS;
/*Routes*/
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ROOT = '/root';
  static const SPALSH_SCREEN = '/spalsh-screen';
  static const LOGIN = '/login';
  static const CARTS = '/carts';
  /*_Paths*/
}
