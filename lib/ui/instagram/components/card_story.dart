import 'package:flutter/material.dart';

class CardStory extends StatelessWidget {
  const CardStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        child: Row(
          children: List.generate(
            10,
            (index) {
              var item = {};
              bool selected = index == 0;

              return Container(
                width: 80,
                height: 80,
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: index == 0
                        ? const Border()
                        : Border.all(width: 2, color: Colors.pink),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/550x/65/b9/3d/65b93d87f0b269a94d024235254cfe8e.jpg'),
                        fit: BoxFit.cover)),
                child: index == 0
                    ? Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              );
            },
          ),
        ),
      ),
    );
  }
}
