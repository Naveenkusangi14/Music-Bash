import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../SongsController/SongsController.dart';
import '../../../controllers/SongsController.dart';
import 'package:provider/provider.dart';
import '../../Secondpage.dart';

class TopSixSingers extends StatelessWidget {
  const TopSixSingers({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<SongsController>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.songs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 12 / 4.5),
        itemBuilder: (context, index) {
          final data = provider.songs[index];
          return (data.category == 'Top six singers')
              ? Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                    onTap: () {
                      Get.to(SecondScreen(url: data.image, album: data.album));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
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
                            width: MediaQuery.of(context).size.width / 6,
                            height: 60,
                            child: Center(
                              child: Text(data.singer,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              )
              : const SizedBox(
                  height: 0,
                );
        },
      ),
    );
  }
}
