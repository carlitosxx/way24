// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $signInRoute,
  $signUpRoute,
  $phoneNumberRegisterRouter,
  $onBoardingRoute,
  $forgotPasswordRoute,
  $verifyOtpRoute,
  $createNewPasswordRoute,
  $homeRoute,
  $detailCrewRoute,
  $crewTrackingRoute,
  $updateProfileDataRoute,
  $menuHomeRoute,
  $myPurchasesRoute,
  $cartRoute,
  $packageTouristRoute,
  $siteTouristRoute,
  $mapRoute,
];

RouteBase get $splashRoute =>
    GoRouteData.$route(path: '/splash', factory: _$SplashRoute._fromState);

mixin _$SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signInRoute =>
    GoRouteData.$route(path: '/sign-in', factory: _$SignInRoute._fromState);

mixin _$SignInRoute on GoRouteData {
  static SignInRoute _fromState(GoRouterState state) => SignInRoute();

  @override
  String get location => GoRouteData.$location('/sign-in');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpRoute =>
    GoRouteData.$route(path: '/sign-up', factory: _$SignUpRoute._fromState);

mixin _$SignUpRoute on GoRouteData {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute();

  @override
  String get location => GoRouteData.$location('/sign-up');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $phoneNumberRegisterRouter => GoRouteData.$route(
  path: '/phone-number-register',

  factory: _$PhoneNumberRegisterRouter._fromState,
);

mixin _$PhoneNumberRegisterRouter on GoRouteData {
  static PhoneNumberRegisterRouter _fromState(GoRouterState state) =>
      PhoneNumberRegisterRouter();

  @override
  String get location => GoRouteData.$location('/phone-number-register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onBoardingRoute => GoRouteData.$route(
  path: '/onboarding',

  factory: _$OnBoardingRoute._fromState,
);

mixin _$OnBoardingRoute on GoRouteData {
  static OnBoardingRoute _fromState(GoRouterState state) => OnBoardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
  path: '/forgot-password',

  factory: _$ForgotPasswordRoute._fromState,
);

mixin _$ForgotPasswordRoute on GoRouteData {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      ForgotPasswordRoute();

  @override
  String get location => GoRouteData.$location('/forgot-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $verifyOtpRoute => GoRouteData.$route(
  path: '/verify-otp/:email',

  factory: _$VerifyOtpRoute._fromState,
);

mixin _$VerifyOtpRoute on GoRouteData {
  static VerifyOtpRoute _fromState(GoRouterState state) => VerifyOtpRoute(
    email: state.pathParameters['email']!,
    typeVerify: state.uri.queryParameters['type-verify']!,
  );

  VerifyOtpRoute get _self => this as VerifyOtpRoute;

  @override
  String get location => GoRouteData.$location(
    '/verify-otp/${Uri.encodeComponent(_self.email)}',
    queryParams: {'type-verify': _self.typeVerify},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createNewPasswordRoute => GoRouteData.$route(
  path: '/create-new-password',

  factory: _$CreateNewPasswordRoute._fromState,
);

mixin _$CreateNewPasswordRoute on GoRouteData {
  static CreateNewPasswordRoute _fromState(GoRouterState state) =>
      CreateNewPasswordRoute();

  @override
  String get location => GoRouteData.$location('/create-new-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/home', factory: _$HomeRoute._fromState);

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailCrewRoute => GoRouteData.$route(
  path: '/detail-crew/:id',

  factory: _$DetailCrewRoute._fromState,
);

mixin _$DetailCrewRoute on GoRouteData {
  static DetailCrewRoute _fromState(GoRouterState state) =>
      DetailCrewRoute(id: state.pathParameters['id']!);

  DetailCrewRoute get _self => this as DetailCrewRoute;

  @override
  String get location =>
      GoRouteData.$location('/detail-crew/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $crewTrackingRoute => GoRouteData.$route(
  path: '/crew-tracking',

  factory: _$CrewTrackingRoute._fromState,
);

mixin _$CrewTrackingRoute on GoRouteData {
  static CrewTrackingRoute _fromState(GoRouterState state) =>
      CrewTrackingRoute();

  @override
  String get location => GoRouteData.$location('/crew-tracking');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $updateProfileDataRoute => GoRouteData.$route(
  path: '/update-profile-data',

  factory: _$UpdateProfileDataRoute._fromState,
);

mixin _$UpdateProfileDataRoute on GoRouteData {
  static UpdateProfileDataRoute _fromState(GoRouterState state) =>
      UpdateProfileDataRoute();

  @override
  String get location => GoRouteData.$location('/update-profile-data');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $menuHomeRoute =>
    GoRouteData.$route(path: '/menu-home', factory: _$MenuHomeRoute._fromState);

mixin _$MenuHomeRoute on GoRouteData {
  static MenuHomeRoute _fromState(GoRouterState state) => MenuHomeRoute();

  @override
  String get location => GoRouteData.$location('/menu-home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $myPurchasesRoute => GoRouteData.$route(
  path: '/my-purchases',

  factory: _$MyPurchasesRoute._fromState,
);

mixin _$MyPurchasesRoute on GoRouteData {
  static MyPurchasesRoute _fromState(GoRouterState state) => MyPurchasesRoute();

  @override
  String get location => GoRouteData.$location('/my-purchases');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cartRoute =>
    GoRouteData.$route(path: '/cart', factory: _$CartRoute._fromState);

mixin _$CartRoute on GoRouteData {
  static CartRoute _fromState(GoRouterState state) => CartRoute();

  @override
  String get location => GoRouteData.$location('/cart');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $packageTouristRoute => GoRouteData.$route(
  path: '/package-tourist/:idPackageTourist',

  factory: _$PackageTouristRoute._fromState,
);

mixin _$PackageTouristRoute on GoRouteData {
  static PackageTouristRoute _fromState(GoRouterState state) =>
      PackageTouristRoute(
        idPackageTourist: state.pathParameters['idPackageTourist']!,
      );

  PackageTouristRoute get _self => this as PackageTouristRoute;

  @override
  String get location => GoRouteData.$location(
    '/package-tourist/${Uri.encodeComponent(_self.idPackageTourist)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $siteTouristRoute => GoRouteData.$route(
  path: '/site-tourist',

  factory: _$SiteTouristRoute._fromState,
);

mixin _$SiteTouristRoute on GoRouteData {
  static SiteTouristRoute _fromState(GoRouterState state) =>
      SiteTouristRoute(touristSite: state.uri.queryParameters['tourist-site']!);

  SiteTouristRoute get _self => this as SiteTouristRoute;

  @override
  String get location => GoRouteData.$location(
    '/site-tourist',
    queryParams: {'tourist-site': _self.touristSite},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mapRoute => GoRouteData.$route(
  path: '/map/:latitude/:longitude',

  factory: _$MapRoute._fromState,
);

mixin _$MapRoute on GoRouteData {
  static MapRoute _fromState(GoRouterState state) => MapRoute(
    latitude: double.parse(state.pathParameters['latitude']!)!,
    longitude: double.parse(state.pathParameters['longitude']!)!,
  );

  MapRoute get _self => this as MapRoute;

  @override
  String get location => GoRouteData.$location(
    '/map/${Uri.encodeComponent(_self.latitude.toString())}/${Uri.encodeComponent(_self.longitude.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
