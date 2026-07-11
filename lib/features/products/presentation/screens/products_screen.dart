import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../stores/presentation/providers/store_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_data_table.dart';
import '../widgets/product_table_container.dart';
import '../widgets/product_table_header.dart';
import '../widgets/product_table_pagination.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: colors.surfaceContainerLowest,
        child: Center(
          child: ProductTableContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTableHeader(onAdd: () => _showAddDialog(context)),
                const SizedBox(height: 20),
                const Divider(height: 1, thickness: 0.5),
                const SizedBox(height: 16),
                Center(child: const Expanded(child: ProductDataTable())),
                const Spacer(),
                const ProductTablePagination(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final nameCtrl = TextEditingController();
    final boxCtrl = TextEditingController();
    final fillCtrl = TextEditingController();
    final stores = context.read<StoreProvider>().stores;

    showDialog(
      context: context,
      builder: (ctx) {
        String name = '';
        int? selectedStoreId = stores.isNotEmpty ? stores.first.id : null;
        String boxText = '';
        String fillText = '';
        String priceText = '';

        int computedTotal() {
          final b = int.tryParse(boxText) ?? 0;
          final f = int.tryParse(fillText) ?? 0;
          return b * f;
        }

        bool isValid() {
          return name.trim().isNotEmpty &&
              selectedStoreId != null &&
              (int.tryParse(boxText) ?? 0) > 0 &&
              (int.tryParse(fillText) ?? 0) > 0 &&
              (int.tryParse(priceText) ?? 0) > 0;
        }

        return StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
            backgroundColor: colors.surface,
            title: Text(
              s.productsAddDialogTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colors.onSurface,
              ),
            ),
            content: SizedBox(
              width: MediaQuery.of(ctx).size.width < 600
                  ? MediaQuery.of(ctx).size.width * 0.92
                  : 420,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameCtrl,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: s.productsAddNameHint,
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
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                      onChanged: (v) {
                        name = v;
                        setDialogState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<int>(
                      initialValue: selectedStoreId,
                      decoration: InputDecoration(
                        labelText: s.productsAddStoreIdHint,
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
                      ),
                      dropdownColor: colors.surface,
                      items: stores.map((store) {
                        return DropdownMenuItem(
                          value: store.id,
                          child: Text(store.name),
                        );
                      }).toList(),
                      onChanged: (v) {
                        selectedStoreId = v;
                        setDialogState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: boxCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: s.productsAddBoxHint,
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
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                      onChanged: (v) {
                        boxText = v;
                        setDialogState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: fillCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: s.productsAddFillHint,
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
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                      onChanged: (v) {
                        fillText = v;
                        setDialogState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: s.productsAddPriceHint,
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
                      ),
                      style: TextStyle(color: colors.onSurface),
                      cursorColor: colors.primary,
                      onChanged: (v) {
                        priceText = v;
                        setDialogState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: s.productsColInitState,
                        labelStyle: TextStyle(
                          color: colors.onSurface.withValues(alpha: 0.5),
                        ),
                        hintText: '${computedTotal()}',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: computedTotal() > 0
                              ? colors.onSurface
                              : colors.onSurface.withValues(alpha: 0.35),
                        ),
                        filled: true,
                        fillColor: colors.onSurface.withValues(alpha: 0.04),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: colors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  s.productsAddCancel,
                  style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
                ),
              ),
              TextButton(
                onPressed: isValid()
                    ? () {
                        final box = int.tryParse(boxText) ?? 0;
                        final fill = int.tryParse(fillText) ?? 0;
                        final price = int.tryParse(priceText) ?? 0;
                        Navigator.of(ctx).pop();
                        context.read<ProductProvider>().createProduct(
                          name: name.trim(),
                          storeId: selectedStoreId!,
                          box: box,
                          fill: fill,
                          currentState: box * fill,
                          price: price,
                        );
                      }
                    : null,
                child: Text(
                  s.productsAddCreate,
                  style: TextStyle(
                    color: isValid()
                        ? colors.primary
                        : colors.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
