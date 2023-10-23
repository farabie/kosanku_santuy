part of 'widgets.dart';

class CustomSosmedWidget extends StatelessWidget {
  final String nameSosmed;
  final String imageSosmed;
  final Function()? onTap;

  CustomSosmedWidget({
    super.key,
    required this.nameSosmed,
    required this.imageSosmed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: accentColor2,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
                child: Image.asset(
                  imageSosmed,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                nameSosmed,
                style: blackTextFont.copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
