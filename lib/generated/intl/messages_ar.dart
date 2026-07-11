// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(name) => "هل أنت متأكد أنك تريد حذف \"${name}\"؟";

  static String m1(id) => "هل أنت متأكد أنك تريد حذف الطلب رقم #${id}؟";

  static String m2(count, total) => "${count} عناصر · ${total} قطع";

  static String m3(boxes) => "الحد الأقصى ${boxes} صناديق";

  static String m4(count) => "منذ ${count} يوم";

  static String m5(count) => "منذ ${count} س";

  static String m6(count) => "منذ ${count} د";

  static String m7(count) => "منذ ${count} شهر";

  static String m8(count) => "منذ ${count} سنة";

  static String m9(phone) => "الهاتف: ${phone}";

  static String m10(total) => "الإجمالي: ${total} ج.م";

  static String m11(label) => "صفحة ${label}";

  static String m12(name) => "هل أنت متأكد أنك تريد حذف \"${name}\"؟";

  static String m13(id) =>
      "لا يوجد متجر بالمعرف ${id}. يرجى إضافة المتجر أولاً.";

  static String m14(name) => "هل أنت متأكد أنك تريد حذف \"${name}\"؟";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("إدارة المتجر"),
    "brandName": MessageLookupByLibrary.simpleMessage("لايت"),
    "customersActionDelete": MessageLookupByLibrary.simpleMessage("حذف"),
    "customersActionEdit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "customersAddAddressHint": MessageLookupByLibrary.simpleMessage("العنوان"),
    "customersAddCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "customersAddCreate": MessageLookupByLibrary.simpleMessage("إنشاء"),
    "customersAddDialogTitle": MessageLookupByLibrary.simpleMessage(
      "إضافة عميل",
    ),
    "customersAddFullNameError": MessageLookupByLibrary.simpleMessage(
      "أدخل الاسم الكامل",
    ),
    "customersAddFullNameHint": MessageLookupByLibrary.simpleMessage(
      "الاسم الكامل",
    ),
    "customersAddNew": MessageLookupByLibrary.simpleMessage("إضافة جديد"),
    "customersAddNotesHint": MessageLookupByLibrary.simpleMessage("ملاحظات"),
    "customersAddPhoneHint": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "customersAddPlaceHint": MessageLookupByLibrary.simpleMessage("المكان"),
    "customersAddTypeLabel": MessageLookupByLibrary.simpleMessage("النوع"),
    "customersColAddress": MessageLookupByLibrary.simpleMessage("العنوان"),
    "customersColFullName": MessageLookupByLibrary.simpleMessage(
      "الاسم الكامل",
    ),
    "customersColId": MessageLookupByLibrary.simpleMessage("المعرف"),
    "customersColNotes": MessageLookupByLibrary.simpleMessage("ملاحظات"),
    "customersColPhone": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "customersColPlace": MessageLookupByLibrary.simpleMessage("المكان"),
    "customersColType": MessageLookupByLibrary.simpleMessage("النوع"),
    "customersDeleteButton": MessageLookupByLibrary.simpleMessage("حذف"),
    "customersDeleteCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "customersDeleteConfirm": m0,
    "customersDeleteTitle": MessageLookupByLibrary.simpleMessage("حذف العميل"),
    "customersEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "أضف عميلك الأول للبدء",
    ),
    "customersEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا يوجد عملاء بعد",
    ),
    "customersErrorTitle": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل العملاء",
    ),
    "customersExport": MessageLookupByLibrary.simpleMessage("تصدير"),
    "customersExportComingSoon": MessageLookupByLibrary.simpleMessage("قريباً"),
    "customersNext": MessageLookupByLibrary.simpleMessage("التالي >"),
    "customersPrevious": MessageLookupByLibrary.simpleMessage("< السابق"),
    "customersSearchHint": MessageLookupByLibrary.simpleMessage(
      "ابحث بالاسم أو رقم الهاتف",
    ),
    "customersTitle": MessageLookupByLibrary.simpleMessage("العملاء"),
    "customersTypeNormal": MessageLookupByLibrary.simpleMessage("عادي"),
    "customersTypeProvider": MessageLookupByLibrary.simpleMessage("مزود"),
    "customersTypeProviderAndCustomer": MessageLookupByLibrary.simpleMessage(
      "مزود وعميل",
    ),
    "customersUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "تحديث العميل",
    ),
    "customersUpdateSave": MessageLookupByLibrary.simpleMessage("حفظ"),
    "errorInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم أو كلمة المرور غير صحيحة.",
    ),
    "errorNoAccount": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على حساب. يرجى التسجيل أولاً.",
    ),
    "loginForgotPassword": MessageLookupByLibrary.simpleMessage(
      "هل نسيت كلمة المرور؟",
    ),
    "loginPasswordError": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة المرور",
    ),
    "loginPasswordLabel": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "loginSignIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginSubtitle": MessageLookupByLibrary.simpleMessage(
      "سجل الدخول لإدارة متجرك",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage("مرحباً بعودتك!"),
    "loginUsernameError": MessageLookupByLibrary.simpleMessage(
      "أدخل اسم المستخدم",
    ),
    "loginUsernameLabel": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "modeDark": MessageLookupByLibrary.simpleMessage("الوضع الليلي"),
    "modeLight": MessageLookupByLibrary.simpleMessage("الوضع النهاري"),
    "navAnalytics": MessageLookupByLibrary.simpleMessage("التحليلات"),
    "navBilling": MessageLookupByLibrary.simpleMessage("الفواتير"),
    "navCustomer": MessageLookupByLibrary.simpleMessage("العملاء"),
    "navDashboard": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "navEmployee": MessageLookupByLibrary.simpleMessage("الموظفون"),
    "navHelp": MessageLookupByLibrary.simpleMessage("المساعدة"),
    "navLogout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "navOrder": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "navProduct": MessageLookupByLibrary.simpleMessage("المنتجات"),
    "navSetting": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "navStores": MessageLookupByLibrary.simpleMessage("المتاجر"),
    "ordersActionDelete": MessageLookupByLibrary.simpleMessage("حذف"),
    "ordersActionEdit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "ordersAddBoxesHint": MessageLookupByLibrary.simpleMessage("الصناديق"),
    "ordersAddCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "ordersAddCreate": MessageLookupByLibrary.simpleMessage("إنشاء"),
    "ordersAddCustomerHint": MessageLookupByLibrary.simpleMessage("العميل"),
    "ordersAddCustomerSearchHint": MessageLookupByLibrary.simpleMessage(
      "ابحث عن عميل بالاسم أو الرقم",
    ),
    "ordersAddDateHint": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "ordersAddDialogTitle": MessageLookupByLibrary.simpleMessage("إنشاء طلب"),
    "ordersAddFillHint": MessageLookupByLibrary.simpleMessage(
      "عدد القطع في الصندوق",
    ),
    "ordersAddItem": MessageLookupByLibrary.simpleMessage("إضافة عنصر"),
    "ordersAddNew": MessageLookupByLibrary.simpleMessage("طلب جديد"),
    "ordersAddNewCustomer": MessageLookupByLibrary.simpleMessage("إضافة عميل"),
    "ordersAddNotesHint": MessageLookupByLibrary.simpleMessage("ملاحظات"),
    "ordersAddPriceHint": MessageLookupByLibrary.simpleMessage("سعر القطعة"),
    "ordersAddRemoveItem": MessageLookupByLibrary.simpleMessage("إزالة"),
    "ordersAddStatusLabel": MessageLookupByLibrary.simpleMessage("الحالة"),
    "ordersAddTotalLabel": MessageLookupByLibrary.simpleMessage(
      "إجمالي العناصر:",
    ),
    "ordersColLineTotal": MessageLookupByLibrary.simpleMessage("إجمالي البند"),
    "ordersColPrice": MessageLookupByLibrary.simpleMessage("سعر الوحدة"),
    "ordersColProduct": MessageLookupByLibrary.simpleMessage("المنتج"),
    "ordersColQty": MessageLookupByLibrary.simpleMessage("الكمية"),
    "ordersColStore": MessageLookupByLibrary.simpleMessage("المتجر"),
    "ordersCustomerCreatedSnackbar": MessageLookupByLibrary.simpleMessage(
      "تم إضافة العميل بنجاح",
    ),
    "ordersDeleteButton": MessageLookupByLibrary.simpleMessage("حذف"),
    "ordersDeleteCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "ordersDeleteConfirm": m1,
    "ordersDeleteTitle": MessageLookupByLibrary.simpleMessage("حذف الطلب"),
    "ordersEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "أنشئ طلبك الأول للبدء",
    ),
    "ordersEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات بعد",
    ),
    "ordersErrorTitle": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الطلبات",
    ),
    "ordersExport": MessageLookupByLibrary.simpleMessage("تصدير"),
    "ordersExportComingSoon": MessageLookupByLibrary.simpleMessage("قريباً"),
    "ordersFilterAll": MessageLookupByLibrary.simpleMessage("الكل"),
    "ordersFilterCancelled": MessageLookupByLibrary.simpleMessage("ملغي"),
    "ordersFilterDone": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "ordersFilterNotBought": MessageLookupByLibrary.simpleMessage("غير مشترى"),
    "ordersFilterNotPaid": MessageLookupByLibrary.simpleMessage("غير مدفوع"),
    "ordersItemsLabel": m2,
    "ordersMaxBoxesError": m3,
    "ordersNoCustomers": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على عملاء. يرجى إضافة عملاء أولاً.",
    ),
    "ordersNoCustomersFound": MessageLookupByLibrary.simpleMessage(
      "لا يوجد عملاء",
    ),
    "ordersPaidDays": m4,
    "ordersPaidHours": m5,
    "ordersPaidJustNow": MessageLookupByLibrary.simpleMessage("قبل قليل"),
    "ordersPaidMinutes": m6,
    "ordersPaidMonths": m7,
    "ordersPaidYears": m8,
    "ordersPhoneLabel": m9,
    "ordersSearchHint": MessageLookupByLibrary.simpleMessage(
      "ابحث بالمعرف أو العميل",
    ),
    "ordersStatusCancelled": MessageLookupByLibrary.simpleMessage("ملغي"),
    "ordersStatusDone": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "ordersStatusNotBought": MessageLookupByLibrary.simpleMessage("غير مشترى"),
    "ordersStatusNotPaid": MessageLookupByLibrary.simpleMessage("غير مدفوع"),
    "ordersTitle": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "ordersTotalPrice": m10,
    "ordersUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "تعديل الطلب",
    ),
    "ordersUpdateSave": MessageLookupByLibrary.simpleMessage("حفظ"),
    "placeholderPage": m11,
    "productsActionDelete": MessageLookupByLibrary.simpleMessage("حذف"),
    "productsActionEdit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "productsAddBoxHint": MessageLookupByLibrary.simpleMessage("عدد الصناديق"),
    "productsAddCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "productsAddCreate": MessageLookupByLibrary.simpleMessage("إنشاء"),
    "productsAddCurrentStateHint": MessageLookupByLibrary.simpleMessage(
      "إجمالي القطع الحالية",
    ),
    "productsAddDialogTitle": MessageLookupByLibrary.simpleMessage(
      "إضافة منتج",
    ),
    "productsAddFillHint": MessageLookupByLibrary.simpleMessage(
      "عدد القطع في الصندوق",
    ),
    "productsAddNameError": MessageLookupByLibrary.simpleMessage(
      "أدخل اسم المنتج",
    ),
    "productsAddNameHint": MessageLookupByLibrary.simpleMessage("اسم المنتج"),
    "productsAddNew": MessageLookupByLibrary.simpleMessage("إضافة جديد"),
    "productsAddPriceHint": MessageLookupByLibrary.simpleMessage("سعر الوحدة"),
    "productsAddStoreIdHint": MessageLookupByLibrary.simpleMessage(
      "معرف المتجر",
    ),
    "productsColAddedAt": MessageLookupByLibrary.simpleMessage("تاريخ الإضافة"),
    "productsColBox": MessageLookupByLibrary.simpleMessage("الصناديق"),
    "productsColCurrentState": MessageLookupByLibrary.simpleMessage(
      "الكمية الحالية",
    ),
    "productsColFill": MessageLookupByLibrary.simpleMessage("القطع/الصندوق"),
    "productsColId": MessageLookupByLibrary.simpleMessage("المعرف"),
    "productsColInitState": MessageLookupByLibrary.simpleMessage(
      "الكمية الأولية",
    ),
    "productsColName": MessageLookupByLibrary.simpleMessage("الاسم"),
    "productsColPrice": MessageLookupByLibrary.simpleMessage("سعر الوحدة"),
    "productsColStore": MessageLookupByLibrary.simpleMessage("المتجر"),
    "productsDeleteButton": MessageLookupByLibrary.simpleMessage("حذف"),
    "productsDeleteCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "productsDeleteConfirm": m12,
    "productsDeleteTitle": MessageLookupByLibrary.simpleMessage("حذف المنتج"),
    "productsEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "أضف منتجك الأول للبدء",
    ),
    "productsEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد منتجات بعد",
    ),
    "productsErrorTitle": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل المنتجات",
    ),
    "productsExport": MessageLookupByLibrary.simpleMessage("تصدير"),
    "productsExportComingSoon": MessageLookupByLibrary.simpleMessage("قريباً"),
    "productsSearchHint": MessageLookupByLibrary.simpleMessage(
      "ابحث بالاسم أو المعرف",
    ),
    "productsStoreNotFound": MessageLookupByLibrary.simpleMessage(
      "المتجر غير موجود",
    ),
    "productsStoreNotFoundMsg": m13,
    "productsTitle": MessageLookupByLibrary.simpleMessage("المنتجات"),
    "productsUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "تعديل المنتج",
    ),
    "productsUpdateSave": MessageLookupByLibrary.simpleMessage("حفظ"),
    "signupConfirmErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "يرجى تأكيد كلمة المرور",
    ),
    "signupConfirmErrorMismatch": MessageLookupByLibrary.simpleMessage(
      "كلمات المرور غير متطابقة",
    ),
    "signupConfirmLabel": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "signupCreateAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "signupPasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "6 أحرف على الأقل",
    ),
    "signupSubtitle": MessageLookupByLibrary.simpleMessage(
      "قم بإعداد بيانات الاعتماد الخاصة بك للبدء",
    ),
    "signupTitle": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "storesAddCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "storesAddCreate": MessageLookupByLibrary.simpleMessage("إنشاء"),
    "storesAddDialogTitle": MessageLookupByLibrary.simpleMessage("إضافة متجر"),
    "storesAddHint": MessageLookupByLibrary.simpleMessage("اسم المتجر"),
    "storesAddTooltip": MessageLookupByLibrary.simpleMessage("إضافة متجر"),
    "storesDeleteButton": MessageLookupByLibrary.simpleMessage("حذف"),
    "storesDeleteCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "storesDeleteConfirm": m14,
    "storesDeleteTitle": MessageLookupByLibrary.simpleMessage("حذف المتجر"),
    "storesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "أضف متجرك الأول للبدء",
    ),
    "storesEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد متاجر بعد",
    ),
    "storesErrorTitle": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل المتاجر",
    ),
    "storesTitle": MessageLookupByLibrary.simpleMessage("المتاجر"),
    "welcomeAlreadyAccount": MessageLookupByLibrary.simpleMessage(
      "لدي حساب بالفعل",
    ),
    "welcomeGetStarted": MessageLookupByLibrary.simpleMessage("ابدأ الآن"),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "أدر مخزونك ومبيعاتك وموظفيك بكفاءة في مكان واحد.",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("إدارة\nالمتجر"),
  };
}
