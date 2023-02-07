import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/custom_form_builder.dart';

class ChatFooter extends StatelessWidget {
  const ChatFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.h1!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Let's have a chat",
            style: AppText.h2b,
          ),
          Space.y1!,
          const CustomTextField(
            prefixIcon: Icon(
              Icons.person,
            ),
            name: 'firstName',
            hint: 'First Name',
            textInputType: TextInputType.name,
          ),
          Space.y!,
          const CustomTextField(
            prefixIcon: Icon(
              Icons.person,
            ),
            name: 'lastName',
            hint: 'Last Name',
            textInputType: TextInputType.name,
          ),
          Space.y!,
          const CustomTextField(
            prefixIcon: Icon(
              Icons.email,
            ),
            name: 'email',
            hint: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          Space.y!,
          const CustomTextField(
            prefixIcon: Icon(
              Icons.phone,
            ),
            name: 'phone',
            hint: 'Telephone',
            textInputType: TextInputType.number,
          ),
          Space.y!,
          const CustomTextField(
            prefixIcon: Icon(
              Icons.pin_drop,
            ),
            name: 'address',
            hint: 'Address',
            textInputType: TextInputType.text,
          ),
          Space.y!,
          CustomTextField(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                bottom: AppDimensions.normalize(30),
              ),
              child: const Icon(
                Icons.message,
              ),
            ),
            name: 'message',
            hint: 'Message',
            maxlines: 5,
            textInputType: TextInputType.multiline,
          ),
          Space.y1!,
          CustomButton(
            onPressed: () {},
            width: double.infinity,
            child: Center(
              child: Text(
                'Send',
                style: AppText.l1b!.cl(
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
