// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'إدارة المتجر';

  @override
  String get welcomeTitle => 'إدارة\nالمتجر';

  @override
  String get welcomeSubtitle =>
      'أدر مخزونك ومبيعاتك وموظفيك بكفاءة في مكان واحد.';

  @override
  String get welcomeGetStarted => 'ابدأ الآن';

  @override
  String get welcomeAlreadyAccount => 'لدي حساب بالفعل';

  @override
  String get loginTitle => 'مرحباً بعودتك!';

  @override
  String get loginSubtitle => 'سجل الدخول لإدارة متجرك';

  @override
  String get loginUsernameLabel => 'اسم المستخدم';

  @override
  String get loginUsernameError => 'أدخل اسم المستخدم';

  @override
  String get loginPasswordLabel => 'كلمة المرور';

  @override
  String get loginPasswordError => 'أدخل كلمة المرور';

  @override
  String get loginForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get loginSignIn => 'تسجيل الدخول';

  @override
  String get signupTitle => 'إنشاء حساب';

  @override
  String get signupSubtitle => 'قم بإعداد بيانات الاعتماد الخاصة بك للبدء';

  @override
  String get signupConfirmLabel => 'تأكيد كلمة المرور';

  @override
  String get signupConfirmErrorEmpty => 'يرجى تأكيد كلمة المرور';

  @override
  String get signupPasswordMinLength => '6 أحرف على الأقل';

  @override
  String get signupConfirmErrorMismatch => 'كلمات المرور غير متطابقة';

  @override
  String get signupCreateAccount => 'إنشاء حساب';

  @override
  String get errorNoAccount => 'لم يتم العثور على حساب. يرجى التسجيل أولاً.';

  @override
  String get errorInvalidCredentials =>
      'اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get brandName => 'لايت';

  @override
  String get navDashboard => 'لوحة التحكم';

  @override
  String get navStores => 'المتاجر';

  @override
  String get navOrder => 'الطلبات';

  @override
  String get navProduct => 'المنتجات';

  @override
  String get navCustomer => 'العملاء';

  @override
  String get navEmployee => 'الموظفون';

  @override
  String get navBilling => 'الفواتير';

  @override
  String get navAnalytics => 'التحليلات';

  @override
  String get navSetting => 'الإعدادات';

  @override
  String get navHelp => 'المساعدة';

  @override
  String get navLogout => 'تسجيل الخروج';

  @override
  String get modeDark => 'الوضع الليلي';

  @override
  String get modeLight => 'الوضع النهاري';

  @override
  String placeholderPage(Object label) {
    return 'صفحة $label';
  }

  @override
  String get storesTitle => 'المتاجر';

  @override
  String get storesAddTooltip => 'إضافة متجر';

  @override
  String get storesAddDialogTitle => 'إضافة متجر';

  @override
  String get storesAddHint => 'اسم المتجر';

  @override
  String get storesAddCancel => 'إلغاء';

  @override
  String get storesAddCreate => 'إنشاء';

  @override
  String get storesEmptyTitle => 'لا توجد متاجر بعد';

  @override
  String get storesEmptySubtitle => 'أضف متجرك الأول للبدء';

  @override
  String get storesErrorTitle => 'فشل في تحميل المتاجر';

  @override
  String get storesDeleteTitle => 'حذف المتجر';

  @override
  String storesDeleteConfirm(Object name) {
    return 'هل أنت متأكد أنك تريد حذف \"$name\"؟';
  }

  @override
  String get storesDeleteCancel => 'إلغاء';

  @override
  String get storesDeleteButton => 'حذف';

  @override
  String get customersTitle => 'العملاء';

  @override
  String get customersExport => 'تصدير';

  @override
  String get customersExportComingSoon => 'قريباً';

  @override
  String get customersAddNew => 'إضافة جديد';

  @override
  String get customersColId => 'المعرف';

  @override
  String get customersColFullName => 'الاسم الكامل';

  @override
  String get customersColType => 'النوع';

  @override
  String get customersColPlace => 'المكان';

  @override
  String get customersColAddress => 'العنوان';

  @override
  String get customersColPhone => 'رقم الهاتف';

  @override
  String get customersColNotes => 'ملاحظات';

  @override
  String get customersTypeNormal => 'عادي';

  @override
  String get customersTypeProvider => 'مزود';

  @override
  String get customersTypeProviderAndCustomer => 'مزود وعميل';

  @override
  String get customersPrevious => '< السابق';

  @override
  String get customersNext => 'التالي >';

  @override
  String get customersEmptyTitle => 'لا يوجد عملاء بعد';

  @override
  String get customersEmptySubtitle => 'أضف عميلك الأول للبدء';

  @override
  String get customersErrorTitle => 'فشل في تحميل العملاء';

  @override
  String get customersDeleteTitle => 'حذف العميل';

  @override
  String customersDeleteConfirm(Object name) {
    return 'هل أنت متأكد أنك تريد حذف \"$name\"؟';
  }

  @override
  String get customersDeleteCancel => 'إلغاء';

  @override
  String get customersDeleteButton => 'حذف';

  @override
  String get customersAddDialogTitle => 'إضافة عميل';

  @override
  String get customersAddFullNameHint => 'الاسم الكامل';

  @override
  String get customersAddFullNameError => 'أدخل الاسم الكامل';

  @override
  String get customersAddTypeLabel => 'النوع';

  @override
  String get customersAddPlaceHint => 'المكان';

  @override
  String get customersAddAddressHint => 'العنوان';

  @override
  String get customersAddPhoneHint => 'رقم الهاتف';

  @override
  String get customersAddNotesHint => 'ملاحظات';

  @override
  String get customersAddCancel => 'إلغاء';

  @override
  String get customersAddCreate => 'إنشاء';

  @override
  String get customersActionEdit => 'تعديل';

  @override
  String get customersActionDelete => 'حذف';

  @override
  String get customersSearchHint => 'ابحث بالاسم أو رقم الهاتف';

  @override
  String get customersUpdateDialogTitle => 'تحديث العميل';

  @override
  String get customersUpdateSave => 'حفظ';

  @override
  String get productsTitle => 'المنتجات';

  @override
  String get productsSearchHint => 'ابحث بالاسم أو المعرف';

  @override
  String get productsExport => 'تصدير';

  @override
  String get productsExportComingSoon => 'قريباً';

  @override
  String get productsAddNew => 'إضافة جديد';

  @override
  String get productsColId => 'المعرف';

  @override
  String get productsColName => 'الاسم';

  @override
  String get productsColStore => 'المتجر';

  @override
  String get productsColBox => 'الصناديق';

  @override
  String get productsColFill => 'القطع/الصندوق';

  @override
  String get productsColInitState => 'الكمية الأولية';

  @override
  String get productsColCurrentState => 'الكمية الحالية';

  @override
  String get productsColPrice => 'سعر الوحدة';

  @override
  String get productsAddPriceHint => 'سعر الوحدة';

  @override
  String get productsColAddedAt => 'تاريخ الإضافة';

  @override
  String get productsEmptyTitle => 'لا توجد منتجات بعد';

  @override
  String get productsEmptySubtitle => 'أضف منتجك الأول للبدء';

  @override
  String get productsErrorTitle => 'فشل في تحميل المنتجات';

  @override
  String get productsAddDialogTitle => 'إضافة منتج';

  @override
  String get productsAddNameHint => 'اسم المنتج';

  @override
  String get productsAddNameError => 'أدخل اسم المنتج';

  @override
  String get productsAddStoreIdHint => 'معرف المتجر';

  @override
  String get productsAddBoxHint => 'عدد الصناديق';

  @override
  String get productsAddFillHint => 'عدد القطع في الصندوق';

  @override
  String get productsAddCurrentStateHint => 'إجمالي القطع الحالية';

  @override
  String get productsAddCancel => 'إلغاء';

  @override
  String get productsAddCreate => 'إنشاء';

  @override
  String get productsStoreNotFound => 'المتجر غير موجود';

  @override
  String productsStoreNotFoundMsg(Object id) {
    return 'لا يوجد متجر بالمعرف $id. يرجى إضافة المتجر أولاً.';
  }

  @override
  String get productsUpdateDialogTitle => 'تعديل المنتج';

  @override
  String get productsUpdateSave => 'حفظ';

  @override
  String get productsDeleteTitle => 'حذف المنتج';

  @override
  String productsDeleteConfirm(Object name) {
    return 'هل أنت متأكد أنك تريد حذف \"$name\"؟';
  }

  @override
  String get productsDeleteCancel => 'إلغاء';

  @override
  String get productsDeleteButton => 'حذف';

  @override
  String get productsActionEdit => 'تعديل';

  @override
  String get productsActionDelete => 'حذف';

  @override
  String get ordersTitle => 'الطلبات';

  @override
  String get ordersSearchHint => 'ابحث بالمعرف أو العميل';

  @override
  String get ordersExport => 'تصدير';

  @override
  String get ordersExportComingSoon => 'قريباً';

  @override
  String get ordersAddNew => 'طلب جديد';

  @override
  String get ordersFilterAll => 'الكل';

  @override
  String get ordersFilterDone => 'مكتمل';

  @override
  String get ordersFilterNotPaid => 'غير مدفوع';

  @override
  String get ordersFilterNotBought => 'غير مشترى';

  @override
  String get ordersFilterCancelled => 'ملغي';

  @override
  String get ordersStatusCancelled => 'ملغي';

  @override
  String get ordersStatusDone => 'مكتمل';

  @override
  String get ordersStatusNotBought => 'غير مشترى';

  @override
  String get ordersStatusNotPaid => 'غير مدفوع';

  @override
  String get ordersEmptyTitle => 'لا توجد طلبات بعد';

  @override
  String get ordersEmptySubtitle => 'أنشئ طلبك الأول للبدء';

  @override
  String get ordersErrorTitle => 'فشل في تحميل الطلبات';

  @override
  String ordersItemsLabel(Object count, Object total) {
    return '$count عناصر · $total قطع';
  }

  @override
  String ordersPhoneLabel(Object phone) {
    return 'الهاتف: $phone';
  }

  @override
  String get ordersColProduct => 'المنتج';

  @override
  String get ordersColStore => 'المتجر';

  @override
  String get ordersColQty => 'الكمية';

  @override
  String get ordersActionEdit => 'تعديل';

  @override
  String get ordersActionDelete => 'حذف';

  @override
  String get ordersAddDialogTitle => 'إنشاء طلب';

  @override
  String get ordersAddCustomerHint => 'العميل';

  @override
  String get ordersAddDateHint => 'التاريخ';

  @override
  String get ordersAddStatusLabel => 'الحالة';

  @override
  String get ordersAddNotesHint => 'ملاحظات';

  @override
  String get ordersAddBoxesHint => 'الصناديق';

  @override
  String get ordersAddFillHint => 'عدد القطع في الصندوق';

  @override
  String get ordersAddRemoveItem => 'إزالة';

  @override
  String get ordersAddItem => 'إضافة عنصر';

  @override
  String get ordersAddTotalLabel => 'إجمالي العناصر:';

  @override
  String get ordersAddCancel => 'إلغاء';

  @override
  String get ordersAddCreate => 'إنشاء';

  @override
  String get ordersNoCustomers =>
      'لم يتم العثور على عملاء. يرجى إضافة عملاء أولاً.';

  @override
  String get ordersUpdateDialogTitle => 'تعديل الطلب';

  @override
  String get ordersUpdateSave => 'حفظ';

  @override
  String get ordersDeleteTitle => 'حذف الطلب';

  @override
  String ordersDeleteConfirm(Object id) {
    return 'هل أنت متأكد أنك تريد حذف الطلب رقم #$id؟';
  }

  @override
  String get ordersDeleteCancel => 'إلغاء';

  @override
  String get ordersDeleteButton => 'حذف';

  @override
  String get ordersColPrice => 'سعر الوحدة';

  @override
  String get ordersColLineTotal => 'إجمالي البند';

  @override
  String get ordersAddPriceHint => 'سعر القطعة';

  @override
  String ordersTotalPrice(Object total) {
    return 'الإجمالي: $total ج.م';
  }

  @override
  String get ordersAddCustomerSearchHint => 'ابحث عن عميل بالاسم أو الرقم';

  @override
  String get ordersAddNewCustomer => 'إضافة عميل';

  @override
  String ordersMaxBoxesError(Object boxes) {
    return 'الحد الأقصى $boxes صناديق';
  }

  @override
  String get ordersNoCustomersFound => 'لا يوجد عملاء';

  @override
  String get ordersCustomerCreatedSnackbar => 'تم إضافة العميل بنجاح';

  @override
  String get ordersPaidJustNow => 'قبل قليل';

  @override
  String ordersPaidMinutes(Object count) {
    return 'منذ $count د';
  }

  @override
  String ordersPaidHours(Object count) {
    return 'منذ $count س';
  }

  @override
  String ordersPaidDays(Object count) {
    return 'منذ $count يوم';
  }

  @override
  String ordersPaidMonths(Object count) {
    return 'منذ $count شهر';
  }

  @override
  String ordersPaidYears(Object count) {
    return 'منذ $count سنة';
  }
}
