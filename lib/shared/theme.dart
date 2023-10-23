part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = const Color(0xff503E9D);
Color backgroundColor = const Color(0xffD4E3F7);
Color blackColor = const Color(0xff000000);
Color whiteColor = const Color(0xffFFFFFF);
Color greyColor = const Color(0xffDEDEDE);
Color greyColor2 = const Color(0xffF6F7F8);
Color greyColor3 = const Color(0xff82868E);

Color accentColor1 = const Color(0xffFF5C7D);
Color accentColor2 = const Color(0xffDEDEDE);
Color accentColor3 = const Color(0xffFFC006);
Color accentColor4 = const Color(0xffFF9376);

TextStyle blackTextFont = GoogleFonts.montserrat()
    .copyWith(color: blackColor, fontWeight: FontWeight.w600);
TextStyle whiteTextFont = GoogleFonts.montserrat()
    .copyWith(color: whiteColor, fontWeight: FontWeight.w600);
TextStyle blueTextFont = GoogleFonts.montserrat()
    .copyWith(color: mainColor, fontWeight: FontWeight.w600);
TextStyle yellowTextFont = GoogleFonts.montserrat()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w600);
TextStyle greyTextFont = GoogleFonts.montserrat().copyWith(
  color: greyColor,
  fontWeight: FontWeight.w400,
);
