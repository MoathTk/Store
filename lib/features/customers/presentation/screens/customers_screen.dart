import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/customer_provider.dart';
import '../widgets/customer_data_table.dart';
import '../widgets/customer_table_container.dart';
import '../widgets/customer_table_header.dart';
import '../widgets/customer_table_pagination.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: colors.surfaceContainerLowest,
        child: Center(
          child: CustomerTableContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerTableHeader(onAdd: () => _showAddDialog(context)),
                const SizedBox(height: 20),
                const Divider(height: 1, thickness: 0.5),
                const SizedBox(height: 16),
                Center(child: const Expanded(child: CustomerDataTable())),
                Spacer(),
                const CustomerTablePagination(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final s = S.of(context);
    final colors = Theme.of(context).colorScheme;
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final placeCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    String? selectedType;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
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
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: s.customersAddFullNameHint,
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
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: InputDecoration(
                    labelText: s.customersAddTypeLabel,
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
                  items: [
                    DropdownMenuItem(
                      value: null,
                      child: Text(
                        '—',
                        style: TextStyle(
                          color: colors.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'normal',
                      child: Text(s.customersTypeNormal),
                    ),
                    DropdownMenuItem(
                      value: 'provider',
                      child: Text(s.customersTypeProvider),
                    ),
                    DropdownMenuItem(
                      value: 'provider_and_customer',
                      child: Text(s.customersTypeProviderAndCustomer),
                    ),
                  ],
                  onChanged: (v) => selectedType = v,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddPhoneHint,
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
                  controller: placeCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddPlaceHint,
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
                  controller: addressCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddAddressHint,
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
                  controller: notesCtrl,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: s.customersAddNotesHint,
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
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              s.customersAddCancel,
              style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
            ),
          ),
          TextButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              Navigator.of(ctx).pop();
              context.read<CustomerProvider>().createCustomer(
                fullName: name,
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
            },
            child: Text(
              s.customersAddCreate,
              style: TextStyle(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
