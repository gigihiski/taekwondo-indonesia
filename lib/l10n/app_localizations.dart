import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @whatsapp_login_instruction.
  ///
  /// In en, this message translates to:
  /// **'Insert your Whatsapp number'**
  String get whatsapp_login_instruction;

  /// No description provided for @password_login_instruction.
  ///
  /// In en, this message translates to:
  /// **'Insert your password'**
  String get password_login_instruction;

  /// No description provided for @name_registration_instruction.
  ///
  /// In en, this message translates to:
  /// **'Insert your name'**
  String get name_registration_instruction;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @logout_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logout_confirmation;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get proceed;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @go_to_home_page.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get go_to_home_page;

  /// No description provided for @registration_success.
  ///
  /// In en, this message translates to:
  /// **'Registration Success'**
  String get registration_success;

  /// No description provided for @other_login_option.
  ///
  /// In en, this message translates to:
  /// **'or login with'**
  String get other_login_option;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Dont have an account?'**
  String get dont_have_account;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @login_failed.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get login_failed;

  /// No description provided for @registration_failed.
  ///
  /// In en, this message translates to:
  /// **'Registration Failed'**
  String get registration_failed;

  /// No description provided for @registration_success_message.
  ///
  /// In en, this message translates to:
  /// **'Thank you for joining Kampoeng Steak!'**
  String get registration_success_message;

  /// No description provided for @acceptance_terms_conditions_agreement.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions should be accepted'**
  String get acceptance_terms_conditions_agreement;

  /// No description provided for @registration_agreement_checkbox.
  ///
  /// In en, this message translates to:
  /// **'I agree to Kampoeng Steak\'s terms of service and privacy policy.'**
  String get registration_agreement_checkbox;

  /// No description provided for @other_registration_option.
  ///
  /// In en, this message translates to:
  /// **'or register with'**
  String get other_registration_option;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @login_here.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get login_here;

  /// No description provided for @account_verification.
  ///
  /// In en, this message translates to:
  /// **'Account Verification'**
  String get account_verification;

  /// No description provided for @otp_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP code that was sent to Whatsapp you'**
  String get otp_instruction;

  /// No description provided for @code_ends_in.
  ///
  /// In en, this message translates to:
  /// **'The code ends in'**
  String get code_ends_in;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the code?'**
  String get didnt_receive_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resend_code;

  /// No description provided for @nearest_outlet.
  ///
  /// In en, this message translates to:
  /// **'Nearest outlet'**
  String get nearest_outlet;

  /// No description provided for @reward_login_instruction.
  ///
  /// In en, this message translates to:
  /// **'Login and start collecting points'**
  String get reward_login_instruction;

  /// No description provided for @flash_sale.
  ///
  /// In en, this message translates to:
  /// **'Flash sale'**
  String get flash_sale;

  /// No description provided for @flash_sale_terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Valid for 1x purchase'**
  String get flash_sale_terms_and_conditions;

  /// No description provided for @ends_in.
  ///
  /// In en, this message translates to:
  /// **'Ends in'**
  String get ends_in;

  /// No description provided for @discount_and_voucher.
  ///
  /// In en, this message translates to:
  /// **'Discount & Voucher'**
  String get discount_and_voucher;

  /// No description provided for @new_menu.
  ///
  /// In en, this message translates to:
  /// **'New Menu'**
  String get new_menu;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// No description provided for @today_deals.
  ///
  /// In en, this message translates to:
  /// **'Today Deals'**
  String get today_deals;

  /// No description provided for @foods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get foods;

  /// No description provided for @beverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get beverages;

  /// No description provided for @promo.
  ///
  /// In en, this message translates to:
  /// **'Promo'**
  String get promo;

  /// No description provided for @claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get claim;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @order_note.
  ///
  /// In en, this message translates to:
  /// **'Order Note'**
  String get order_note;

  /// No description provided for @write_instruction.
  ///
  /// In en, this message translates to:
  /// **'Write here'**
  String get write_instruction;

  /// No description provided for @product_in_cart.
  ///
  /// In en, this message translates to:
  /// **'Product in cart'**
  String get product_in_cart;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @delivery_slang.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery_slang;

  /// No description provided for @voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get voucher;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @available_voucher.
  ///
  /// In en, this message translates to:
  /// **'Available Voucher'**
  String get available_voucher;

  /// No description provided for @other_voucher.
  ///
  /// In en, this message translates to:
  /// **'Other Voucher'**
  String get other_voucher;

  /// No description provided for @other_voucher_description.
  ///
  /// In en, this message translates to:
  /// **'Shop more to use other vouchers'**
  String get other_voucher_description;

  /// No description provided for @my_order.
  ///
  /// In en, this message translates to:
  /// **'My Order'**
  String get my_order;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @dine_in.
  ///
  /// In en, this message translates to:
  /// **'Dine-In'**
  String get dine_in;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @choose_outlet_delivery_instruction.
  ///
  /// In en, this message translates to:
  /// **'Choose outlet'**
  String get choose_outlet_delivery_instruction;

  /// No description provided for @choose_outlet_dine_in_instruction.
  ///
  /// In en, this message translates to:
  /// **'Choose outlet to dine in'**
  String get choose_outlet_dine_in_instruction;

  /// No description provided for @choose_outlet_pickup_instruction.
  ///
  /// In en, this message translates to:
  /// **'Choose outlet to pickup your order'**
  String get choose_outlet_pickup_instruction;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @add_order.
  ///
  /// In en, this message translates to:
  /// **'Add Order'**
  String get add_order;

  /// No description provided for @total_must_be_paid.
  ///
  /// In en, this message translates to:
  /// **'Total must be paid'**
  String get total_must_be_paid;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliver_to;

  /// No description provided for @choose_address.
  ///
  /// In en, this message translates to:
  /// **'Choose address'**
  String get choose_address;

  /// No description provided for @my_voucher.
  ///
  /// In en, this message translates to:
  /// **'My Voucher'**
  String get my_voucher;

  /// No description provided for @buy_voucher.
  ///
  /// In en, this message translates to:
  /// **'Buy Voucher'**
  String get buy_voucher;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @order_number.
  ///
  /// In en, this message translates to:
  /// **'Order No.'**
  String get order_number;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get pay;

  /// No description provided for @redeem_point.
  ///
  /// In en, this message translates to:
  /// **'Redeem Point'**
  String get redeem_point;

  /// No description provided for @your_point.
  ///
  /// In en, this message translates to:
  /// **'Your point'**
  String get your_point;

  /// No description provided for @point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get point;

  /// No description provided for @order_type.
  ///
  /// In en, this message translates to:
  /// **'Order type'**
  String get order_type;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @point_deduction.
  ///
  /// In en, this message translates to:
  /// **'Point deduction'**
  String get point_deduction;

  /// No description provided for @voucher_deduction.
  ///
  /// In en, this message translates to:
  /// **'Voucher deduction'**
  String get voucher_deduction;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @e_wallet.
  ///
  /// In en, this message translates to:
  /// **'E-wallet'**
  String get e_wallet;

  /// No description provided for @virtual_account.
  ///
  /// In en, this message translates to:
  /// **'Virtual Account'**
  String get virtual_account;

  /// No description provided for @credit_card.
  ///
  /// In en, this message translates to:
  /// **'Cerdit Card'**
  String get credit_card;

  /// No description provided for @debit_card.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debit_card;

  /// No description provided for @add_card.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get add_card;

  /// No description provided for @searching_driver.
  ///
  /// In en, this message translates to:
  /// **'Searching for Driver'**
  String get searching_driver;

  /// No description provided for @preparing_order.
  ///
  /// In en, this message translates to:
  /// **'Preparing Order'**
  String get preparing_order;

  /// No description provided for @on_the_way.
  ///
  /// In en, this message translates to:
  /// **'On the Way'**
  String get on_the_way;

  /// No description provided for @helpline.
  ///
  /// In en, this message translates to:
  /// **'Help Line'**
  String get helpline;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get back_to_home;

  /// No description provided for @hows_your_order.
  ///
  /// In en, this message translates to:
  /// **'How\'s Your Order'**
  String get hows_your_order;

  /// No description provided for @rating_instruction.
  ///
  /// In en, this message translates to:
  /// **'Help us to make our service better from your rating here'**
  String get rating_instruction;

  /// No description provided for @write_review.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get write_review;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card No.'**
  String get card_number;

  /// No description provided for @valid_date.
  ///
  /// In en, this message translates to:
  /// **'Valid Date'**
  String get valid_date;

  /// No description provided for @cvv_code.
  ///
  /// In en, this message translates to:
  /// **'CVV Code'**
  String get cvv_code;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @choose_courier.
  ///
  /// In en, this message translates to:
  /// **'Choose Courier'**
  String get choose_courier;

  /// No description provided for @your_order.
  ///
  /// In en, this message translates to:
  /// **'Your Order'**
  String get your_order;

  /// No description provided for @delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get delivery_address;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @language_setting.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get language_setting;

  /// No description provided for @notification_setting.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification_setting;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_conditions;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Kampoeng Steak'**
  String get about_us;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @daily_quest.
  ///
  /// In en, this message translates to:
  /// **'Daily Quest'**
  String get daily_quest;

  /// No description provided for @daily_quest_instruction.
  ///
  /// In en, this message translates to:
  /// **'Login everyday and get the point'**
  String get daily_quest_instruction;

  /// No description provided for @my_address.
  ///
  /// In en, this message translates to:
  /// **'My Address'**
  String get my_address;

  /// No description provided for @primary_address.
  ///
  /// In en, this message translates to:
  /// **'Primary Address'**
  String get primary_address;

  /// No description provided for @edit_detail.
  ///
  /// In en, this message translates to:
  /// **'Edit detail'**
  String get edit_detail;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get add_address;

  /// No description provided for @edit_address.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get edit_address;

  /// No description provided for @address_name.
  ///
  /// In en, this message translates to:
  /// **'Address Name'**
  String get address_name;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @change_address_instruction.
  ///
  /// In en, this message translates to:
  /// **'Please change the address name if not matched'**
  String get change_address_instruction;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @choose_outlet.
  ///
  /// In en, this message translates to:
  /// **'Choose Outlet'**
  String get choose_outlet;

  /// No description provided for @view_detail.
  ///
  /// In en, this message translates to:
  /// **'View Detail'**
  String get view_detail;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @search_outlet.
  ///
  /// In en, this message translates to:
  /// **'Search outlet'**
  String get search_outlet;

  /// No description provided for @view_on_map.
  ///
  /// In en, this message translates to:
  /// **'View on map'**
  String get view_on_map;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @peak_time.
  ///
  /// In en, this message translates to:
  /// **'Peak time'**
  String get peak_time;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @facility.
  ///
  /// In en, this message translates to:
  /// **'Facility'**
  String get facility;

  /// No description provided for @choose_this_outlet.
  ///
  /// In en, this message translates to:
  /// **'Choose this Outlet'**
  String get choose_this_outlet;

  /// No description provided for @estimated_arrival.
  ///
  /// In en, this message translates to:
  /// **'Estimated Arrival'**
  String get estimated_arrival;

  /// No description provided for @outlet.
  ///
  /// In en, this message translates to:
  /// **'Outlet'**
  String get outlet;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @empty_data.
  ///
  /// In en, this message translates to:
  /// **'Empty Data!'**
  String get empty_data;

  /// No description provided for @add_cart_success.
  ///
  /// In en, this message translates to:
  /// **'Success Adding to Cart'**
  String get add_cart_success;

  /// No description provided for @add_cart_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed Adding to Cart'**
  String get add_cart_failed;

  /// No description provided for @delete_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete'**
  String get delete_confirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @set_default.
  ///
  /// In en, this message translates to:
  /// **'Set Default'**
  String get set_default;

  /// No description provided for @changes_success.
  ///
  /// In en, this message translates to:
  /// **'Changes Success'**
  String get changes_success;

  /// No description provided for @changes_failed.
  ///
  /// In en, this message translates to:
  /// **'Changes Failed'**
  String get changes_failed;

  /// No description provided for @remove_address.
  ///
  /// In en, this message translates to:
  /// **'Remove Address'**
  String get remove_address;

  /// No description provided for @remove_address_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove'**
  String get remove_address_confirmation;

  /// No description provided for @update_success.
  ///
  /// In en, this message translates to:
  /// **'Update Success'**
  String get update_success;

  /// No description provided for @update_failed.
  ///
  /// In en, this message translates to:
  /// **'Update Failed'**
  String get update_failed;

  /// No description provided for @update_success_information.
  ///
  /// In en, this message translates to:
  /// **'Data has been successfuly updated'**
  String get update_success_information;

  /// No description provided for @update_failed_information.
  ///
  /// In en, this message translates to:
  /// **'Failed to update data'**
  String get update_failed_information;

  /// No description provided for @add_success.
  ///
  /// In en, this message translates to:
  /// **'Adding Data Success'**
  String get add_success;

  /// No description provided for @add_failed.
  ///
  /// In en, this message translates to:
  /// **'Adding Data Failed'**
  String get add_failed;

  /// No description provided for @add_success_information.
  ///
  /// In en, this message translates to:
  /// **'Data has been successfuly added'**
  String get add_success_information;

  /// No description provided for @add_failed_information.
  ///
  /// In en, this message translates to:
  /// **'Failed to add data'**
  String get add_failed_information;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @payment_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get payment_confirmation;

  /// No description provided for @vat.
  ///
  /// In en, this message translates to:
  /// **'VAT'**
  String get vat;

  /// No description provided for @additional_tax.
  ///
  /// In en, this message translates to:
  /// **'Additional Tax'**
  String get additional_tax;

  /// No description provided for @delivery_cost.
  ///
  /// In en, this message translates to:
  /// **'Delivery Cost'**
  String get delivery_cost;

  /// No description provided for @table_name.
  ///
  /// In en, this message translates to:
  /// **'Table No.'**
  String get table_name;

  /// No description provided for @pickup_time.
  ///
  /// In en, this message translates to:
  /// **'Pickup Time'**
  String get pickup_time;

  /// No description provided for @delivery_courier_name.
  ///
  /// In en, this message translates to:
  /// **'Delivery Courier'**
  String get delivery_courier_name;

  /// No description provided for @choose_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get choose_payment_method;

  /// No description provided for @scan_qr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scan_qr;

  /// No description provided for @scan_qr_instruction.
  ///
  /// In en, this message translates to:
  /// **'Please scan QR Code below on your Table or Voucher.'**
  String get scan_qr_instruction;

  /// No description provided for @visitor_counter.
  ///
  /// In en, this message translates to:
  /// **'Visitor'**
  String get visitor_counter;

  /// No description provided for @adult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get adult;

  /// No description provided for @children.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get children;

  /// No description provided for @reward_history.
  ///
  /// In en, this message translates to:
  /// **'Reward History'**
  String get reward_history;

  /// No description provided for @table_no.
  ///
  /// In en, this message translates to:
  /// **'Table No.'**
  String get table_no;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event and Bazaar'**
  String get event;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
