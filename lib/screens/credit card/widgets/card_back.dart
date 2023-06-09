import 'package:flutter/material.dart';

import '../../../blocs/card/bloc_provider.dart';
import '../../../blocs/card/card_bloc.dart';
import '../../../helpers/card_colors.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final CardBloc? bloc = BlocProvider.of<CardBloc>(context);

    return StreamBuilder<int>(
        stream: bloc?.cardColorIndexSelected,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: snapshot.hasData
                  ? CardColor.baseColors[snapshot.data!]
                  : CardColor.baseColors[0],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Image(
                        image: AssetImage('assets/card_band.jpg'),
                        width: 220.0,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        width: 65.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.red, width: 3.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: StreamBuilder(
                              stream: bloc?.cardCvv,
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData ? snapshot.data! : '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 12.0),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(10.0),
                      child: const Image(
                          image: AssetImage('assets/card_back.jpg'),
                          width: 65.0,
                          height: 40.0,
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
