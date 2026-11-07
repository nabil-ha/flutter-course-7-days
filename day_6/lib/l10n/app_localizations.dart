import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// BAK
  ///
  /// In en, this message translates to:
  /// **'BAK'**
  String get appName;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginUser.
  ///
  /// In en, this message translates to:
  /// **'Login User'**
  String get loginUser;

  /// No description provided for @loginClient.
  ///
  /// In en, this message translates to:
  /// **'Login Client'**
  String get loginClient;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @balanceRegular.
  ///
  /// In en, this message translates to:
  /// **'Balance SAR'**
  String get balanceRegular;

  /// No description provided for @totalRegular.
  ///
  /// In en, this message translates to:
  /// **'Total SAR'**
  String get totalRegular;

  /// No description provided for @totalCoupones.
  ///
  /// In en, this message translates to:
  /// **'Total Coupones'**
  String get totalCoupones;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @continueOrder.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueOrder;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @offlineTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline'**
  String get offlineTitle;

  /// No description provided for @offlineMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline, please check your connection'**
  String get offlineMessage;

  /// No description provided for @idNo.
  ///
  /// In en, this message translates to:
  /// **'Identification Number'**
  String get idNo;

  /// No description provided for @lowBalanceMessage.
  ///
  /// In en, this message translates to:
  /// **'Your balance is negative, are you sure you want to continue?'**
  String get lowBalanceMessage;

  /// No description provided for @sar.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get sar;

  /// No description provided for @orderWithNote.
  ///
  /// In en, this message translates to:
  /// **'Order and add a note'**
  String get orderWithNote;

  /// No description provided for @coupones.
  ///
  /// In en, this message translates to:
  /// **'Coupones'**
  String get coupones;

  /// No description provided for @coupone.
  ///
  /// In en, this message translates to:
  /// **'Coupone'**
  String get coupone;

  /// No description provided for @couponesCount.
  ///
  /// In en, this message translates to:
  /// **'Coupones Count'**
  String get couponesCount;

  /// No description provided for @regularSAR.
  ///
  /// In en, this message translates to:
  /// **'Regular SAR'**
  String get regularSAR;

  /// No description provided for @orderNo.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNo;

  /// No description provided for @errorWhileConnecting.
  ///
  /// In en, this message translates to:
  /// **'Error while requesting'**
  String get errorWhileConnecting;

  /// No description provided for @deliverOrder.
  ///
  /// In en, this message translates to:
  /// **'Deliver Order'**
  String get deliverOrder;

  /// No description provided for @order_received.
  ///
  /// In en, this message translates to:
  /// **'Order Received'**
  String get order_received;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @tapToExpand.
  ///
  /// In en, this message translates to:
  /// **'Tap to expand'**
  String get tapToExpand;

  /// No description provided for @tapToClose.
  ///
  /// In en, this message translates to:
  /// **'Tap to close'**
  String get tapToClose;

  /// No description provided for @onTheWay.
  ///
  /// In en, this message translates to:
  /// **'On the way'**
  String get onTheWay;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @errorWhileOrdering.
  ///
  /// In en, this message translates to:
  /// **'Error while ordering'**
  String get errorWhileOrdering;

  /// No description provided for @orderedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'The order has been placed successfully!'**
  String get orderedSuccessfully;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get currentLanguage;

  /// No description provided for @dateEditedToOutVacation.
  ///
  /// In en, this message translates to:
  /// **'Date has been edited to be out of vacation days.'**
  String get dateEditedToOutVacation;

  /// No description provided for @otherLanguage.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get otherLanguage;

  /// No description provided for @welcomeLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Please Log in'**
  String get welcomeLoginTitle;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLang;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Click i for more information'**
  String get searchHint;

  /// No description provided for @searchDialog.
  ///
  /// In en, this message translates to:
  /// **'You can search for:\norder name\nClient\'s name and phone\nSupervisor\'s Name\nAnd employees names.'**
  String get searchDialog;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @makeOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get makeOrder;

  /// No description provided for @carton.
  ///
  /// In en, this message translates to:
  /// **'Carton'**
  String get carton;

  /// No description provided for @galone.
  ///
  /// In en, this message translates to:
  /// **'Galone'**
  String get galone;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @editAddressImage.
  ///
  /// In en, this message translates to:
  /// **'Edit address image'**
  String get editAddressImage;

  /// No description provided for @buildingNo.
  ///
  /// In en, this message translates to:
  /// **'Building Number'**
  String get buildingNo;

  /// No description provided for @buildingImage.
  ///
  /// In en, this message translates to:
  /// **'Building Image'**
  String get buildingImage;

  /// No description provided for @noImage.
  ///
  /// In en, this message translates to:
  /// **'No Image'**
  String get noImage;

  /// No description provided for @useAddressLink.
  ///
  /// In en, this message translates to:
  /// **'Use Address link'**
  String get useAddressLink;

  /// No description provided for @editAvatar.
  ///
  /// In en, this message translates to:
  /// **'Edit avatar'**
  String get editAvatar;

  /// No description provided for @addressImageEditedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address image edited successfully'**
  String get addressImageEditedSuccessfully;

  /// No description provided for @failedEditAddressImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to edit address image'**
  String get failedEditAddressImage;

  /// No description provided for @clients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get clients;

  /// No description provided for @lastOperations.
  ///
  /// In en, this message translates to:
  /// **'Last Operations'**
  String get lastOperations;

  /// No description provided for @noOperationsYet.
  ///
  /// In en, this message translates to:
  /// **'There is no operations yet'**
  String get noOperationsYet;

  /// No description provided for @deliverWithoutChange.
  ///
  /// In en, this message translates to:
  /// **'Deliver order without changing items'**
  String get deliverWithoutChange;

  /// No description provided for @changeOrderItems.
  ///
  /// In en, this message translates to:
  /// **'Change order items'**
  String get changeOrderItems;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @tenderedRegular.
  ///
  /// In en, this message translates to:
  /// **'Tendered Regular'**
  String get tenderedRegular;

  /// No description provided for @tenderedCoupones.
  ///
  /// In en, this message translates to:
  /// **'Tendered Coupones'**
  String get tenderedCoupones;

  /// No description provided for @productAlreadyChosen.
  ///
  /// In en, this message translates to:
  /// **'This product was already chosen.'**
  String get productAlreadyChosen;

  /// No description provided for @addTransaction.
  ///
  /// In en, this message translates to:
  /// **'Add or Subtract Transaction'**
  String get addTransaction;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Balance Edit'**
  String get transaction;

  /// No description provided for @addAvatar.
  ///
  /// In en, this message translates to:
  /// **'Add avatar'**
  String get addAvatar;

  /// No description provided for @useMaps.
  ///
  /// In en, this message translates to:
  /// **'Use Maps'**
  String get useMaps;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartment;

  /// No description provided for @balanceCoupones.
  ///
  /// In en, this message translates to:
  /// **'Coupones Balance'**
  String get balanceCoupones;

  /// No description provided for @currentRegularBalance.
  ///
  /// In en, this message translates to:
  /// **'Current SAR Balance'**
  String get currentRegularBalance;

  /// No description provided for @currentCouponesBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Coupones Balance'**
  String get currentCouponesBalance;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter username'**
  String get enterUsername;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgetPassword;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'back'**
  String get back;

  /// No description provided for @restorePass.
  ///
  /// In en, this message translates to:
  /// **'Restore password'**
  String get restorePass;

  /// No description provided for @addUrEmailText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we will send an OTP to reset your password '**
  String get addUrEmailText;

  /// No description provided for @whenYouCanOrder.
  ///
  /// In en, this message translates to:
  /// **'You can order from 12 AM till 8 PM'**
  String get whenYouCanOrder;

  /// No description provided for @newOrder.
  ///
  /// In en, this message translates to:
  /// **'New Order'**
  String get newOrder;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'CASH'**
  String get cash;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'CARD'**
  String get card;

  /// No description provided for @pleaseChooseItems.
  ///
  /// In en, this message translates to:
  /// **'Please choose items'**
  String get pleaseChooseItems;

  /// No description provided for @reOrder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reOrder;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @editOrder.
  ///
  /// In en, this message translates to:
  /// **'Edit Order'**
  String get editOrder;

  /// No description provided for @addressInfo.
  ///
  /// In en, this message translates to:
  /// **'Address Info'**
  String get addressInfo;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @editClient.
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get editClient;

  /// No description provided for @isPaidInFullRegular.
  ///
  /// In en, this message translates to:
  /// **'Is total amount paid in full?'**
  String get isPaidInFullRegular;

  /// No description provided for @isPaidInFullCoupones.
  ///
  /// In en, this message translates to:
  /// **'Is total coupones paid in full?'**
  String get isPaidInFullCoupones;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enterEmail;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM'**
  String get confirm;

  /// No description provided for @sendMeCode.
  ///
  /// In en, this message translates to:
  /// **'Send me code'**
  String get sendMeCode;

  /// No description provided for @addNewPass.
  ///
  /// In en, this message translates to:
  /// **'Add a new password'**
  String get addNewPass;

  /// No description provided for @confirmNewPass.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM NEW PASSWORD'**
  String get confirmNewPass;

  /// No description provided for @bak.
  ///
  /// In en, this message translates to:
  /// **'BAK'**
  String get bak;

  /// No description provided for @team.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get team;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @supervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get supervisor;

  /// No description provided for @client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get client;

  /// No description provided for @riyadh.
  ///
  /// In en, this message translates to:
  /// **'Riyadh'**
  String get riyadh;

  /// No description provided for @jeddah.
  ///
  /// In en, this message translates to:
  /// **'Jeddah'**
  String get jeddah;

  /// No description provided for @pleaseDontLeaveEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please don\'t leave the field empty'**
  String get pleaseDontLeaveEmpty;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @responsibles.
  ///
  /// In en, this message translates to:
  /// **'Technical Team'**
  String get responsibles;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @showRejection.
  ///
  /// In en, this message translates to:
  /// **'Show Rejection'**
  String get showRejection;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @admins.
  ///
  /// In en, this message translates to:
  /// **'Admins'**
  String get admins;

  /// No description provided for @managers.
  ///
  /// In en, this message translates to:
  /// **'Managers'**
  String get managers;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @teamMember.
  ///
  /// In en, this message translates to:
  /// **'Team member'**
  String get teamMember;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get edit;

  /// No description provided for @removeFromTheApp.
  ///
  /// In en, this message translates to:
  /// **'Remove From The App'**
  String get removeFromTheApp;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get enterFirstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get enterLastName;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @enterFirstAndLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter first & last name'**
  String get enterFirstAndLastName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @jopTitle.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get jopTitle;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get deleteUser;

  /// No description provided for @deleteMyAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteMyAccount;

  /// No description provided for @areYouSureDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get areYouSureDelete;

  /// No description provided for @areYouSureCancel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel?'**
  String get areYouSureCancel;

  /// No description provided for @cancelSubmit.
  ///
  /// In en, this message translates to:
  /// **'Cancel Submission'**
  String get cancelSubmit;

  /// No description provided for @pleaseCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection'**
  String get pleaseCheckConnection;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @dontLeaveAttachmentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please don\'t leave attachments empty.'**
  String get dontLeaveAttachmentsEmpty;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'order'**
  String get order;

  /// No description provided for @allowEmployeesContactClient.
  ///
  /// In en, this message translates to:
  /// **'Allow employees to contact client'**
  String get allowEmployeesContactClient;

  /// No description provided for @addAddressImage.
  ///
  /// In en, this message translates to:
  /// **'Add Address Image'**
  String get addAddressImage;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @acceptedWithComments.
  ///
  /// In en, this message translates to:
  /// **'Accepted with comments'**
  String get acceptedWithComments;

  /// No description provided for @acceptWithComments.
  ///
  /// In en, this message translates to:
  /// **'Accept with comments'**
  String get acceptWithComments;

  /// No description provided for @cancelComment.
  ///
  /// In en, this message translates to:
  /// **'Cancel Comment'**
  String get cancelComment;

  /// No description provided for @commentDate.
  ///
  /// In en, this message translates to:
  /// **'Comment Date'**
  String get commentDate;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @needsEdit.
  ///
  /// In en, this message translates to:
  /// **'Needs to be edited'**
  String get needsEdit;

  /// No description provided for @createorder.
  ///
  /// In en, this message translates to:
  /// **'Create order'**
  String get createorder;

  /// No description provided for @rejectDate.
  ///
  /// In en, this message translates to:
  /// **'Rejection Date'**
  String get rejectDate;

  /// No description provided for @submitDate.
  ///
  /// In en, this message translates to:
  /// **'Submission Date'**
  String get submitDate;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get both;

  /// No description provided for @orderType.
  ///
  /// In en, this message translates to:
  /// **'Order Type'**
  String get orderType;

  /// No description provided for @curtains.
  ///
  /// In en, this message translates to:
  /// **'Curtains'**
  String get curtains;

  /// No description provided for @matFix.
  ///
  /// In en, this message translates to:
  /// **'Mat fix'**
  String get matFix;

  /// No description provided for @addNewMember.
  ///
  /// In en, this message translates to:
  /// **'Add a new member'**
  String get addNewMember;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @currentorders.
  ///
  /// In en, this message translates to:
  /// **'Current orders'**
  String get currentorders;

  /// No description provided for @finishedorders.
  ///
  /// In en, this message translates to:
  /// **'Finished orders'**
  String get finishedorders;

  /// No description provided for @clientName.
  ///
  /// In en, this message translates to:
  /// **'Client Name'**
  String get clientName;

  /// No description provided for @deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get deadline;

  /// No description provided for @employeeName.
  ///
  /// In en, this message translates to:
  /// **'Employee Name'**
  String get employeeName;

  /// No description provided for @managerName.
  ///
  /// In en, this message translates to:
  /// **'Manager Name'**
  String get managerName;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'order details'**
  String get orderDetails;

  /// No description provided for @enterSubmitTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit Title'**
  String get enterSubmitTitle;

  /// No description provided for @submitDetails.
  ///
  /// In en, this message translates to:
  /// **'Submission Details'**
  String get submitDetails;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// No description provided for @hereGoesTheAddressLink.
  ///
  /// In en, this message translates to:
  /// **'Here goes the address link'**
  String get hereGoesTheAddressLink;

  /// No description provided for @editAccount.
  ///
  /// In en, this message translates to:
  /// **'EDIT ACCOUNT'**
  String get editAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @doYouWantToLeaveTheApp.
  ///
  /// In en, this message translates to:
  /// **'Do you want to leave the app?'**
  String get doYouWantToLeaveTheApp;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @editAccountInformation.
  ///
  /// In en, this message translates to:
  /// **'Edit account information'**
  String get editAccountInformation;

  /// No description provided for @editPass.
  ///
  /// In en, this message translates to:
  /// **'Edit password'**
  String get editPass;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @simplifiedordersReports.
  ///
  /// In en, this message translates to:
  /// **'Report About orders Status'**
  String get simplifiedordersReports;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No Notifications Yet'**
  String get noNotifications;

  /// No description provided for @writeMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message...'**
  String get writeMessage;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get count;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'Has been submitted'**
  String get submitted;

  /// No description provided for @addNeworder.
  ///
  /// In en, this message translates to:
  /// **'Add a new order'**
  String get addNeworder;

  /// No description provided for @orderName.
  ///
  /// In en, this message translates to:
  /// **'order Name'**
  String get orderName;

  /// No description provided for @enterorderName.
  ///
  /// In en, this message translates to:
  /// **'Enter order name'**
  String get enterorderName;

  /// No description provided for @enterorderDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter order details'**
  String get enterorderDetails;

  /// No description provided for @enterClientName.
  ///
  /// In en, this message translates to:
  /// **'Enter client name'**
  String get enterClientName;

  /// No description provided for @clientPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Client Phone Number'**
  String get clientPhoneNumber;

  /// No description provided for @enterClientPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter client phone number'**
  String get enterClientPhoneNumber;

  /// No description provided for @addressLink.
  ///
  /// In en, this message translates to:
  /// **'Address Link'**
  String get addressLink;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Locate your location on the map'**
  String get enterAddress;

  /// No description provided for @selectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Please Select District'**
  String get selectDistrict;

  /// No description provided for @pleaseAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Please Add an address to your profile'**
  String get pleaseAddAddress;

  /// No description provided for @errorPleaseContactCC.
  ///
  /// In en, this message translates to:
  /// **'An error happened, please contact the customer care'**
  String get errorPleaseContactCC;

  /// No description provided for @newVersionAvailable.
  ///
  /// In en, this message translates to:
  /// **'New version available!'**
  String get newVersionAvailable;

  /// No description provided for @updateYourApplication.
  ///
  /// In en, this message translates to:
  /// **'Update your application'**
  String get updateYourApplication;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @openLocation.
  ///
  /// In en, this message translates to:
  /// **'Open Location'**
  String get openLocation;

  /// No description provided for @addAttachment.
  ///
  /// In en, this message translates to:
  /// **'Add an Attachment'**
  String get addAttachment;

  /// No description provided for @areYouSureLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout ?'**
  String get areYouSureLogOut;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation Date'**
  String get creationDate;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get profileSettings;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @displaySettings.
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @showDetails.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get showDetails;

  /// No description provided for @createUser.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createUser;

  /// No description provided for @editUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUser;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get pleaseWait;

  /// No description provided for @selectPlace.
  ///
  /// In en, this message translates to:
  /// **'Choose Place'**
  String get selectPlace;

  /// No description provided for @addressImage.
  ///
  /// In en, this message translates to:
  /// **'Address Image'**
  String get addressImage;

  /// No description provided for @enterDeadline.
  ///
  /// In en, this message translates to:
  /// **'Enter deadline (dd-mm-yyyy)'**
  String get enterDeadline;

  /// No description provided for @selectorderType.
  ///
  /// In en, this message translates to:
  /// **'Select order type'**
  String get selectorderType;

  /// No description provided for @selectAnEmployee.
  ///
  /// In en, this message translates to:
  /// **'Select an employee'**
  String get selectAnEmployee;

  /// No description provided for @addAnotherEmployee.
  ///
  /// In en, this message translates to:
  /// **'Add another employee'**
  String get addAnotherEmployee;

  /// No description provided for @addorder.
  ///
  /// In en, this message translates to:
  /// **'Add order'**
  String get addorder;

  /// No description provided for @searchForASpecificorder.
  ///
  /// In en, this message translates to:
  /// **'Search for a specific order'**
  String get searchForASpecificorder;

  /// No description provided for @searchForAManager.
  ///
  /// In en, this message translates to:
  /// **'Search for a manager'**
  String get searchForAManager;

  /// No description provided for @searchForAnEmployee.
  ///
  /// In en, this message translates to:
  /// **'Search for an employee'**
  String get searchForAnEmployee;

  /// No description provided for @currentLocal.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get currentLocal;

  /// No description provided for @ontherLocal.
  ///
  /// In en, this message translates to:
  /// **'ar'**
  String get ontherLocal;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @addEmployee.
  ///
  /// In en, this message translates to:
  /// **'Add employee'**
  String get addEmployee;

  /// No description provided for @addManager.
  ///
  /// In en, this message translates to:
  /// **'Add Manager'**
  String get addManager;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'the field is required'**
  String get fieldRequired;

  /// No description provided for @selectEmployees.
  ///
  /// In en, this message translates to:
  /// **'Select Employees'**
  String get selectEmployees;

  /// No description provided for @selectSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Select Supervisor'**
  String get selectSupervisor;

  /// No description provided for @selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select order Date'**
  String get selectDateRange;

  /// No description provided for @rejectDetails.
  ///
  /// In en, this message translates to:
  /// **'Rejection Details'**
  String get rejectDetails;

  /// No description provided for @attachPhoto.
  ///
  /// In en, this message translates to:
  /// **'Attach an image'**
  String get attachPhoto;

  /// No description provided for @addorderToast.
  ///
  /// In en, this message translates to:
  /// **'Make sure to specify the site image, the site link, and specify at least one employee for the order'**
  String get addorderToast;

  /// No description provided for @employeeNotes.
  ///
  /// In en, this message translates to:
  /// **'Employee notes'**
  String get employeeNotes;

  /// No description provided for @managerNote.
  ///
  /// In en, this message translates to:
  /// **'Manager notes'**
  String get managerNote;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @waitingForAcception.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Acception'**
  String get waitingForAcception;

  /// No description provided for @waitingForSubmitting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Submission'**
  String get waitingForSubmitting;

  /// No description provided for @processingorder.
  ///
  /// In en, this message translates to:
  /// **'The order is being processed'**
  String get processingorder;

  /// No description provided for @orderProcessed.
  ///
  /// In en, this message translates to:
  /// **'Done processing this order'**
  String get orderProcessed;

  /// No description provided for @chooseorderStatus.
  ///
  /// In en, this message translates to:
  /// **'Choose order Status'**
  String get chooseorderStatus;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @refuse.
  ///
  /// In en, this message translates to:
  /// **'Refuse'**
  String get refuse;

  /// No description provided for @rejectorder.
  ///
  /// In en, this message translates to:
  /// **'Reject a order'**
  String get rejectorder;

  /// No description provided for @cancelReject.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reject'**
  String get cancelReject;

  /// No description provided for @rejectReason.
  ///
  /// In en, this message translates to:
  /// **'Rejection reason'**
  String get rejectReason;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @selectReason.
  ///
  /// In en, this message translates to:
  /// **'Select reason'**
  String get selectReason;

  /// No description provided for @chooseContactMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Contact Method'**
  String get chooseContactMethod;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @refuseDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get refuseDetails;

  /// No description provided for @enterDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter details'**
  String get enterDetails;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @makeorderAsDone.
  ///
  /// In en, this message translates to:
  /// **'Approve the order as done'**
  String get makeorderAsDone;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get selected;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @submitorder.
  ///
  /// In en, this message translates to:
  /// **'Submit order'**
  String get submitorder;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @addTeamMember.
  ///
  /// In en, this message translates to:
  /// **'Add team member'**
  String get addTeamMember;

  /// No description provided for @uploadPictures.
  ///
  /// In en, this message translates to:
  /// **'Upload pictures of the work'**
  String get uploadPictures;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'new password'**
  String get newPassword;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'old password'**
  String get oldPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @enterOldPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your old password'**
  String get enterOldPassword;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add a note here'**
  String get addNote;

  /// No description provided for @editEmployeeAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit Employee Account'**
  String get editEmployeeAccount;

  /// No description provided for @editManagerAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit Manager Account'**
  String get editManagerAccount;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @employeePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Employee Phone Number'**
  String get employeePhoneNumber;

  /// No description provided for @managerPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Manager Phone Number'**
  String get managerPhoneNumber;

  /// No description provided for @orderImages.
  ///
  /// In en, this message translates to:
  /// **'order Images'**
  String get orderImages;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @enterStartDate.
  ///
  /// In en, this message translates to:
  /// **'Enter Start Date'**
  String get enterStartDate;

  /// No description provided for @deadlineErrorToast.
  ///
  /// In en, this message translates to:
  /// **'The date must be a date after Start Date'**
  String get deadlineErrorToast;

  /// No description provided for @enterYourCity.
  ///
  /// In en, this message translates to:
  /// **'Enter Your City'**
  String get enterYourCity;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @enterYourCountry.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Country'**
  String get enterYourCountry;

  /// No description provided for @addNeworderType.
  ///
  /// In en, this message translates to:
  /// **'Add New order Type'**
  String get addNeworderType;

  /// No description provided for @pleaseEnterYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get pleaseEnterYourNewPassword;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @startDelivery.
  ///
  /// In en, this message translates to:
  /// **'Start delivery'**
  String get startDelivery;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
