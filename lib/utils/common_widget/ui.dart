import 'package:delivery_boy/controller/auth_controller.dart';
import 'package:delivery_boy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontWeight: FontWeight.w700,
          fontSize: _height * 0.03,
          color: color),
    );
  }
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: _height * 0.024,
          color: color),
    );
  }
}

class LoginSubTitle extends StatelessWidget {
  const LoginSubTitle({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.018,
          color: color),
    );
  }
}

class LoginFieldTitle extends StatelessWidget {
  const LoginFieldTitle({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: _height * 0.017,
          color: color),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: _height * 0.021,
          color: Colors.white),
    );
  }
}

class HomeFieldTitle extends StatelessWidget {
  const HomeFieldTitle({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: _height * 0.023,
          color: color),
    );
  }
}

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: _height * 0.025,
          color: color),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;

  // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: AppbarTitle(title: widget.title, color: Color(0xFF060E30)),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Image.asset(
            'assets/images/leftArrow.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      leadingWidth: 32,
    );
  }
}

class ProfileCustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  ProfileCustomAppBar({Key? key, required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;

  // default is 56.0

  @override
  _ProfileCustomAppBarState createState() => _ProfileCustomAppBarState();
}

class _ProfileCustomAppBarState extends State<ProfileCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: AppbarTitle(title: widget.title, color: Color(0xFF060E30)),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Image.asset(
            'assets/images/leftArrow.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      leadingWidth: 32,
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.black,
          ), // Replace with your image asset path
          onPressed: () {
            showLogAlertDialog(context);
          },
        ),
      ],
    );
  }

  showLogAlertDialog(BuildContext context) {
    var controller = Get.put(AuthController());
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    // set up the button
    Widget okButton = TextButton(
        //style: ButtonStyle(alignment: Alignment.center),
        onPressed: () {
          controller.userLogout(context);
          Get.offAllNamed('/login');
        },
        child: Container(
          height: _height * 0.05,
          width: _width * 0.28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Ok',
            style: TextStyle(
                color: Colors.white,
                fontSize: _height * 0.02,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500),
          ),
        ));
    Widget cancelButton = TextButton(
        // style: ButtonStyle(
        //     alignment: Alignment.
        // ),
        onPressed: () {
          Get.back();
        },
        child: Container(
          height: _height * 0.05,
          width: _width * 0.28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Colors.grey,
                fontSize: _height * 0.02,
                fontFamily: 'inter',
                fontWeight: FontWeight.w500),
          ),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      alignment: Alignment.center,
      elevation: 5,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Center(
        child: Text(
          'Are You Sure To Logout ?',
          style: TextStyle(
              color: Color(0xFF060E30),
              fontSize: _height * 0.02,
              fontFamily: 'inter',
              fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            okButton,
            cancelButton,
          ],
        )
      ],
    );
    // actions: <Widget>[
    //   ButtonBar(
    //     alignment: MainAxisAlignment.center, // Align buttons to the center
    //     children: <Widget>[
    //       okButton,
    //       cancelButton,
    //     ],
    //   ),
    // ]);

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class AllPageField extends StatelessWidget {
  const AllPageField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: _height * 0.016,
          color: Color(0xFF060E30)),
    );
  }
}

class AllPageValue extends StatelessWidget {
  const AllPageValue({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.016,
          color: Color(0xFF060E30)),
    );
  }
}

class AllPageFormField extends StatelessWidget {
  const AllPageFormField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: _height * 0.017,
          color: Color(0xFF060E30)),
    );
  }
}

class AllPageFormValue extends StatelessWidget {
  const AllPageFormValue({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.016,
          color: Color(0xFF060E30)),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.title, required this.ontap});
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Container(
      height: _height * 0.08,
      width: _width * 0.9,
      color: Colors.white,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          ontap;
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF1631C2),
            borderRadius: BorderRadius.circular(10),
          ),
          height: _height * 0.055,
          width: _width * 0.9,
          child: ButtonText(title: title),
        ),
      ),
    );
  }
}

class CustomSpace extends StatelessWidget {
  const CustomSpace({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return SizedBox(
      height: _height * 0.01,
    );
  }
}

class ReportField extends StatelessWidget {
  final String title;
  const ReportField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: _height * 0.018,
          color: Color(0xFF060E30)),
    );
  }
}

class ReportValue extends StatelessWidget {
  final String title;
  const ReportValue({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.018,
          color: Color(0xFF060E30)),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String title;
  const ProfileField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: _height * 0.0191,
          color: Color(0xFF060E30)),
    );
  }
}

class ProfileValue extends StatelessWidget {
  final String title;
  const ProfileValue({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: _height * 0.0191,
          color: Color(0xFF060E30)),
    );
  }
}
