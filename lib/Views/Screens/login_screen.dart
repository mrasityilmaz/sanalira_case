import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_case/Data/Models/user_model.dart';
import 'package:sanalira_case/Theme/Ui-Constants/colors.dart';
import 'package:sanalira_case/Views/Screens/main_screen.dart';
import 'package:sanalira_case/Views/Widgets/custom_password_textfield_widget.dart';
import 'package:sanalira_case/Views/Widgets/custom_phone_textfield_widget.dart';
import 'package:sanalira_case/Views/Widgets/custom_textfield_widget.dart';
import 'package:sanalira_case/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final ValueNotifier<bool> checkBoxController = ValueNotifier(false);

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assets_images_login_wp_png),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [loginPageFirstBlack, loginPageSecondBlack].map((e) => e.withOpacity(.85)).toList(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              Expanded(
                  flex: 25,
                  child: SafeArea(
                    child: Center(
                      child: LayoutBuilder(
                        builder: (p0, p1) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                Assets.assets_icons_main_icon_png,
                                height: p1.maxWidth / 6,
                                width: p1.maxWidth / 6,
                              ),
                            ),
                            Text("SanaLira", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22))
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 75,
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(color: loginPageFormBlack.withOpacity(.75), borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.symmetric(horizontal: 16) + EdgeInsets.only(bottom: 25 + MediaQuery.of(context).viewInsets.bottom > 0 ? 25 : 0),
                    children: [
                      Text.rich(TextSpan(
                          text: "SanaLira'ya",
                          style: GoogleFonts.inter(color: mainGreen, fontWeight: FontWeight.w600, fontSize: 20),
                          children: [TextSpan(text: " Yeni Üyelik", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20))])),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Bilgilerinizi girip sözleşmeyi onaylayın.", style: GoogleFonts.inter(color: subtitleGrey, fontWeight: FontWeight.w400, fontSize: 16)),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            CustomTextFieldWidget(
                                currentFocusNode: _nameFocusNode,
                                controller: nameController,
                                nextFocusNode: _passwordFocusNode,
                                validator: (str) {
                                  if (str == null || str.isEmpty || str.length >= 50 || str.length <= 3) {
                                    return "Ad Soyad alanı minimum 3 karakter, maksimum 50 karakter olmalıdır.";
                                  } else {
                                    return null;
                                  }
                                },
                                fieldTitle: "Ad Soyad"),
                            CustomPasswordTextFieldWidget(
                                currentFocusNode: _passwordFocusNode,
                                nextFocusNode: _emailFocusNode,
                                controller: passwordController,
                                validator: (str) {
                                  if (str == null || str.isEmpty || !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$._@!%&*?])[A-Za-z\d#$._@!%&*?]{8,30}$').hasMatch(str)) {
                                    return "Şifreniz minimum 6 karakter, maksimum 20 karakter, en az 1 küçük harf,büyük harf,rakam,özel karakter içermelidir.";
                                  } else {
                                    return null;
                                  }
                                },
                                fieldTitle: "Şifre"),
                            CustomTextFieldWidget(
                                currentFocusNode: _emailFocusNode,
                                controller: emailController,
                                nextFocusNode: _phoneFocusNode,
                                validator: (str) {
                                  if (str == null || str.isEmpty || !EmailValidator.validate(str)) {
                                    return "E-posta geçerli değil.";
                                  } else {
                                    return null;
                                  }
                                },
                                fieldTitle: "E-posta"),

                            CustomPhoneTextFieldWidget(
                                currentFocusNode: _phoneFocusNode,
                                controller: phoneController,
                                validator: (str) {
                                  if (str == null || str.isEmpty || !(str.startsWith("(53") || str.startsWith("(54") || str.startsWith("(55"))) {
                                    return "Cep Telefonu geçersiz";
                                  } else {
                                    return null;
                                  }
                                },
                                fieldTitle: "Cep Telefonu Numaranız"),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: checkBoxController,
                                  builder: (BuildContext context, bool value, Widget? child) {
                                    return Transform.scale(
                                      scale: 2,
                                      child: Checkbox(
                                          activeColor: mainGreen,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          checkColor: Colors.white,
                                          side: const BorderSide(color: Colors.white, width: .6),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          value: value,
                                          onChanged: (s) {
                                            checkBoxController.value = s!;
                                          }),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(text: "Hesabınızı oluştururken", children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()..onTap = () async {},
                                        text: " sözleşme ve koşulları ",
                                        style: GoogleFonts.inter(color: mainGreen, fontWeight: FontWeight.w600, fontSize: 16),
                                      ),
                                      const TextSpan(
                                        text: "kabul etmeniz gerekir.",
                                      ),
                                    ]),
                                    maxLines: 2,
                                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                                  ),
                                )
                              ],
                            ),

                            ///
                            /// Kayıt Ol Butonu
                            ///
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder(
                                      valueListenable: checkBoxController,
                                      builder: (BuildContext context, bool value, Widget? child) {
                                        return ElevatedButton(
                                          onPressed: value
                                              ? () async {
                                                  if (_formKey.currentState != null) {
                                                    _formKey.currentState!.save();
                                                    if (_formKey.currentState!.validate()) {
                                                      UserModel userData = UserModel(
                                                          nameSurname: nameController.text, password: passwordController.text, email: emailController.text, phoneNumber: "+90${phoneController.text}");
                                                      final prefInstance = await SharedPreferences.getInstance();

                                                      await prefInstance.setBool("auth", true);
                                                      await prefInstance.setString("authData", userData.toJson().toString()).whenComplete(() => Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => const MainScreen(),
                                                          ),
                                                          (route) => false));
                                                    }
                                                  }
                                                }
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                                              backgroundColor: mainGreen),
                                          child: Text(
                                            "Giriş Yap",
                                            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
