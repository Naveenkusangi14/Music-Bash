import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotify/time/Timeconstant.dart';
import '../../../../SongsController/SongsController.dart';
import '../../../controllers/SongsController.dart';
import '../../Secondpage.dart';

class Hindi extends StatelessWidget {
  const Hindi({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongsController>(context);
    return Column(
      children: [
        const Text(
          'Hindi ',
          style: TextStyle(
             color: ConstantColors.titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      const  SizedBox(height: 10,),
        SizedBox(
          height: 180,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: provider.songs.length,
            itemBuilder: (context, index) {
              final data = provider.songs[index];
              return (data.category == 'Hindi')
                  ? Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        Get.to(SecondScreen(
                            url: data.image, album: data.album));
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 200,
                              height: 150,
                              child: Image.network(data.image,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.album,
                            style: const TextStyle(
                              color: ConstantColors.titleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : const SizedBox(
                      height: 0,
                    );
            },
          ),
        ),
      ],
    );
  }
}
