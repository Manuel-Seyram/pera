import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_provider.dart';
import '../../../blocs/national id/ghana_card_bloc.dart';
import '../../../blocs/national id/ghana_card_list_bloc.dart';
import '../../../models/national id/ghana_card_model.dart';
import '../../widgets/pera_button.dart';
import '../create_national_card.dart';
import 'ghana_card_front_list.dart';

class GhanaCardList extends StatelessWidget {
  final String buttonText;
  const GhanaCardList({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StreamBuilder<List<GhanaCardResults>>(
      stream: ghanacardListBloc.ghanacardList,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/home-icon-credit-card.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'No cards available yet',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              PeraButton('Add Card', () {
                _toHome(context);
              }, _gradient()),
            ],
          );
        }

        return Column(
          children: <Widget>[
            const SizedBox(
              height: 200.0,
            ),
            Column(
              children: [
                SizedBox(
                    height: screenSize.height * 0.55,
                    width: screenSize.width * 0.75,
                    child: AppinioSwiper(
                      cardsCount: snapshot.data!.length,
                      swipeOptions: AppinioSwipeOptions.vertical,
                      loop: true,
                      allowUnswipe: false,
                      direction: AppinioSwiperDirection.top,
                      cardsBuilder: (BuildContext context, int index) {
                        return GhanaCardFrontList(
                          ghanacardModel: snapshot.data![index],
                        );
                      },
                    )),
              ],
            )
          ],
        );
      },
    );
  }

  _toHome(BuildContext context) {
    var blocProviderCardCreate = BlocProvider(
      bloc: GhanaCardBloc(),
      child: const GhanaCardCreate(),
    );
    blocProviderCardCreate.bloc.selectCardType(buttonText);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => blocProviderCardCreate));
  }

  Gradient _gradient() {
    return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [
          0.2,
          0.9
        ],
        colors: [
          Color.fromRGBO(255, 218, 21, 0.8),
          Color.fromRGBO(23, 154, 195, 0.6),
        ]);
  }
}
