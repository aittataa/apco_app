import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedLogo extends StatelessWidget {
  final int flex;
  const ExpandedLogo({this.flex = 1});
  final bool state = true;
  @override
  Widget build(BuildContext context) {
    if (state) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Lounge",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.itim(
                      color: AppTheme.whiteTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    " 940 ",
                    style: GoogleFonts.scada(
                      color: AppTheme.whiteTextColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "لاونج",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.lemonada(
                      color: AppTheme.whiteTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        flex: flex,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [AppConstant.boxShadow],
          ),
          child: Image.asset("${AppMessages.appIconRound}"),
        ),
      );
    }
  }
}
