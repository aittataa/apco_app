import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: LabelText(
            label: "${AppMessages.GREETING_SUBTITLE}",
            color: AppTheme.blackTextColor.withOpacity(.5),
          ),
        ),
        subtitle: SearchBox(),
      ),
    );
  }
}
