part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  final String nameTextField;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.nameTextField,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          nameTextField,
          style: blackTextFont.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: greyColor,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: mainColor,
              ),
            ),
            hintText: hintText,
            hintStyle: greyTextFont,
          ),
          obscureText: isPassword,
        ),
      ],
    );
  }
}
