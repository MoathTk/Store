import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/customer_provider.dart';

class CustomerTablePagination extends StatelessWidget {
  const CustomerTablePagination({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<CustomerProvider>();

    if (provider.status != CustomerStatus.success) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: provider.currentPage > 1
                ? () => provider.goToPage(provider.currentPage - 1)
                : null,
            child: Text(
              s.customersPrevious,
              style: TextStyle(
                color: provider.currentPage > 1
                    ? colors.primary
                    : colors.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ...List.generate(provider.totalPages, (i) {
            final page = i + 1;
            final isActive = page == provider.currentPage;
            return GestureDetector(
              onTap: () => provider.goToPage(page),
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isActive ? colors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  page.toString().padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    color: isActive
                        ? colors.onPrimary
                        : colors.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 8),
          TextButton(
            onPressed: provider.currentPage < provider.totalPages
                ? () => provider.goToPage(provider.currentPage + 1)
                : null,
            child: Text(
              s.customersNext,
              style: TextStyle(
                color: provider.currentPage < provider.totalPages
                    ? colors.primary
                    : colors.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
