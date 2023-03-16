import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../SongsController/SongsController.dart';
import '../../../../time/Timeconstant.dart';
import '../../Secondpage.dart';
class English extends StatelessWidget {
  const English({super.key});

  @override
  Widget build(BuildContext context) {
final provider = Provider.of<SongsController>(context);
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            'English ',
            style: TextStyle(
             
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                  
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.songs.length,
                 
                  itemBuilder: (context, index) {
            final data = provider.songs[index];
            return (data.category == 'English')
                ? 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                      onTap: () {
                        Get.to(SecondScreen(url: data.image, album: data.album));
                      },
                      child: Column(
                        
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: 200,
                              height: 180,
                             child: Image.network(data.image,fit:BoxFit.cover),
                             
                            ),
                          ),
                         const SizedBox(height: 5,),
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
      ),
    );
  }
}
