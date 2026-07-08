import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/customer_provider.dart';

class CustomerTableHeader extends StatefulWidget {
  final VoidCallback onAdd;

  const CustomerTableHeader({super.key, required this.onAdd});

  @override
  State<CustomerTableHeader> createState() => _CustomerTableHeaderState();
}

class _CustomerTableHeaderState extends State<CustomerTableHeader> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final provider = context.read<CustomerProvider>();
    _controller = TextEditingController(text: provider.searchQuery);
    _controller.addListener(() {
      provider.search(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          s.customersTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 260,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: s.customersSearchHint,
              hintStyle: TextStyle(
                fontSize: 14,
                color: colors.onSurface.withValues(alpha: 0.35),
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 20,
                color: colors.onSurface.withValues(alpha: 0.35),
              ),
              filled: true,
              fillColor: colors.onSurface.withValues(alpha: 0.06),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              isDense: true,
            ),
            style: TextStyle(fontSize: 14, color: colors.onSurface),
            cursorColor: colors.primary,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(s.customersExportComingSoon)),
                );
              },
              icon: const Icon(Icons.download_rounded, size: 18),
              label: Text(s.customersExport),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: widget.onAdd,
              icon: const Icon(Icons.add_rounded, size: 18),
              label: Text(s.customersAddNew),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
