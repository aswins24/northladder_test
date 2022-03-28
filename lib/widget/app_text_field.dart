import 'package:flutter/material.dart';
import 'package:northladder_test_app/utility/app_assets.dart';
import 'package:northladder_test_app/utility/radii.dart';
import 'package:northladder_test_app/utility/style/text_style.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final bool canObscure;
  final TextInputType keyboardType;

  const AppTextField(
      {Key? key,
      this.label,
      this.canObscure = false,
      this.keyboardType = TextInputType.text,
      required this.controller})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isObscure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.canObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: Radii.k11pxRadius,
        border: Border.all(color: Colors.grey),
      ),
      child: ListTile(
        title: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none,
              label: widget.label != null
                  ? Text(
                      widget.label!,
                      style: Style.p.textStyle.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    )
                  : null),
          obscureText: isObscure,
        ),
        trailing: widget.canObscure
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Image.asset(
                  AppAssets.eye,
                  scale: 2,
                ),
              )
            : null,
      ),
    );
  }
}
