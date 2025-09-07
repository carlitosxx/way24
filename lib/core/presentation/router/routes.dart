import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:way24/features/auth/presentation/views/phone/create_new_password.view.dart';
import 'package:way24/features/auth/presentation/views/phone/forgot_password.view.dart';
import 'package:way24/features/auth/presentation/views/phone/phone_number_register.view.dart';
import 'package:way24/features/auth/presentation/views/phone/sign_in.view.dart';
import 'package:way24/features/auth/presentation/views/phone/sign_up.view.dart';
import 'package:way24/features/auth/presentation/views/phone/splash.view.dart';
import 'package:way24/features/auth/presentation/views/phone/verify_otp.view.dart';
import 'package:way24/features/checkout/presentation/views/phone/cart.view.dart';
import 'package:way24/features/home/presentation/views/phone/crew_tracking.view.dart';
import 'package:way24/features/home/presentation/views/phone/detail_crew.view.dart';
import 'package:way24/features/home/presentation/views/phone/home.view.dart';
import 'package:way24/features/home/presentation/views/phone/menu_home.view.dart';
import 'package:way24/features/onboarding/presentation/views/phone/onboarding.view.dart';
import 'package:way24/features/orders/presentation/views/phone/my_purchases.view.dart';
import 'package:way24/features/profile/presentation/views/phone/update_profile_data.view.dart';
import 'package:way24/features/tourist/presentation/views/phone/map.view.dart';
import 'package:way24/features/tourist/presentation/views/phone/pack_tourist.view.dart';
import 'package:way24/features/tourist/presentation/views/phone/site_tourist.view.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
/// Route Splash
class SplashRoute extends GoRouteData with _$SplashRoute {
  /// splash string path
  static const path = '/splash';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPhoneView();
  }
}

@TypedGoRoute<SignInRoute>(path: SignInRoute.path)
/// Route Sign In
class SignInRoute extends GoRouteData with _$SignInRoute {
  /// sign-in string path
  static const path = '/sign-in';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPhoneView();
  }
}

@TypedGoRoute<SignUpRoute>(path: SignUpRoute.path)
/// Route Sign up
class SignUpRoute extends GoRouteData with _$SignUpRoute {
  /// sign-up path
  static const path = '/sign-up';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPhoneView();
  }
}

@TypedGoRoute<PhoneNumberRegisterRouter>(path: PhoneNumberRegisterRouter.path)
/// Route Sign up
class PhoneNumberRegisterRouter extends GoRouteData
    with _$PhoneNumberRegisterRouter {
  /// sign-up path
  static const path = '/phone-number-register';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PhoneNumberRegisterView();
  }
}

@TypedGoRoute<OnBoardingRoute>(path: OnBoardingRoute.path)
/// update profile data
class OnBoardingRoute extends GoRouteData with _$OnBoardingRoute {
  /// path
  static const path = '/onboarding';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnBoardingPhoneView();
  }
}

@TypedGoRoute<ForgotPasswordRoute>(path: ForgotPasswordRoute.path)
/// Route Forgot password
class ForgotPasswordRoute extends GoRouteData with _$ForgotPasswordRoute {
  /// Forgot path
  static const path = '/forgot-password';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPhoneView();
  }
}

@TypedGoRoute<VerifyOtpRoute>(path: '${VerifyOtpRoute.path}/:email')
/// Route verify otp
class VerifyOtpRoute extends GoRouteData with _$VerifyOtpRoute {
  /// Route verify otp
  VerifyOtpRoute({required this.email, required this.typeVerify});

  /// Parameter email
  final String email;

  /// Parameter type verify
  final String typeVerify;

  /// Forgot string path
  static const path = '/verify-otp';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return VerifyOtpCodePhoneView(email: email, typeVerify: typeVerify);
  }
}

@TypedGoRoute<CreateNewPasswordRoute>(path: CreateNewPasswordRoute.path)
/// Route Forgot password
class CreateNewPasswordRoute extends GoRouteData with _$CreateNewPasswordRoute {
  /// Forgot string path
  static const path = '/create-new-password';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateNewPasswordPhoneView();
  }
}

//=========HOME==========
@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
/// Home
class HomeRoute extends GoRouteData with _$HomeRoute {
  /// home path
  static const path = '/home';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePhoneView();
  }
}

//========= DETAIL CREW==========
@TypedGoRoute<DetailCrewRoute>(path: '${DetailCrewRoute.path}/:id')
/// Route crew
class DetailCrewRoute extends GoRouteData with _$DetailCrewRoute {
  /// Route verify otp
  DetailCrewRoute({required this.id});

  /// Parameter id
  final String id;

  /// Forgot string path
  static const path = '/detail-crew';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailCrewPhoneView(id: id);
  }
}

//========= CREW TRACKING==========
@TypedGoRoute<CrewTrackingRoute>(path: CrewTrackingRoute.path)
/// Route crew tracking
class CrewTrackingRoute extends GoRouteData with _$CrewTrackingRoute {
  /// crew tracking string path
  static const path = '/crew-tracking';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CrewTrackingPhoneView();
  }
}

//========= UPDATE PROFILE DATA==========
@TypedGoRoute<UpdateProfileDataRoute>(path: UpdateProfileDataRoute.path)
/// update profile data
class UpdateProfileDataRoute extends GoRouteData with _$UpdateProfileDataRoute {
  /// path
  static const path = '/update-profile-data';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpdateProfileDataPhoneView();
  }
}

//========= MENU HOME==========
@TypedGoRoute<MenuHomeRoute>(path: MenuHomeRoute.path)
/// Menu home
class MenuHomeRoute extends GoRouteData with _$MenuHomeRoute {
  /// path
  static const path = '/menu-home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      opaque: false,
      transitionDuration: const Duration(milliseconds: 100),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      child: const MenuHomePhoneView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInToLinear,
          ),
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<MyPurchasesRoute>(path: MyPurchasesRoute.path)
/// My purchases
class MyPurchasesRoute extends GoRouteData with _$MyPurchasesRoute {
  /// path
  static const path = '/my-purchases';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyPurchasesPhoneView();
  }
}

@TypedGoRoute<CartRoute>(path: CartRoute.path)
/// My purchases
class CartRoute extends GoRouteData with _$CartRoute {
  /// path
  static const path = '/cart';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartPhoneView();
  }
}

@TypedGoRoute<PackageTouristRoute>(
  path: '${PackageTouristRoute.path}/:idPackageTourist',
)
/// Route package tourist
class PackageTouristRoute extends GoRouteData with _$PackageTouristRoute {
  /// Route verify otp
  PackageTouristRoute({required this.idPackageTourist});

  /// Parameter id package tourist
  final String idPackageTourist;

  /// packages string path
  static const path = '/package-tourist';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PackageTouristPhoneView(idPackageTourist: idPackageTourist);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: build(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.easeOut;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

@TypedGoRoute<SiteTouristRoute>(path: SiteTouristRoute.path)
/// Site tourist
class SiteTouristRoute extends GoRouteData with _$SiteTouristRoute {
  /// Site tourist
  SiteTouristRoute({required this.touristSite});

  /// Parameter id package tourist
  final String touristSite;

  /// path
  static const path = '/site-tourist';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SiteTouristPhoneView(touristSite: touristSite);
  }
}

@TypedGoRoute<MapRoute>(path: '${MapRoute.path}/:latitude/:longitude')
/// Site tourist
class MapRoute extends GoRouteData with _$MapRoute {
  /// Site tourist
  MapRoute({required this.latitude, required this.longitude});

  /// Parameter latitude
  final double latitude;

  /// Parameter id package tourist
  final double longitude;

  /// path
  static const path = '/map';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MapPhoneView(latitude: latitude, longitude: longitude);
  }
}
