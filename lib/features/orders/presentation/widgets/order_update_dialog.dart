import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../providers/order_provider.dart';

class OrderUpdateDialog extends StatefulWidget {
  final Order order;

  const OrderUpdateDialog({super.key, required this.order});

  @override
  State<OrderUpdateDialog> createState() => _OrderUpdateDialogState();
}

class _OrderUpdateDialogState extends State<OrderUpdateDialog> {
  late TextEditingController _notesCtrl;
  late DateTime _selectedDate;
  late OrderStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _notesCtrl = TextEditingController(text: widget.order.notes ?? '');
    _selectedDate = widget.order.date;
    _selectedStatus = widget.order.status;
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colors.surface,
      title: Text(
        s.ordersUpdateDialogTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width < 600
            ? MediaQuery.of(context).size.width * 0.92
            : 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (picked != null) setState(() => _selectedDate = picked);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: s.ordersAddDateHint,
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
                child: Text(
                  '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                  style: TextStyle(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
              maxLines: 3,
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
          ],
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
          onPressed: () {
            Navigator.of(context).pop();
            context.read<OrderProvider>().updateOrder(
              id: widget.order.id,
              date: _selectedDate,
              notes: _notesCtrl.text.trim().isEmpty
                  ? null
                  : _notesCtrl.text.trim(),
              status: _selectedStatus,
            );
          },
          child: Text(
            s.ordersUpdateSave,
            style: TextStyle(color: colors.primary),
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
