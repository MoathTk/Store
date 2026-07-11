import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../domain/entities/customer.dart';
import '../providers/customer_provider.dart';
import 'customer_action_menu.dart';
import 'customer_avatar.dart';
import 'customer_type_badge.dart';

class CustomerDataTable extends StatelessWidget {
  const CustomerDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<CustomerProvider>();

    switch (provider.status) {
      case CustomerStatus.idle:
      case CustomerStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case CustomerStatus.failure:
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
                  s.customersErrorTitle,
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
      case CustomerStatus.success:
        if (provider.allCustomers.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.people_outline_rounded,
                    size: 64,
                    color: colors.onSurface.withValues(alpha: 0.15),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    s.customersEmptyTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.customersEmptySubtitle,
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
              columnSpacing:30,
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
                  label: Text(s.customersColId),
                  onSort: (_, __) => provider.toggleSort(CustomerSortField.id),
                ),
                DataColumn(
                  label: Text(s.customersColFullName),
                  onSort: (_, __) =>
                      provider.toggleSort(CustomerSortField.fullName),
                ),
                DataColumn(label: Text(s.customersColType)),
                DataColumn(
                  label: Text(s.customersColPlace),
                  onSort: (_, __) =>
                      provider.toggleSort(CustomerSortField.place),
                ),
                DataColumn(label: Text(s.customersColAddress)),
                DataColumn(label: Text(s.customersColPhone)),
                DataColumn(label: Text(s.customersColNotes)),
                DataColumn(label: Text('')),
              ],
              rows: provider.paginatedCustomers.map((customer) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '#${customer.id}',
                        style: TextStyle(
                          color: colors.onSurface.withValues(alpha: 0.6),
                          fontSize: 13,
                          
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          CustomerAvatar(fullName: customer.fullName),
                          const SizedBox(width: 12),
                          Text(
                            customer.fullName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      customer.type != null
                          ? CustomerTypeBadge(type: customer.type!)
                          : Text(
                              '—',
                              style: TextStyle(
                                color: colors.onSurface.withValues(alpha: 0.3),
                              ),
                            ),
                    ),
                    DataCell(
                      Text(
                        customer.place ?? '—',
                        style: TextStyle(
                          color: customer.place != null
                              ? colors.onSurface
                              : colors.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 160,
                        child: Text(
                          customer.address ?? '—',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: customer.address != null
                                ? colors.onSurface.withValues(alpha: 0.7)
                                : colors.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        customer.phone ?? '—',
                        style: TextStyle(
                          color: customer.phone != null
                              ? colors.onSurface
                              : colors.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 140,
                        child: Text(
                          customer.notes ?? '—',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: customer.notes != null
                                ? colors.onSurface.withValues(alpha: 0.6)
                                : colors.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      CustomerActionMenu(
                        onEdit: () => _showUpdateDialog(context, customer),
                        onDelete: () => _confirmDelete(context, customer),
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

  void _confirmDelete(BuildContext context, Customer customer) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        title: Text(
          s.customersDeleteTitle,
          style: TextStyle(color: colors.onSurface),
        ),
        content: Text(
          s.customersDeleteConfirm(customer.fullName),
          style: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              s.customersDeleteCancel,
              style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<CustomerProvider>().deleteCustomer(customer.id);
            },
            child: Text(
              s.customersDeleteButton,
              style: TextStyle(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, Customer customer) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final nameCtrl = TextEditingController(text: customer.fullName);
    final phoneCtrl = TextEditingController(text: customer.phone ?? '');
    final placeCtrl = TextEditingController(text: customer.place ?? '');
    final addressCtrl = TextEditingController(text: customer.address ?? '');
    final notesCtrl = TextEditingController(text: customer.notes ?? '');
    String? selectedType = customer.type?.value;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        title: Text(
          s.customersUpdateDialogTitle,
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
                    labelText: s.customersAddFullNameHint,
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  style: TextStyle(color: colors.onSurface),
                  cursorColor: colors.primary,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: InputDecoration(
                    labelText: s.customersAddTypeLabel,
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  dropdownColor: colors.surface,
                  items: [
                    DropdownMenuItem(value: null, child: Text('—', style: TextStyle(color: colors.onSurface.withValues(alpha: 0.3)))),
                    DropdownMenuItem(value: 'normal', child: Text(s.customersTypeNormal)),
                    DropdownMenuItem(value: 'provider', child: Text(s.customersTypeProvider)),
                    DropdownMenuItem(value: 'provider_and_customer', child: Text(s.customersTypeProviderAndCustomer)),
                  ],
                  onChanged: (v) => selectedType = v,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddPhoneHint,
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  style: TextStyle(color: colors.onSurface),
                  cursorColor: colors.primary,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: placeCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddPlaceHint,
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  style: TextStyle(color: colors.onSurface),
                  cursorColor: colors.primary,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: addressCtrl,
                  decoration: InputDecoration(
                    labelText: s.customersAddAddressHint,
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              context.read<CustomerProvider>().updateCustomer(
                id: customer.id,
                fullName: name,
                type: selectedType,
                place: placeCtrl.text.trim().isEmpty ? null : placeCtrl.text.trim(),
                address: addressCtrl.text.trim().isEmpty ? null : addressCtrl.text.trim(),
                phone: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
              );
            },
            child: Text(
              s.customersUpdateSave,
              style: TextStyle(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
