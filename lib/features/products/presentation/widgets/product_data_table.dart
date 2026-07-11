import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../stores/domain/entities/store.dart';
import '../../../stores/presentation/providers/store_provider.dart';
import '../../domain/entities/product.dart';
import '../providers/product_provider.dart';
import 'product_action_menu.dart';

class ProductDataTable extends StatelessWidget {
  const ProductDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<ProductProvider>();
    final stores = context.watch<StoreProvider>().stores;

    switch (provider.status) {
      case ProductStatus.idle:
      case ProductStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ProductStatus.failure:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: colors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  s.productsErrorTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colors.error,
                  ),
                ),
                if (provider.error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    provider.error!,
                    style: TextStyle(
                      fontSize: 13,
                      color: colors.error.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      case ProductStatus.success:
        if (provider.allProducts.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 64,
                    color: colors.onSurface.withValues(alpha: 0.15),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    s.productsEmptyTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.productsEmptySubtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: colors.onSurface.withValues(alpha: 0.35),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colors.outlineVariant.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: DataTable(
              dataRowMinHeight: 50,
              dataRowMaxHeight: 50,
              headingRowHeight: 48,
              columnSpacing: 30,
              horizontalMargin: 2,
              showCheckboxColumn: false,
              dividerThickness: 0.5,
              dataTextStyle: TextStyle(fontSize: 14, color: colors.onSurface),
              headingTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: colors.onSurfaceVariant,
                letterSpacing: 0.3,
              ),
              columns: [
                DataColumn(
                  label: Text(s.productsColId),
                  onSort: (_, __) => provider.toggleSort(ProductSortField.id),
                ),
                DataColumn(
                  label: Text(s.productsColName),
                  onSort: (_, __) => provider.toggleSort(ProductSortField.name),
                ),
                DataColumn(
                  label: Text(s.productsColStore),
                  onSort: (_, __) =>
                      provider.toggleSort(ProductSortField.storeId),
                ),
                DataColumn(label: Text(s.productsColBox)),
                DataColumn(label: Text(s.productsColFill)),
                DataColumn(label: Text(s.productsColInitState)),
                DataColumn(
                  label: Text(s.productsColPrice),
                  onSort: (_, __) =>
                      provider.toggleSort(ProductSortField.currentState),
                ),
                DataColumn(
                  label: Text(s.productsColCurrentState),
                  onSort: (_, __) =>
                      provider.toggleSort(ProductSortField.currentState),
                ),
                DataColumn(label: Text(s.productsColAddedAt)),
                DataColumn(label: Text('')),
              ],
              rows: provider.paginatedProducts.map((product) {
                final store = stores.cast<Store?>().firstWhere(
                  (s) => s?.id == product.storeId,
                  orElse: () => null,
                );
                final storeName = store?.name ?? '#${product.storeId}';

                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '#${product.id}',
                        style: TextStyle(
                          color: colors.onSurface.withValues(alpha: 0.6),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    DataCell(
                      Text(
                        storeName,
                        style: TextStyle(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () => provider.filterByStore(product.storeId),
                      showEditIcon: false,
                    ),
                    DataCell(Text(product.box.toString())),
                    DataCell(Text(product.fill.toString())),
                    DataCell(Text('${product.initialState}')),
                    DataCell(Text(product.price.toString())),
                    DataCell(
                      Text(
                        '${product.currentState}',
                        style: TextStyle(
                          color: product.currentState < product.initialState
                              ? colors.tertiary
                              : colors.onSurface,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        '${product.addedAt.year}-${product.addedAt.month.toString().padLeft(2, '0')}-${product.addedAt.day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: colors.onSurface.withValues(alpha: 0.6),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    DataCell(
                      ProductActionMenu(
                        onEdit: () => _showUpdateDialog(context, product),
                        onDelete: () => _confirmDelete(context, product),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
    }
  }

  void _confirmDelete(BuildContext context, Product product) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        title: Text(
          s.productsDeleteTitle,
          style: TextStyle(color: colors.onSurface),
        ),
        content: Text(
          s.productsDeleteConfirm(product.name),
          style: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              s.productsDeleteCancel,
              style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<ProductProvider>().deleteProduct(product.id);
            },
            child: Text(
              s.productsDeleteButton,
              style: TextStyle(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, Product product) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final stores = context.read<StoreProvider>().stores;
    final nameCtrl = TextEditingController(text: product.name);
    final boxCtrl = TextEditingController(text: product.box.toString());
    final fillCtrl = TextEditingController(text: product.fill.toString());
    final currentStateCtrl = TextEditingController(
      text: product.currentState.toString(),
    );
    final priceCtrl = TextEditingController(text: product.price.toString());
    int? selectedStoreId = product.storeId;

    showDialog(
      context: context,
      builder: (ctx) {
        bool isValid() {
          return nameCtrl.text.trim().isNotEmpty &&
              selectedStoreId != null &&
              (int.tryParse(boxCtrl.text.trim()) ?? 0) > 0 &&
              (int.tryParse(fillCtrl.text.trim()) ?? 0) > 0 &&
              (int.tryParse(currentStateCtrl.text.trim()) ?? 0) >= 0 &&
              (int.tryParse(priceCtrl.text.trim()) ?? 0) > 0;
        }

        return StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
            backgroundColor: colors.surface,
            title: Text(
              s.productsUpdateDialogTitle,
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
                      onChanged: (_) => setDialogState(() {}),
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
                      onChanged: (_) => setDialogState(() {}),
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
                      onChanged: (_) => setDialogState(() {}),
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
                      onChanged: (_) => setDialogState(() {}),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: priceCtrl,
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
                      onChanged: (_) => setDialogState(() {}),
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
                        final name = nameCtrl.text.trim();
                        final box = int.tryParse(boxCtrl.text.trim()) ?? 0;
                        final fill = int.tryParse(fillCtrl.text.trim()) ?? 0;
                        final currentState =
                            int.tryParse(currentStateCtrl.text.trim()) ?? 0;
                        final price = int.tryParse(priceCtrl.text.trim()) ?? 0;
                        Navigator.of(ctx).pop();
                        context.read<ProductProvider>().updateProduct(
                          id: product.id,
                          name: name,
                          storeId: selectedStoreId,
                          box: box,
                          fill: fill,
                          currentState: currentState,
                          price: price,
                        );
                      }
                    : null,
                child: Text(
                  s.productsUpdateSave,
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
