import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class MembershipAvailableVoucher extends StatelessWidget {
  const MembershipAvailableVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    final header = AppMargin(
      child: AppHeaderTitle(
        text: L10n.localizations(context).available_voucher,
      ),
    );

    return Column(
      children: [
        header,
        SizedBox(height: 12),
        AppMargin(child: Container()),
      ],
    );
  }
}
