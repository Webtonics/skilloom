import 'package:flutter/material.dart';

class CaroselBanner extends StatelessWidget {
  const CaroselBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      CaroselBannerItem(
        color: Colors.deepOrange,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.black54,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.blueAccent,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.redAccent,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.purpleAccent,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.deepOrange,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
      const SizedBox(
        width: 12,
      ),
      CaroselBannerItem(
        color: Colors.pinkAccent,
        title: "Lets Learn More",
        cTA: "Get Started",
        action: () {},
      ),
    ]);
  }
}
// 1  Colors.black54
// 2 "Lets Learn More"
// "Get Started"

class CaroselBannerItem extends StatelessWidget {
  const CaroselBannerItem(
      {super.key,
      required this.color,
      required this.title,
      required this.cTA,
      required this.action});

  final Color color;
  final String title;
  final String cTA;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        // color: Colors.greenAccent,
        color: color,
      ),
      child: Row(
        children: [
          //image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              TextButton(
                  onPressed: action,
                  child: Text(
                    cTA,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
