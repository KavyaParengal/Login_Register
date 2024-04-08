import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Widgets/bulletList.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utilities/colors.dart';
import '../Utilities/global.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  final list1 = [
    "Complete an initial enquiry form on our website;",
    "Have contact with Gentle Birth Method Ltd through e-mail, phone;",
    "Have a treatment with one of Gentle Birth Method Ltd practitioners;",
    "Order goods from our website;",
    "Answer ad-hoc surveys or satisfaction questionnaires based on your customer experience;",
    "Provide us with your birth stories;",
    "Your publications/ mentions of our products on social networks;",
    "Interact with us via our official page on social networks or when we suggest re-use of content that you have published on a social network;",
    "Contact our customer service;",
    "Send requests for information to us;",
    "Take part in an event we organise;",
    "Browse on the Internet using cookies or similar technology or when you click on advertisements for our products.",
  ];

  final list2 = [
    "Your identity;",
    "Your contact details (e.g. email address);",
    "Information relating to your past medical history and your current medical situation (and your partners if relevant);",
    "Information regarding your current reasons for having treatment(s);",
    "A (signed) consent form and disclaimer regarding the use of herbs and supplements taken during pregnancy;",
    "Information relating to your orders, their tracking and your purchase invoices;",
    "Information you may provide for our customer service;",
    "Specific health data if you notify us of any undesirable side-effects concerning any of our products;",
    "Your bank details if you place an order via our website;",
    "Your publications/mentions relating to our products on social networks."
  ];

  final list3 = [
    "Be able to support and guide you through the Gentle Birth Method protocol(s) e.g. fertility, pregnancy and/or postnatal;",
    "Manage your treatments, classes, etc;",
    "Process and manage your online orders and their delivery;",
    "Secure online transactions, prevent fraud, payment incidents and manage debt collection (see our Terms & Conditions for more details) ;",
    "Manage customer relations with respect to any requests for information or complaints you may send us via our website, customer service or social network pages;",
    "Trace and manage any alerts you may send us as part of our ongoing customer vigilance;",
    "Manage and optimise your customer experience by improving our knowledge of our customers;",
    "Propose appropriate, tailored services, particularly when we enhance our products and services;",
    "Conduct statistical analyses to develop management, measuring and reporting tools in order to adjust and improve our sales, marketing and product manufacturing;",
    "Carry out analysis or statistics on the Gentle Birth Method as a whole or specific elements of it e.g. treatment, product;",
    "Request birth stories / outcomes for analysis of the Gentle Birth Method for publicity, research and/or to improve the programme;",
    "To analyse our brand performance on social networks in order to produce statistical analysis (market research, brand influence and campaign analysis);",
    "Promote our company;",
    "Manage your participation in the events for which you register;",
    "Send a generic newsletter and/or email: you have the right to object if you no longer wish to receive it;"
  ];

  final list4 = [
    "To perform the contract agreed between yourself and Gentle Birth Method Ltd, to manage your access to your customer account, and to process and track your orders;",
    "Our legitimate interest: for example, to improve our products and services, to defend ourselves, to secure our tools or to refine our customer knowledge through our third party partners' tools and in particular to:",
    "To define the personalised profile of our customers based on their interests and to provide them with relevant offers of our brand on other websites;",
    "Identify audiences similar to our target audience (in order to deliver our offers to audiences of people with similar profiles to our customers).",
    "When you have given your consent for the processing of your data, especially for the purposes of managing our personalized sales prospection, and of your browsing data via cookies, etc.",
    "Within the framework of compliance with our legal obligations, particularly fiscal obligations (conserving purchase invoices) and cosmetic vigilance with regard to Regulation (EU) 1223/2009 of 30 November 2009 on cosmetic products."
  ];

  final list5 = [
    "payment service providers, such as our trusted provider squarespace or stripe;",
    "our trusted IT support engineer."
  ];

  final list6 = [
    'Duration: 5 years from the date of first purchase',
    'Specificity: This period will be renewed each time you interact with Gentle Birth Method Ltd (e.g. a purchase)'
  ];

  final list7 = [
    'Duration: duration of the processing of the request plus 5 years. For exercises of rights, under GDPR, the request is kept during its treatment plus 6 years'
  ];

  final list8 = [
    'Duration: 10 years from the date of your first contact',
    'Specificity: This period will be renewed each time you interact with Gentle Birth Method Ltd (for example a request for information on Gentle Birth Method Ltd )'
  ];

  final list9 = [
    'Duration: Health records, or a copy, are kept up to 20 years from the date of last entry.',
    'Specificity: This period will be renewed each time you interact with Gentle Birth Method Ltd (e.g. have a new treatment)'
  ];

  final list10 = [
    'Right to information: you have the right to obtain clear, transparent and understandable information about how we use your personal data and about your rights. You will find all of this information in this policy.',
    'Right of access: you have the right to access the personal data Gentle Birth Method Ltd holds about you.',
    'Right of rectification: you have the right to have your personal data rectified if it is inaccurate or obsolete and / or to supplement it if it is incomplete.',
    'Right to erasure / right to be forgotten: you have the right to have your data erased or deleted. However, this right may be limited by a legal reason or our legitimate interest in keeping your personal data.',
    'Right of opposition: you can at any time request to no longer receive our communications relating to our offers, news and events.',
    'Right to withdraw consent at any time for data processing based on consent: you can withdraw your consent relating to our processing of your data when this processing is based on consent.',
    'Right to data portability: you have the right to move, copy or transfer data from our database to another. This right only applies to the data you have provided, and provided that the processing is based on a contract or your consent and carried out using automated processes.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                // )
                color: appBarColor
            ),
          ),
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          title: Text(
            'Privacy Policy',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "EU General Data Protection Regulation Compliance:",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Here at The ${Global().appName} and ${Global().appName} Shop we take your privacy seriously and will only use your personal information to provide the products and services you have purchased from us.\n\n"
                              "We do not pass your details onto any other company or organisation.\n\nWe are committed to ensuring that your information is secure.",style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Full GBM Ltd Privacy Policy",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${Global().appName} Ltd pays particular attention to the processing, confidentiality and safety of your personal data.\n\n"
                              "This aim of this privacy policy is to inform you in a clear, simple and complete information about how we process the personal data you give us, or that we may "
                              "collect through the various contacts you may have with us (e.g. shop, customer relations, website, social networks, digital "
                              "applications, events), their possible transfer to third parties, as well as your rights and the options you have to control your "
                              "personal information and protect your privacy, in compliance with the regulations in applicable.\n\n"
                              '${Global().appName} is a limited company, registered with Company House, London, number: 06150631. ${Global().appName} Ltd is  the data controller of personal data collected on the website www.gentlebirthmethod.com in the sense of regulations applying to personal data, in particular Regulation (EU) 2016/679 on the protection of natural persons with regard to the processing of personal data and the free movement of such data (hereinafter the \t"GDPR").',style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅰ.  What is personal data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Personal data is any information about an identified physical person or a physical person that may be directly or indirectly identified via an identification number or one or more elements particular to them, such as their last name, first name, date of birth, customer number, order number, photo, etc.",style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅱ.  When can we collect your personal data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "We can collect your personal data when you:",style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list1),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Visitors to the ${Global().appName} Ltd website who browse our products, information and offers may choose to do so without identifying themselves, as well as for point-of-sale searches and social networking.",
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                              textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅲ.  What personal data might we collect?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'ⅰ)',
                            style: TextStyle(color: Colors.black
                                , fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: '   As part of the services we provide, we may need to collect certain data directly from you using electronic forms on our website for a range of purposes (see IV for a list of processing purposes) which are limited to those that are relevant and appropriate for that interaction.\n\n'
                                  'Information we might collect includes:',style:
                              GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list2),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Personal data essential to Gentle Birth Method Ltd if you do not fill in these compulsory fields, Gentle Birth Method Ltd will probably be unable to respond to your request and/or provide you with the requested services. \n\n'
                              'When purchasing from Gentle Birth Method Ltd your information is collected for the process of payment and delivery of items or for Gentle Birth Method Ltd in order to comply with applicable laws. Your information may also be used for analytical purposes by Gentle Birth Method Ltd and for communication purposes via its preferred channel (for example: sending a general newsletter relating to the news of our products by email for which you have the right to object). For more information on these purposes, please go to the section "For what purpose is your personal data collected and used?".',
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'ⅱ)',
                            style: TextStyle(color: Colors.black
                                , fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: '   We may also collect certain data generated by your purchases of products or services, online, particularly information regarding the amount and type of your purchases.',style:
                              GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'ⅲ)',
                            style: TextStyle(color: Colors.black
                                , fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: '   Lastly, we may collect information regarding the use of our website, especially with respect to your browsing (pages visited, links clicked, etc.). Some of this information may be collected using cookies placed in your web browser when you browse our website. For more information about cookies, read our cookie policy, here\n\n'
                                  'We invite you to ensure that your data is regularly updated, either by modifying it directly on our sites or by informing us in writing of any modification by referring to the dedicated section "X".   "What are your rights and how can you exercise them? ".',style:
                              GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅳ.  For what purpose is your personal data collected and used?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Gentle Birth Method Ltd processes your data to:',
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list3),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅴ.  What legal grounds legitimise the processing of your data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Gentle Birth Method Ltd processes your personal information:',
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅵ.  Who are the recipients of your personal data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your personal data is processed by the personnel of Gentle Birth Method Ltd. We ensure that only authorised persons within Gentle Birth Method Ltd have access to your personal data when this is necessary for the purpose of providing you with your requested treatments or the support you are requesting for fertility / pregnancy / postnatal or managing our commercial relations or meeting our legal obligations.\n\n'
                              'We may also disclose your personal data, if possible, in a format that does not allow direct identification, to subcontractors, such as:',
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list5),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Lastly, Gentle Birth Method Ltd may need to share your personal data with third parties to meet its legal, regulatory or treaty obligations, or to respond to requests from authorised legal authorities.',
                          style: GoogleFonts.poppins(
                              color: Colors.teal.shade900, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅶ.  How do we ensure the protection and confidentiality of your data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'The security measures we have in place are evaluated and updated to meet new threats and challenges.\n\n'
                            'We require our Practitioners and Subcontractors to maintain a similar level of protection for your personal data as we do. We take reasonable precautions to ensure the confidentiality and security of your data and that it is not distorted, damaged, destroyed or accessed by unauthorised third parties.',
                        style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: '\nPayments are made via a secure payment platform, supplemented by control measures, in order to guarantee the security of purchases made on ',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900)),
                          children: <TextSpan>[
                            TextSpan(text: 'www.gentlebirthmethod.com. ',style:
                              GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13,color: Colors.teal.shade500)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://www.gentlebirthmethod.com/');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅷ.  How long do we keep your data?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'The legal retention periods defined by Gentle Birth Method Ltd comply with the recommendations of the Personal Data Authority of your country and/or the legal obligations to which Gentle Birth Method Ltd is subject.\n\n'
                            'We keep your personal data only for as long as is necessary to fulfil the purpose for which it was collected, to meet your needs, or to comply with our legal obligations.\n\n'
                            'In general, your personal data is kept in our database:',style: GoogleFonts.poppins(
                            color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Data subject: Client ‘Guest’ (purchase) ',style: GoogleFonts.poppins(
                          color: Colors.teal.shade900, fontSize: 13, decoration: TextDecoration.underline, ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list6),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Data subject: customer care (i.e.: complaints or information) ',style: GoogleFonts.poppins(
                        color: Colors.teal.shade900, fontSize: 13, decoration: TextDecoration.underline, ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list7),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Data subject: Privileged interlocutors (e.g. agents, stylists, journalist, celebrity managers, artists) in relation to Gentle Birth Method Ltd  Public Relations services  ',style: GoogleFonts.poppins(
                        color: Colors.teal.shade900, fontSize: 13, decoration: TextDecoration.underline, ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list8),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Data subject: Client (treatments and/or classes and/or consultations) ',style: GoogleFonts.poppins(
                        color: Colors.teal.shade900, fontSize: 13, decoration: TextDecoration.underline, ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Note: GBM Ltd believe it is important to keep health care records as clients may have subsequent treatments (e.g. future pregnancy) and the records help inform the Practitioner. In addition, the notes may be needed by the client or other health care professionals in the future.',style: GoogleFonts.poppins(
                          color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list9),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'If cookies are placed on your computer, we keep them for a maximum of 6 months.\n\n'
                            'When we no longer need to use your personal data, it is deleted from our systems and our registers or made anonymous so that it can no longer be identified, subject to retention for archival purposes. ',style: GoogleFonts.poppins(
                          color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅸ.  What are your rights and how can you exercise them?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gentle Birth Method Ltd has adopted the data protection and security practices described in this privacy policy for all individuals concerned. In addition, we also adhere to those required for residents of the European Union / European Economic Area under the General EU Data Protection Regulation (GDPR) 2016/679.\n\n'
                            'In particular, the GDPR provides the following rights:',style: GoogleFonts.poppins(
                          color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                      child: BulletList(list10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('These rights can be exercised directly with Gentle Birth Method Ltd by e-mail to gowrimotha@gentlebirthmethod.com or by post to 34, Cleveland Road, South Woodford, London, E18 2AL, UK.\n\n'
                          'We wish to inform you that you are free to contact the Information, Commissioner’s Office (ICO) at any time. Tel. 0303 123 1113 Website: https://ico.org.uk/\n\n'
                          'Or other authorities in Europe that you can find and contact on the website of the European Data Protection Board: https://edpb.europa.eu/about-edpb/board/members_fr',style: GoogleFonts.poppins(
                          color: Colors.teal.shade900, fontSize: 12),
                        textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ⅹ.  Contact details about data protection and Gentle Birth Method Ltd",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: 'For all questions relating to the collection and processing of your data by Gentle Birth Method Ltd you can contact the Gentle Birth Method Ltd office at: ',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900)),
                          children: <TextSpan>[
                            TextSpan(text: 'gowrimotha@gentlebirthmethod.com .',style:
                            GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13,color: Colors.teal.shade900)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 22),
                      child: Text('Last update: 16/6/2023',style: GoogleFonts.poppins(
                          fontSize: 13),
                        textAlign: TextAlign.justify,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
