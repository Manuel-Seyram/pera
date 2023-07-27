import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_provider.dart';
import '../../../blocs/card/card_bloc.dart';
import '../../../blocs/card/card_list_block.dart';
import '../../../models/credit card/card_model.dart';
import '../../widgets/pera_button.dart';
import '../create_card.dart';
import 'card_front_list.dart';

class CardList extends StatelessWidget {
  final String buttonText;
  const CardList({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StreamBuilder<List<CardResults>>(
      stream: cardListBloc.cardList,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image. asset('assets/home-icon-credit-card.png', height:150, width: 150,),
              const SizedBox(height: 10.0,),
              const Text(
                'No cards available yet',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              const SizedBox(height: 10,),
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
                      return CardFrontList(
                        cardModel: snapshot.data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  _toHome(BuildContext context) {
     var blocProviderCardCreate = BlocProvider(
      bloc: CardBloc(),
      child: const CardCreate(),
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
