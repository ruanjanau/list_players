import 'package:flutter/material.dart';

class PlayersTile extends StatelessWidget {
  final String name;
  final String image;
  final String profession;
  const PlayersTile({
    super.key,
    required this.name,
    required this.profession,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffDDDDDD),
              blurRadius: 6.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 80.0,
                height: 80.0,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  profession,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
