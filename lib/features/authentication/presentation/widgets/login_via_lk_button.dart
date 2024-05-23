import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/presentation/ui/widgets/svg_picture.dart';

class LoginViaLkButton extends StatelessWidget {
  const LoginViaLkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 17, 57, 136),
          Color.fromARGB(255, 114, 13, 61),
        ]),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(MediaQuery.of(context).size.width / 2, 42),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Вход через',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Gap(10),
            IstuSvgPicture(
              SvgIstuIcons.istuLogoBlack,
              height: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
