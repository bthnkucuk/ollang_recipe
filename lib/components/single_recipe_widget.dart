import 'package:flutter/material.dart';
import 'package:ollang_recipe/theme/text_style.dart';

class SingleRecipeWidget extends StatelessWidget {
  const SingleRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          //image
          Container(
            height: 75,
            width: 90,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1547&q=80",
                  ),
                )),
          ),
          //information
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Strawberry Hazelnut Salad',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            size: 20,
                          ),
                          Text(
                            "540 Kcal",
                            style: s9W400,
                          )
                        ],
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 20,
                          ),
                          Text(
                            "20 Min",
                            style: s9W400,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
          //favorite icon
          Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(10),
              child: Opacity(
                opacity: 0.5,
                child: const Icon(
                  Icons.favorite_border_sharp,
                  size: 27,
                ),
              ))
        ],
      ),
    );
  }
}
