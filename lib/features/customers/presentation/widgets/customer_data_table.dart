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
    final s = S.of(context);
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
          child: DataTable(
            dataRowMinHeight: 60,
            dataRowMaxHeight: 60,
            headingRowHeight: 48,
            columnSpacing: 40,
            horizontalMargin: 0,
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
                onSort: (_, __) => provider.toggleSort(CustomerSortField.place),
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
                      onEdit: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(s.customersActionEdit)),
                        );
                      },
                      onDelete: () => _confirmDelete(context, customer),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
    }
  }

  void _confirmDelete(BuildContext context, Customer customer) {
    final s = S.of(context);
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
}
