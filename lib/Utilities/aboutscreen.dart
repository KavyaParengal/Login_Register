import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen();

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bacground.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          elevation: 0,
          title: Center(
            child: Text(
              'About           ',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/bacground.jpg').image,
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "App Description:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Shebirth-SukhPrasavam is a valuable resource for health and medical information. We provide accurate and reliable content to help you better understand various health topics and make informed decisions about your well-being.",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Key Features:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " Access to a wide range of health and medical information.\nContent sourced from credible and authoritative sources.\nRegular updates to ensure accuracy and relevance.",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Citations and Credible Sources:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " Our content is meticulously researched and referenced, with citations and links to reputable sources such as medical journals, government health agencies, and academic institutions. We are committed to providing you with trustworthy information that you can rely on.\nPlease note that while Shebirth-Sukh Prasavam offers valuable information, it is not a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare provider for personalized guidance on your health concerns.",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Disclaimer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Shebirth-Sukh Prasavam is a health tech App for Pregnant Mothers When a woman is pregnant she is happy at the same time experience Fear and lots of Doubts. It's mostly the 1st circle of Friends or Relatives whom she reaches out but unfortunately, they are not certified people to advise on Pregnancy, hence pregnant women end up Googling which in turn increases the confusion among the pregnant mother.The next reliable source is the doctor who helps her out but not with every small doubt or question since Patients are flooding the doctor's clinic and Doctors are literally busy.\nA pregnant woman expects lots of love from their family and especially her Husband but most of the time she is denied love and care in the name of mood swings and hormonal Changes.\nSHEBIRTH introduces Sukh Prasavam a tech and service-based project to give 360-degree support for Pregnant Women, and to give complete handholding throughout the journey of Pregnancy. One account Manager who is a trained Midwife will be allocated to every Pregnant Woman to give individual care and report the same to the doctor if needed. There are various other supports for pregnant women to prepare them mentally and physically for Labour.\n\nDoctors get a smart App through which they can monitor 300 Patients within 1 hour and predict complications early in Pregnancy using Artificial Intelligence.\n\nThe Pregnant Father app is also available to help the couple bond well and to increase the intimacy between them.\nFor more details visit www.shebirth.com",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Some citations for diagnosis reference-",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: citations.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return InkWell(
                            onTap: () {
                              //   launchUrl(Uri.parse(citations[index].link));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1})${citations[index].title}",
                                style: GoogleFonts.poppins(
                                    color: Colors.blueAccent, fontSize: 13),
                              ),
                            ));
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Citation> citations = [
    Citation(
      title: "Citation",
      link: "https://shebirth.com/citation/",
    ),
  ];
}

class Citation {
  String title;
  String link;

  Citation({required this.title, required this.link});
}
