part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String nameButton;
  final void Function() onTap;

  const CustomButton({
    super.key,
    required this.nameButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: Material(
        elevation: 1,
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.lightBlue[400],
          child: Center(
              child: Text(
            nameButton,
            style: whiteTextFont.copyWith(color: Colors.white, fontSize: 16),
          )),
        ),
      ),
    );
  }
}
