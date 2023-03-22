import 'package:flutter/material.dart';
import 'login.dart';
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image:
           NetworkImage('https://1.bp.blogspot.com/-nucvK393GJI/X8-Mk4asWBI/AAAAAAAAD0g/TK8Hrut8H9MCqPBa37Tlkc2WCMNONrZRACLcBGAsYHQ/s0/HDgallery%2BPanja%2B1.jpeg'),
          fit: BoxFit.cover
          ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
             // ignore: prefer_const_constructors
             Center(
               child: const Text('Welcome to the Spotify',
               style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, 
               ),
               ),
             ),
              const SizedBox(height: 32,),
           MaterialButton(
            color: Colors.white24,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
              height: 58,
              onPressed: () =>
               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
              child:  const Text('Get Started',
               style: TextStyle(color: Colors.black, 
               fontSize: 18,
               fontWeight: FontWeight.bold),) ,
            ),
            const SizedBox(height: 32,)
              ],
          ),
      )
 
    );
  }
}