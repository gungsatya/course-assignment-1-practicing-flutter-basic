import 'package:flutter/material.dart';

import 'dto/guestDto.dart';

class GuessOptions extends StatelessWidget {
  final List<GuessDto> guessDtos;
  final Function guessHandler;

  const GuessOptions(
      {Key? key, required this.guessDtos, required this.guessHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...guessDtos.map((dto) => OutlinedButton(
              onPressed: () => guessHandler(dto.response, dto.isItTrue),
              child: Text(dto.guessText),
              style: OutlinedButton.styleFrom(
                  primary: Colors.orange,
                  side: const BorderSide(color: Colors.orange)),
            ))
      ],
    );
  }
}
