import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../customers/domain/entities/customer.dart';
import '../../../customers/domain/entities/customer_type.dart';
import '../../../customers/presentation/providers/customer_provider.dart';
import '../../../products/presentation/providers/product_provider.dart';
import '../../../stores/presentation/providers/store_provider.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/repositories/order_repository.dart';
import '../providers/order_provider.dart';

class _ItemRow {
  int? productId;
  int? storeId;
  final TextEditingController boxesCtrl;
  final TextEditingController fillCtrl;
  final TextEditingController priceCtrl;
  String? boxesError;

  _ItemRow()
      : boxesCtrl = TextEditingController(),
        fillCtrl = TextEditingController(),
        priceCtrl = TextEditingController();
}

class OrderAddDialog extends StatefulWidget {
  const OrderAddDialog({super.key});

  @override
  State<OrderAddDialog> createState() => _OrderAddDialogState();
}

class _OrderAddDialogState extends State<OrderAddDialog> {
  late OrderStatus _selectedStatus;
  int? _customerId;
  Customer? _selectedCustomer;
  final _notesCtrl = TextEditingController();
  final List<_ItemRow> _items = [];

  @override
  void initState() {
    super.initState();
    _selectedStatus = OrderStatus.notBought;
    _addItem();
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    for (final item in _items) {
      item.boxesCtrl.dispose();
      item.fillCtrl.dispose();
      item.priceCtrl.dispose();
    }
    super.dispose();
  }

  void _addItem() {
    final row = _ItemRow();
    row.boxesCtrl.addListener(_onFieldChanged);
    row.fillCtrl.addListener(_onFieldChanged);
    row.priceCtrl.addListener(_onFieldChanged);
    setState(() => _items.add(row));
  }

  void _onFieldChanged() {
    setState(() {});
  }

  void _removeItem(int index) {
    if (_items.length <= 1) return;
    final item = _items[index];
    item.boxesCtrl.dispose();
    item.fillCtrl.dispose();
    item.priceCtrl.dispose();
    setState(() => _items.removeAt(index));
  }

  bool get _isValid {
    if (_customerId == null) return false;
    if (_items.isEmpty) return false;
    return _items.every((item) {
      final boxes = int.tryParse(item.boxesCtrl.text.trim()) ?? 0;
      final fill = int.tryParse(item.fillCtrl.text.trim()) ?? 0;
      final price = int.tryParse(item.priceCtrl.text.trim()) ?? 0;
      return item.productId != null &&
          item.storeId != null &&
          boxes > 0 &&
          fill > 0 &&
          price > 0 &&
          item.boxesError == null;
    });
  }

  int get _totalItems {
    return _items.fold(0, (sum, item) {
      final boxes = int.tryParse(item.boxesCtrl.text.trim()) ?? 0;
      final fill = int.tryParse(item.fillCtrl.text.trim()) ?? 0;
      return sum + boxes * fill;
    });
  }

  int get _totalPrice {
    return _items.fold(0, (sum, item) {
      final boxes = int.tryParse(item.boxesCtrl.text.trim()) ?? 0;
      final fill = int.tryParse(item.fillCtrl.text.trim()) ?? 0;
      final price = int.tryParse(item.priceCtrl.text.trim()) ?? 0;
      return sum + boxes * fill * price;
    });
  }

  Future<void> _showAddCustomerDialog() async {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final placeCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    String? selectedType;

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            backgroundColor: colors.surface,
            title: Text(
              s.customersAddDialogTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colors.onSurface,
              ),
            ),
            content: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameCtrl,
                      decoration: InputDecoration(
                        labelText: s.customersAddFullNameHint,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: s.customersAddTypeLabel,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      dropdownColor: colors.surface,
                      items: [
                        const DropdownMenuItem(
                          value: null,
                          child: Text('—'),
                        ),
                        ...CustomerType.values.map(
                          (t) => DropdownMenuItem(
                            value: t.value,
                            child: Text(_customerTypeLabel(s, t)),
                          ),
                        ),
                      ],
                      onChanged: (v) => setDialogState(() => selectedType = v),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: s.customersAddPhoneHint,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: placeCtrl,
                      decoration: InputDecoration(
                        labelText: s.customersAddPlaceHint,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: addressCtrl,
                      decoration: InputDecoration(
                        labelText: s.customersAddAddressHint,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: notesCtrl,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: s.customersAddNotesHint,
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  s.customersAddCancel,
                  style: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (nameCtrl.text.trim().isEmpty) return;
                  final messenger = ScaffoldMessenger.of(context);
                  final customerProvider = context.read<CustomerProvider>();
                  final sLocal = S.of(context)!;
                  try {
                    final customer = await customerProvider.createCustomer(
                      fullName: nameCtrl.text.trim(),
                      type: selectedType,
                      place: placeCtrl.text.trim().isEmpty
                          ? null
                          : placeCtrl.text.trim(),
                      address: addressCtrl.text.trim().isEmpty
                          ? null
                          : addressCtrl.text.trim(),
                      phone: phoneCtrl.text.trim().isEmpty
                          ? null
                          : phoneCtrl.text.trim(),
                      notes: notesCtrl.text.trim().isEmpty
                          ? null
                          : notesCtrl.text.trim(),
                    );
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                      if (context.mounted) {
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(sLocal.ordersCustomerCreatedSnackbar),
                          ),
                        );
                        setState(() {
                          _customerId = customer.id;
                          _selectedCustomer = customer;
                        });
                      }
                    }
                  } catch (_) {}
                },
                child: Text(s.customersAddCreate),
              ),
            ],
          );
        },
      ),
    );
    nameCtrl.dispose();
    phoneCtrl.dispose();
    placeCtrl.dispose();
    addressCtrl.dispose();
    notesCtrl.dispose();
  }

  String _customerTypeLabel(S s, CustomerType type) {
    return switch (type) {
      CustomerType.normal => s.customersTypeNormal,
      CustomerType.provider => s.customersTypeProvider,
      CustomerType.providerAndCustomer => s.customersTypeProviderAndCustomer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final customers = context.watch<CustomerProvider>().allCustomers;
    final products = context.watch<ProductProvider>().allProducts;
    final stores = context.watch<StoreProvider>().stores;

    for (final item in _items) {
      if (item.productId != null) {
        final p = products.where((p) => p.id == item.productId).firstOrNull;
        if (p != null) {
          final boxes = int.tryParse(item.boxesCtrl.text.trim()) ?? 0;
          final fill = int.tryParse(item.fillCtrl.text.trim()) ?? 0;
          final requested = boxes * fill;
          if (boxes > 0 && fill > 0 && requested > p.currentState) {
            final maxBoxes = p.currentState ~/ fill;
            item.boxesError = s.ordersMaxBoxesError(maxBoxes.toString());
          } else {
            item.boxesError = null;
          }
        }
      } else {
        item.boxesError = null;
      }
    }

    return AlertDialog(
      backgroundColor: colors.surface,
      title: Text(
        s.ordersAddDialogTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),
      content: SizedBox(
        width: 640,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (customers.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    s.ordersNoCustomers,
                    style: TextStyle(
                      color: colors.error,
                      fontSize: 13,
                    ),
                  ),
                ),
              DropdownMenu<Customer>(
                key: ValueKey('customer_dropdown_$_customerId'),
                enableFilter: true,
                expandedInsets: EdgeInsets.zero,
                initialSelection: _selectedCustomer,
                hintText: s.ordersAddCustomerSearchHint,
                dropdownMenuEntries: [
                  ...customers.map((c) => DropdownMenuEntry<Customer>(
                    value: c,
                    label: c.fullName,
                    leadingIcon: Icon(Icons.person, size: 18),
                  )),
                ],
                onSelected: (c) {
                  setState(() {
                    _selectedCustomer = c;
                    _customerId = c?.id;
                  });
                },
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: colors.onSurface.withValues(alpha: 0.07),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (_customerId != null)
                    TextButton.icon(
                      onPressed: () => setState(() {
                        _customerId = null;
                        _selectedCustomer = null;
                      }),
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: colors.error.withValues(alpha: 0.7),
                      ),
                      label: Text(
                        s.ordersAddCancel,
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.error.withValues(alpha: 0.7),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  TextButton.icon(
                    onPressed: _showAddCustomerDialog,
                    icon: Icon(
                      Icons.person_add,
                      size: 18,
                      color: colors.primary,
                    ),
                    label: Text(
                      s.ordersAddNewCustomer,
                      style: TextStyle(color: colors.primary),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<OrderStatus>(
                initialValue: _selectedStatus,
                decoration: InputDecoration(
                  labelText: s.ordersAddStatusLabel,
                  labelStyle: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.5),
                  ),
                  filled: true,
                  fillColor: colors.onSurface.withValues(alpha: 0.07),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                dropdownColor: colors.surface,
                items: OrderStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(_statusLabel(s, status)),
                  );
                }).toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _selectedStatus = v);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _notesCtrl,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: s.ordersAddNotesHint,
                  labelStyle: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.5),
                  ),
                  filled: true,
                  fillColor: colors.onSurface.withValues(alpha: 0.07),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colors.primary, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  alignLabelWithHint: true,
                ),
                style: TextStyle(color: colors.onSurface),
                cursorColor: colors.primary,
              ),
              const SizedBox(height: 20),
              Divider(color: colors.outlineVariant.withValues(alpha: 0.3)),
              const SizedBox(height: 12),
              Text(
                '${s.ordersAddItem}:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              ...List.generate(_items.length, (i) {
                final item = _items[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: s.ordersColProduct,
                                labelStyle: TextStyle(
                                  color: colors.onSurface
                                      .withValues(alpha: 0.5),
                                  fontSize: 13,
                                ),
                                filled: true,
                                fillColor: colors.onSurface
                                    .withValues(alpha: 0.07),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                isDense: true,
                              ),
                              dropdownColor: colors.surface,
                              isExpanded: true,
                              items: [
                                const DropdownMenuItem(
                                  value: null,
                                  child: Text('—'),
                                ),
                                ...products.map((p) {
                                  return DropdownMenuItem(
                                    value: p.id,
                                    child: Text(
                                      p.name,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }),
                              ],
                              onChanged: (v) {
                                setState(() {
                                  item.productId = v;
                                  if (v != null) {
                                    final p = products
                                        .where((p) => p.id == v)
                                        .firstOrNull;
                                    if (p != null) {
                                      item.storeId = p.storeId;
                                      if (p.price > 0) {
                                        item.priceCtrl.text =
                                            p.price.toString();
                                      }
                                    }
                                  } else {
                                    item.storeId = null;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: s.ordersColStore,
                                labelStyle: TextStyle(
                                  color: colors.onSurface
                                      .withValues(alpha: 0.5),
                                  fontSize: 13,
                                ),
                                filled: true,
                                fillColor: colors.onSurface
                                    .withValues(alpha: 0.07),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                isDense: true,
                              ),
                              key: ValueKey('store_${item.storeId}'),
                              dropdownColor: colors.surface,
                              isExpanded: true,
                              initialValue: item.storeId,
                              items: () {
                                final candidates = item.productId != null
                                    ? stores.where((s) {
                                        final p = products
                                            .where(
                                                (p) => p.id == item.productId)
                                            .firstOrNull;
                                        return p != null && s.id == p.storeId;
                                      }).toList()
                                    : stores;
                                return candidates.map((s) {
                                  return DropdownMenuItem(
                                    value: s.id,
                                    child: Text(
                                      s.name,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList();
                              }(),
                              onChanged: (v) {
                                if (v != null) {
                                  setState(() => item.storeId = v);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 6),
                          SizedBox(
                            width: 65,
                            child: TextField(
                              controller: item.boxesCtrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: s.ordersAddBoxesHint,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurface
                                      .withValues(alpha: 0.35),
                                ),
                                filled: true,
                                fillColor: colors.onSurface
                                    .withValues(alpha: 0.07),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 13,
                                color: colors.onSurface,
                              ),
                              cursorColor: colors.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          SizedBox(
                            width: 65,
                            child: TextField(
                              controller: item.fillCtrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: s.ordersAddFillHint,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurface
                                      .withValues(alpha: 0.35),
                                ),
                                filled: true,
                                fillColor: colors.onSurface
                                    .withValues(alpha: 0.07),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 13,
                                color: colors.onSurface,
                              ),
                              cursorColor: colors.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: item.priceCtrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: s.ordersAddPriceHint,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurface
                                      .withValues(alpha: 0.35),
                                ),
                                filled: true,
                                fillColor: colors.onSurface
                                    .withValues(alpha: 0.07),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 13,
                                color: colors.onSurface,
                              ),
                              cursorColor: colors.primary,
                            ),
                          ),
                          const SizedBox(width: 2),
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                              color:
                                  colors.error.withValues(alpha: 0.7),
                            ),
                            onPressed: () => _removeItem(i),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 28,
                              minHeight: 28,
                            ),
                            tooltip: s.ordersAddRemoveItem,
                          ),
                        ],
                      ),
                      if (item.boxesError != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 8,
                          ),
                          child: Text(
                            item.boxesError!,
                            style: TextStyle(
                              fontSize: 11,
                              color: colors.error,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
              TextButton.icon(
                onPressed: _addItem,
                icon: Icon(Icons.add_rounded, size: 18, color: colors.primary),
                label: Text(s.ordersAddItem),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${s.ordersAddTotalLabel} $_totalItems',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s.ordersTotalPrice(_totalPrice.toString()),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            s.ordersAddCancel,
            style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
          ),
        ),
        TextButton(
          onPressed: _isValid
              ? () {
                  final params = CreateOrderParams(
                    date: DateTime.now(),
                    customerId: _customerId!,
                    notes: _notesCtrl.text.trim().isEmpty
                        ? null
                        : _notesCtrl.text.trim(),
                    status: _selectedStatus,
                    items: _items.map((item) {
                      return CreateOrderItemParams(
                        itemId: item.productId!,
                        storeId: item.storeId!,
                        boxes: int.tryParse(item.boxesCtrl.text.trim()) ?? 0,
                        fill: int.tryParse(item.fillCtrl.text.trim()) ?? 0,
                        price: int.tryParse(item.priceCtrl.text.trim()) ?? 0,
                      );
                    }).toList(),
                  );
                  context.read<OrderProvider>().createOrder(params);
                  context.read<ProductProvider>().loadProducts();
                  Navigator.of(context).pop();
                }
              : null,
          child: Text(
            s.ordersAddCreate,
            style: TextStyle(
              color: _isValid
                  ? colors.primary
                  : colors.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ),
      ],
    );
  }

  String _statusLabel(S s, OrderStatus status) {
    return switch (status) {
      OrderStatus.cancelled => s.ordersStatusCancelled,
      OrderStatus.done => s.ordersStatusDone,
      OrderStatus.notBought => s.ordersStatusNotBought,
      OrderStatus.notPaid => s.ordersStatusNotPaid,
    };
  }
}
