import 'package:mtbek_front/view/app/bloc/user_bloc/user_bloc.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMobileDrawerUserInfoView extends StatelessWidget {
  const NavigationMobileDrawerUserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserBloc>().user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: DefaultColors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
              border: Border.all(
                color: DefaultColors.black,
                width: 0.5,
              ),
            ),
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: 40,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: NetworkImage(
                user?.avatar ??
                    'https://steamuserimages-a.akamaihd.net/ugc/1773834223549607884/B3625A94A19A8DA73DF1B6C4334E4766CC45DFF2/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user?.name ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  gradient: DefaultColors.greenBonusGradient,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Бонусы: ${user?.bonus ?? 0}',
                  style: DefaultextStyles.body.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
