// import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';

// import '../widgets/page_loader.dart';

// class AppRouter {
//   static final router = FluroRouter();
//   static String initialRoute = "/home";

//   static final GlobalKey<NavigatorState> globalNavigatorKey =
//       GlobalKey<NavigatorState>();

//   static Future<dynamic> navigateTo(String routeName) {
//     return globalNavigatorKey.currentState!.pushNamed(routeName);
//   }

//   static goBack() {
//     return globalNavigatorKey.currentState!.pop();
//   }

//   static Handler pageLoaderHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return const PageLoader();
//     },
//   );

//   static Handler loginHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Login();
//     },
//   );

//   static Handler forgotPasswordHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return ForgotPassword();
//     },
//   );

//   static Handler accomodationHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Accomodation();
//     },
//   );

//   static Handler profileHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Profile();
//     },
//   );

//   static Handler postedPersonProfileHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return PostedPersonProfile(params: params);
//     },
//   );

//   static Handler homeHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Home();
//     },
//   );

//   static Handler registerHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Register();
//     },
//   );

//   static Handler otpVerificationHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return OtpVerification();
//     },
//   );

//   static Handler aboutHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return About();
//     },
//   );

//   static Handler jobHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Jobs();
//     },
//   );

//   static Handler contactHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Contact();
//     },
//   );

//   static Handler approvedItemHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return ApprovedItems(
//         params: params,
//       );
//     },
//   );

//   static Handler singleBestOfferHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleBestOffer(params: params);
//     },
//   );

//   static Handler newItemHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return NewItem();
//     },
//   );

//   static Handler singleRestaurantHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleRestaurant();
//     },
//   );

//   static Handler restaurantsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Restaurants();
//     },
//   );

//   static Handler cartHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Cart();
//     },
//   );

//   static Handler completeOrderHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return CompleteOrder();
//     },
//   );

//   static Handler businessDirectoryHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return BusinessDirectory();
//     },
//   );

//   static Handler singleBusinessDirectoryHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleBusinessDirectory(
//         params: params,
//       );
//     },
//   );

//   static Handler selectPaymentMethodHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SelectPaymentMethod();
//     },
//   );

//   static Handler editPaymentMethodHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return EditPaymentMethod();
//     },
//   );

//   static Handler addPaymentMethodHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return AddPaymentMethod();
//     },
//   );

//   static Handler newItemSaleHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return NewItemSale();
//     },
//   );

//   static Handler editProfileHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return EditProfile();
//     },
//   );

//   static Handler singleAccomodationHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleAccomodation(params: params);
//     },
//   );

//   static Handler approvedFillFormHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return ApprovedFillForm();
//     },
//   );

//   static Handler jobOfferFillFormHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return JobOfferFillForm();
//     },
//   );

//   static Handler serviceHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return ServiceView();
//     },
//   );

//   static Handler bestOfferHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return BestOffer();
//     },
//   );

//   static Handler newBestOfferHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return NewBestOffer();
//     },
//   );

//   static Handler singleServiceViewHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleServiceView(
//         params: params,
//       );
//     },
//   );

//   static Handler serviceFillFormHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return ServiceFillForm();
//     },
//   );

//   static Handler carsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return Cars();
//     },
//   );

//   static Handler singleCarHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleCar(
//         params: params,
//       );
//     },
//   );

//   static Handler carFillFormHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return CarFillForm();
//     },
//   );

//   static Handler commercialPropertyHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return CommercialProperty();
//     },
//   );

//   static Handler singleCommercialPropertyHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return SingleCommercialProperty(
//         params: params,
//       );
//     },
//   );

//   static Handler commericalPropertyFormHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//       return CommercialPropertyFill();
//     },
//   );

//   static void defineRoutes(FluroRouter router) {
//     router.define("/", handler: loginHandler);
//     router.define("/loader", handler: pageLoaderHandler);
//     router.define("/profile", handler: profileHandler);
//     router.define("/profile/:id", handler: postedPersonProfileHandler);
//     router.define("/home", handler: homeHandler);
//     router.define("/forgot_password", handler: forgotPasswordHandler);
//     router.define("/register", handler: registerHandler);
//     router.define("/best_offer", handler: bestOfferHandler);
//     router.define("/new_best_offer", handler: newBestOfferHandler);
//     router.define("/otp_verification", handler: otpVerificationHandler);
//     router.define("/about", handler: aboutHandler);
//     router.define("/jobs", handler: jobHandler);
//     router.define("/contact", handler: contactHandler);
//     router.define("/approved_items/:id/:group", handler: approvedItemHandler);
//     router.define(
//       "/single_best_offer/:id/:group",
//       handler: singleBestOfferHandler,
//     );
//     router.define("/new_item", handler: newItemHandler);
//     router.define("/restaurants", handler: restaurantsHandler);
//     router.define("/single_restaurant", handler: singleRestaurantHandler);
//     router.define("/cart", handler: cartHandler);
//     router.define("/complete_order", handler: completeOrderHandler);
//     router.define("/business_directory", handler: businessDirectoryHandler);
//     router.define("/accomodation", handler: accomodationHandler);
//     router.define(
//       "/single_accomodation/:id/:group",
//       handler: singleAccomodationHandler,
//     );
//     router.define("/approved_fill_form", handler: approvedFillFormHandler);
//     router.define("/service", handler: serviceHandler);
//     router.define("/single_service_view/:id/:group",
//         handler: singleServiceViewHandler);
//     router.define("/service_fill_form", handler: serviceFillFormHandler);
//     router.define("/cars", handler: carsHandler);
//     router.define("/single_car/:id/:group", handler: singleCarHandler);
//     router.define("/car_fill_form", handler: carFillFormHandler);
//     router.define("/commercial_property", handler: commercialPropertyHandler);
//     router.define("/commercial_property_form",
//         handler: commericalPropertyFormHandler);
//     router.define("/single_commercial_property/:id/:group",
//         handler: singleCommercialPropertyHandler);
//     router.define(
//       "/single_business_directory/:id/:group",
//       handler: singleBusinessDirectoryHandler,
//     );
//     router.define(
//       "/select_payment_method",
//       handler: selectPaymentMethodHandler,
//     );
//     router.define(
//       "/edit_payment_method",
//       handler: editPaymentMethodHandler,
//     );
//     router.define(
//       "/add_payment_method",
//       handler: addPaymentMethodHandler,
//     );
//     router.define(
//       "/new_item_sale",
//       handler: newItemSaleHandler,
//     );
//     router.define(
//       "/edit_profile",
//       handler: editProfileHandler,
//     );
//     router.define(
//       "/job_offer_form",
//       handler: jobOfferFillFormHandler,
//     );
//   }
// }