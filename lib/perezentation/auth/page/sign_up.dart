import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../data/models/user_model/user_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/routs/routs.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';
import '../widget/global_passvord_textfields.dart';
import '../widget/global_text_fields.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({super.key});

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController _rolcontroller = TextEditingController();
  ImagePicker picker = ImagePicker();

  XFile? file;

  int gender = 1;
  String gendertext="MALE";
  var contactFormatter = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) {
      return Stack(children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.c_008FE7.withOpacity(0.8),
                AppColors.c_005589.withOpacity(1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200, left: 40, right: 40),
          child: Text(
            "зарегистрироваться",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 260, left: 24, right: 24),
            child: GlobalTextFilds(
              controllerl: usernameController,
              labeltext: 'имя пользователя',
              textInputFormatter: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 320, left: 24, right: 24),
          child: GlobalTextFilds(
            controllerl: gmailController,
            labeltext: 'Электронная почта',
            textInputFormatter: [
              FilteringTextInputFormatter.deny(
                  RegExp(r'^[A-Z.-]+@[a-z.-]+\.[a-z]+$')
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 380, left: 24, right: 24),
          child: GlobalTextFilds(
            controllerl: phoneController,
            labeltext: 'Контакт',
            textInputFormatter: [
              contactFormatter
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 440, left: 24, right: 24),
          child: GlobalTextFilds(
            controllerl: professionController,
            labeltext: 'профессия',
            textInputFormatter: [],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 500, left: 24, right: 24),
            child: GlobalpasswordTextFilds(
              controller: passwordController,
              labeltext: 'Пароль',
              textInputFormatter: [],
            )),
        Padding(
            padding: EdgeInsets.only(
                top:  580 , left: 24, right: 24),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(style: TextButton.styleFrom(
                    backgroundColor:gender==1? AppColors.c_FDA429:AppColors.white
                ),onPressed: (){
                  setState(() {
                    gender=1;
                    gendertext="MALE";
                    setState(() {

                    });
                  });
                }, child: Text("MALE",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: AppColors.c_162023),)),
                TextButton(style: TextButton.styleFrom(
                  backgroundColor:gender==0? AppColors.c_FDA429:AppColors.white
                ),onPressed: (){
                  setState(() {
                    gender=0;
                    gendertext="FMALE";
                    setState(() {

                    });
                  });
                }, child: Text("FMALE",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: AppColors.c_162023))),
              ],
            )
        ),

      ]);
    }, listener: (context, state) {
      if (state is AuthSendCodeSuccessState) {
        Usermodel userModel = Usermodel(
          password: passwordController.text,
          username: usernameController.text,
          email: gmailController.text,
          avatar: file!.path,
          contact: phoneController.text,
          gender: gender.toString(),
          profession: professionController.text,
          role: "male",
        );
        Navigator.pushNamed(
          context,
          RouteNames.confirmGmail,
          arguments: userModel,
        );
      }

      if (state is AuthErrorState) {
        showErrorMessage(message: state.errorText, context: context);
      }
    }));
  }
  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.c_162023,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      file = xFile;
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      file = xFile;
    }
  }
}
