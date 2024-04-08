import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/BottomNavigationBar.dart';
import 'package:login_register/Utilities/global.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Client-Dashboard/Screens/home_page.dart';
import '../Utilities/colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  late YoutubePlayerController _controller;
  bool _isPlayerReady = true;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String videoId = YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=4LN8IQ2_iKs&t=2s')!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBottomBar(1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: appBarColor
            ),
          ),
          elevation: 0,
          centerTitle: false,
          title: Text(
            Global().appName,
            maxLines: 1,
            style: TextStyle(
              //fontSize: 18.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Gilroy',
            ),
            textAlign: TextAlign.start,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: const Icon(Icons.home,color: Colors.white,))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/image-asset.jpeg'), fit: BoxFit.fill)
              ),
              child: Center(
                child: Text('About Gowri', style: GoogleFonts.headlandOne(
                  fontWeight : FontWeight.bold,
                  fontSize: 26, color: Colors.white
                ),),
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Image.asset('assets/small+leaf.png', ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Dr Marie Gowri Motha is a London based childbirth pioneer who has prepared mothers and fathers to have gentle births.  As part of her quest to help mothers to look forward to giving birth, she introduced water births into the NHS in the eighties and was the first doctor to conduct a documented water birth within a London NHS hospital.',
                style: GoogleFonts.questrial(
                  fontSize: 18
                ),
              ),
            ),
            _buildContent('Gowri and her close-knit team of complementary practitioners are dedicated to guiding mothers throughout their pregnancy by offering a programme of classes, key treatments, and dietary guidelines during pregnancy all the way to birth. '),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    letterSpacing: 1
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Dr Motha’s acclaimed book, ',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, color: Colors.black))),
                    TextSpan(text: '‘Gentle Birth Method’ ',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black))),
                    TextSpan(text: 'was published in 2004 and was written so that mothers all over the world could experience the benefits of a gentle birth.  The GBM book has an enthusiastic following here in the UK and in several countries worldwide.',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, color: Colors.black))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      letterSpacing: 1
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Dr Motha’s follow-up book, ',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, color: Colors.black))),
                    TextSpan(text: '‘Gentle First Year’ ',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black))),
                    TextSpan(text: 'was published in 2006 .',style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17, color: Colors.black))),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                child: Text('Gentle Birth Method',style:
                GoogleFonts.headlandOne(textStyle: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold))),
            ),
            _buildContent('During her twelve years within the NHS as an Obstetrician, Gowri observed the benefits of integrating Self Hypnosis and Visualisation classes for a gentle birth along with complementary treatments such as Pregnancy Reflexology, the Bowen Technique, Cranio- Sacral technique, Ayurvedic lifestyle advice, Pregnancy Yoga with Micro-movements for Pelvic Release and the Alexander Technique for Pregnancy. The Gentle Birth Method offers a practical and effective week by week programme to give mothers the ability and confidence that they are able to have an enjoyable pregnancy, for the contractions to be manageable and birthing to be an empowering experience – and helps babies feel safe within the womb. \n\n'
                'Birthing is a very special function of a mother’s body and as such it needs special care and preparation. Developed for all mothers to become ‘birth-fit’ the programme works on three levels:'),
            buildBullet('Physical Condition', 'In order to be ‘birth-fit’, Dr Motha has identified specific treatments, diet and supplements to prepare your body.'),
            buildBullet('Mental Attitude', 'Develop your mental strength through carefully conceived visualisation and self-hypnosis techniques, specifically developed by Gowri over the years.  The Gentle Birth Method Hypnobirth ‘The Gowri Way’ focuses on: removal of fear of the birth process; installing confidence that her body can give birth; and deepens the bond between the mother, father and baby. (Note: Our self-hypnosis and visualisation course was  previously known as ‘The Jeyarani Way’ after Gowri’s mother.)'),
            buildBullet('Emotional', 'Learn how to bond with your baby in the womb and extend a loving welcome to your unborn baby. '),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 22, bottom: 15),
              child: Text('Interview with Gowri on the Gentle Birth Method',style:
              GoogleFonts.headlandOne(textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                      aspectRatio: 16 / 9,
                      bottomActions: [],
                      topActions: [],
                      showVideoProgressIndicator: false,
                      controller: _controller),
                  builder: (context, player) {
                    return Container(
                      child: player,
                    );
                  }),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  Column buildBullet(String title, String content) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(' . ', style: TextStyle(color: Colors.black
                        , fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(title,style:
                    GoogleFonts.questrial(textStyle: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(content,style:
                GoogleFonts.questrial(textStyle: TextStyle(fontSize: 17,color: Colors.black))),
              ),
            ],
          );
  }

  Padding _buildContent(String content) {
    return Padding(
              padding: EdgeInsets.all(15),
            child: Text(
              content,
              style: GoogleFonts.questrial(
                  fontSize: 17
              ),
            ),
          );
  }
}
