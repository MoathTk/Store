import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/order_provider.dart';
import 'order_add_dialog.dart';

class OrdersHeader extends StatefulWidget {
  const OrdersHeader({super.key});

  @override
  State<OrdersHeader> createState() => _OrdersHeaderState();
}

class _OrdersHeaderState extends State<OrdersHeader> {
  late TextEditingController _searchCtrl;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchCtrl = TextEditingController();
    _searchCtrl.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchCtrl.removeListener(_onSearchChanged);
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<OrderProvider>().search(_searchCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final horizontalPadding = MediaQuery.of(context).size.width < 600 ? 16.0 : 32.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 24, horizontalPadding, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                s.ordersTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: colors.onSurface,
                ),
              ),
              const Spacer(),
              Flexible(
                child: SizedBox(
                  width: 280,
                  child: TextField(
                  controller: _searchCtrl,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: s.ordersSearchHint,
                    hintStyle: TextStyle(
                      color: colors.onSurface.withValues(alpha: 0.3),
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
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: colors.onSurface.withValues(alpha: 0.3),
                    ),
                    suffixIcon: _searchCtrl.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear_rounded,
                              size: 18,
                              color: colors.onSurface.withValues(alpha: 0.5),
                            ),
                            onPressed: () {
                              _searchCtrl.clear();
                              _focusNode.unfocus();
                              context.read<OrderProvider>().search('');
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: TextStyle(color: colors.onSurface),
                  cursorColor: colors.primary,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\u0600-\u06FF\s]')),
                  ],
                ),
              ),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const OrderAddDialog(),
                ),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text(s.ordersAddNew),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
