import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import '../../../blocs/national id/ghana_card_list_bloc.dart';
import '../../../models/national id/ghana_card_model.dart';
import 'ghana_card_front_list.dart';


  class GhanaCardList extends StatelessWidget {
    const GhanaCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StreamBuilder<List<GhanaCardResults>>(
      stream: ghanacardListBloc.ghanacardList,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            const SizedBox(
              height: 200.0,
            ),
            !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.white,
                  ))
                : Column(
                    children: [
                      SizedBox(
                          height: screenSize.height * 0.6,
                          width: screenSize.width * 0.8,
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
}
