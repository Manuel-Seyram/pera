import 'package:flutter/material.dart';

import '../../../blocs/bloc_provider.dart';
import '../../../blocs/national id/ghana_card_bloc.dart';
import '../../../helpers/ghana_card_color.dart';


class GhanaCardBack extends StatelessWidget {
  const GhanaCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final GhanaCardBloc? bloc = BlocProvider.of<GhanaCardBloc>(context);

    return StreamBuilder<int>(
        stream: bloc?.ghanacardColorIndexSelected,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: snapshot.hasData
                  ? GhanaCardColor.baseColors[snapshot.data!]
                  : GhanaCardColor.baseColors[0],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      Image(
                        image: AssetImage('assets/card_band.jpg'),
                        width: 220.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
