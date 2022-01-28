import 'package:direction/values/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:direction/src/methods/method_app.dart';

class HomePost extends StatefulWidget {
  const HomePost({Key? key}) : super(key: key);

  @override
  State<HomePost> createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: KWhiteTransparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          TextField(
            controller: titulo,
            decoration: const InputDecoration(
              filled: true,
              border: InputBorder.none,
              hintText: "Titulo",
            ),
          ),
          TextField(
            controller: contenido,
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: "Que Estas Pensando?",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    // color: KWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.image_search, color: Colors.black54),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    // color: KWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      HomePosteoFuncion(titulo.text, contenido.text);
                    },
                    icon: const Icon(Icons.send, color: Colors.black54),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
