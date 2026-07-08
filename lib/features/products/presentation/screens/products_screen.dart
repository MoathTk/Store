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
    final currentStateCtrl = TextEditingController();
    final stores = context.read<StoreProvider>().stores;
    int? selectedStoreId = stores.isNotEmpty ? stores.first.id : null;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
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
          width: 420,
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
                  onChanged: (v) => selectedStoreId = v,
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
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: currentStateCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: s.productsAddCurrentStateHint,
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
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              if (selectedStoreId == null) return;
              final box = int.tryParse(boxCtrl.text.trim()) ?? 0;
              final fill = int.tryParse(fillCtrl.text.trim()) ?? 0;
              final currentState =
                  int.tryParse(currentStateCtrl.text.trim()) ?? 0;
              if (box <= 0 || fill <= 0) return;
              Navigator.of(ctx).pop();
              context.read<ProductProvider>().createProduct(
                name: name,
                storeId: selectedStoreId!,
                box: box,
                fill: fill,
                currentState: currentState,
              );
            },
            child: Text(
              s.productsAddCreate,
              style: TextStyle(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
