import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../SongsController/SongsController.dart';

import 'package:provider/provider.dart';
import '../../Secondpage.dart';

class TopSixSingers extends StatelessWidget {
  const TopSixSingers({super.key});

  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<SongsController>(context);

    return SizedBox(
     
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.topsix.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3.2),
        itemBuilder: (context, index) {
          final data = provider.topsix[index];
          List topsix = [];
          if (data.category == 'Top six singers') {
            topsix.add(data);
          }
          return (data.category == 'Top six singers')
              ? InkWell(
                  onTap: () {
                    Get.to(SecondScreen(url: data.image, album: data.album));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 60,
                          child: Text(data.singer,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(
                  width: 0,
                );
        },
      ),
    );
  }
}
