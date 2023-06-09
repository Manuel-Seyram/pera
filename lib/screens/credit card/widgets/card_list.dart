import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import '../../../blocs/card/card_list_block.dart';
import '../../../models/credit card/card_model.dart';
import 'card_front_list.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StreamBuilder<List<CardResults>>(
      stream: cardListBloc.cardList,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 400.0,),
            !snapshot.hasData
                ? const Center(child: CircularProgressIndicator(strokeWidth: 2.0, color: Colors.white,))
                : SizedBox(
                    height: screenSize.height * 0.8,
                    child: AppinioSwiper(
                      cardsCount: snapshot.data!.length,
                      
                      cardsBuilder: (BuildContext context, int index) {
                        return CardFrontList(
                          cardModel: snapshot.data![index],
                        );
                      },
                    ))
          ],
        );
      },
    );
  }
}
