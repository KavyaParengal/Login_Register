
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/bulletList.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {

  final list1 = [
    'The Customer’s order will be validated, and there will be a partial refund into his/her bank account,',
    'The Customer will be informed at the earliest by email or telephone of the unavailability of the Product(s) concerned,',
    'The Customer will receive the available Products.'
  ];

  final list2 = [
      'Fill in the virtual shopping bag by clicking on the icon "Add to cart" and indicating the Products concerned.',
      'Click on the button "Checkout".',
      'Fill in the identification form on which the Customer indicates all the personal details requested (complete identity, email address, telephone number, delivery address). Please refer to Gentle Birth Method Ltd’s privacy policy; for details on how Gentle Birth Method Ltd collects and processes personal data.',
      'The fastest delivery method is automatic depending on your delivery address.',
      'In the event that the billing address and the identification details are the same as the details already given for delivery, validate the pre-filled fields with these details. Otherwise, indicate the billing address and the identification details if they are different.',
      'The Customer is asked to enter any discount code and their payment card details directly on the Website through the secure server of the payment service provider Stripe following the conditions requested (Visa and Mastercard only) – please refer to Article 8 below (Payment terms) for more information. ',
      'The ‘Review & Purchase’ is the final section. At this stage the Customer can see the Returns Policy and Terms of Service. The Customer should only click on the box ‘Purchase’ if they accept the Returns Policy and Terms of Service.'
  ];

  final list3 = [
    'See point 9 for full RIGHT TO CANCEL AND RETURNS.',
    'Terms of Service are these General Terms and Conditions of Sale.',
    'Potential Additional Costs to the Customer: The Customer may be asked to pay customs duties, import tax and courier handling fees on any order outside of the UK. These costs are out of control of Gentle Birth Method Ltd and paying this additional charge is the sole responsibility of the Customer.  By clicking on ‘Purchase’ the Customer is accepting this condition.'
  ];

  final list4 = [
    'Number of Products ordered exceeds the maximum provided in the present Article 6.1.',
    'Litigation with the Customer.',
    'Total or partial non-payment of a previous order by the Customer.',
    'Refusal of authorization of payment per credit card by payment agencies including Stripe Payments, which are the payment service providers and anti-fraud service providers used by Gentle Birth Method Ltd.',
    'Abnormal nature of the order, particularly regarding quantities and/or amounts which does not correspond to the personal use of a final consumer.'
  ];

  final list5 = [
    'All of our oil based products e.g. vaginal oil.',
    'Our homeopathy kits',
    'Any edible products e.g. Teas, Energy Balls and supplements'
  ];

  final list6 = [
    'the day on which Gentle Birth Method Ltd receives the returned Products, or ',
    'the day on which the Customer provides Gentle Birth Method Ltd with proof of expedition of the Products concerned by the exercise of the Customer’s right to cancel,whichever of these days occurs first.'
  ];

  final list7 = [
    'If the Product returned is still available/ in stock, Gentle Birth Method Ltd will propose to send a new Product to the Customer. The cost of a new delivery will be borne by Gentle Birth Method Ltd.',
    'If the Product is not available at the relevant time or if the Customer prefers an immediate refund, Gentle Birth Method Ltd will refund the price of the defective Product and the delivery costs of the original method of payment, within a maximum of fourteen (14) days upon receipt of the Product, to the exclusion of any other compensation.'
  ];

  final list8 = [
    'Up to 30 days: if your goods are faulty, then you can get an immediate refund;',
    'Up to six months: if your goods cannot be repaired or replaced, then you are entitled to a full refund, in most cases;',
    'Up to six years: if your goods do not last a reasonable length of time you may be entitled to some money back.'
    ];

  final list9 = [
    'Interruptions, malfunctions, or delays recorded on the Website due to technical failures, because of third parties or any circumstances beyond Gentle Birth Method Ltd’s reasonable control.',
    "The impossibility or temporary inability for the Customer to access the Website, due to circumstances which are beyond Gentle Birth Method Ltd’s control, such as computer breakdown, interruptions of any network, the Internet, or the failure of the Customer's reception equipment for the Internet or any similar event."
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
                gradient: LinearGradient(
                    colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                )
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
            'Terms and Conditions',
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle("General Terms and Conditions ", 15),
              buildContent("The present general terms and conditions of sale apply to all and any orders placed on Gentle Birth Method Ltd website. It also covers orders placed in person with a Gentle Birth Method Practitioner and at Gentle Birth Method clinic locations. "),
              buildTitle("Who we are:", 15),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Gentle Birth Method Ltd is a limited company registered with Company House, London, UK. Company number: 06150631\n\n"
                        "Electronic contact: gowrimotha@gentlebirthmethod.com\n\n"
                        "Gentle Birth Method Ltd is a company under the trademark Gentle Birth Method.\n\n"
                        "Gentle Birth Method Ltd trades products on its website solely for individual Consumers. Any order not corresponding to a retail sale and any fraudulent or assumedly fraudulent order shall be treated by Gentle Birth Method Ltd as void and shall not be processed.",style: GoogleFonts.poppins(
                      color: Colors.teal.shade900, fontSize: 12),
                  ),
                ),
              ),
              buildTitle('1. DEFINITIONS', 15),

              buildDefinitions('"Consumer"', " means (i) an individual and (ii) someone acting wholly or mainly outside of their business, trade, craft or profession."),
              buildDefinitions('"Contract"', ' means the contract made between the Parties each time an order is finalised under Article 6.3 of these General Terms and Conditions of Sale.'),
              buildDefinitions('"Customer(s)"', ' means the user(s) browsing the website and placing an order of Product(s) for personal use.'),
              buildDefinitions('"Disclaimer"', ' means that the Gentle Birth Method is not responsible for something.'),
              buildDefinitions('"General Terms and Conditions of Sale"', ' means these general terms and conditions applying to any and all sales of Products presented on the website.'),
              buildDefinitions('"Party(ies)"', ' means collectively or individually Gentle Birth Method Ltd and/or the Customer(s).'),
              buildDefinitions('"Product(s)"', ' means all products presented for sale on the Gentle Birth Method Website. It includes physical products as well as classes, treatments, consultations, etc that are sold and/or paid for through the website.'),
              buildDefinitions('"Treatment(s)"', ' means all treatments by a Gentle Birth Method Practitioner presented on the Gentle Birth Method Website. For this document ‘Treatment’s’ are included under the heading of ‘Products’ (see above)'),
              buildDefinitions('"Website"', ' means the Gentle Birth Method Ltd online sales website, which is accessible via https://www.mariegowrimothaltd.com , and offers the Products for sale.'),

              buildTitle('2. SCOPE OF THE GENERAL TERMS AND CONDITIONS OF SALE', 15),
              buildContent('These General Terms and Conditions of Sale set out the terms and conditions under which Gentle Birth Method Ltd shall proceed to the sale and delivery of Products ordered by Customers via the Website and define the Parties’ rights and obligations as to the sale of Products offered by Gentle Birth Method Ltd on the Website.\n\n'
                  'The General Terms and Conditions of Sale can always be found by the Customer on www.gentlebirthmethod.com and shall be communicated to the Customer on simple request via email at gowrimotha@gentlebirthmethod.com\n\n'
                  'By placing an order for a Product offered on the Website, the Customer recognizes – by clicking on the box ‘Purchase’ in the ‘Review and Purchase’ section that sets out the ‘Return Policy’ and ‘Terms of Service’ – that he/she has been fully informed on and accepted such General Terms and Conditions of Sale without limitation before placing his/her order. This acceptance is in no way conditioned by a handwritten signature on the part of the Customer.\n\n'
                  'Please note that a hyperlink to the latter will be sent to the Customer with the confirmation email of order.\n\nGentle Birth Method Ltd reserves the right to amend, at any time, the General Terms and Conditions of Sale. In the event of an amendment of the General Terms and Conditions of Sale, the General Terms and Conditions of Sale applicable are those in force on the date of the order and sent, via a hyperlink, with the order confirmation email.\n\nContinued access and use of the website after changes have been made to this agreement constitutes your acceptance of the revised agreement then in effect. You agree that you will review this agreement periodically and that you shall be bound by this agreement and any modifications to it.\n\nThe General Terms and Conditions of Sale shall apply without limitation to any sale of Products on the Website, excluding any other document and particularly the conditions applicable to sales in stores or through any other distribution and marketing channel.'),

              buildTitle('3. PRODUCTS', 15),

              buildTitle('3.1 Products description', 15),
              buildContent('The Products offered for sale by Gentle Birth Method Ltd are those presented on the Website at the date of connection of the Customer, within the limits of available stocks.  Gentle Birth Method products means all products bearing the Gentle Birth Method Ltd brand name, which are presented for sale on the Website; this includes physical products as well as classes, treatments, consultations, etc that are sold and/or paid for through the website.\n\n'
                  'Gentle Birth Method Ltd reserves the right to withdraw Products from sale at any time and without notice.\n\n'
                  'Gentle Birth Method Ltd puts the utmost care in the presentation of the Products on the Website. However, pictures illustrating the Products shall only be for information and are not contractual.\n\n'
                  'Indeed, while Gentle Birth Method Ltd makes its best efforts to ensure that the colour of the Products – whose photos are displayed on the Website – are faithful to the original, variations may occur (including slight differences in colours and proportions), particularly given the technical limitations of colour renderings of computer equipment. Consequently, Gentle Birth Method Ltd shall not be responsible if the Product varies from those images. The packaging of Products may vary from that shown in images on the Website.\n\n'
                  'For any question or concerns regarding the order and appropriate use of Products, the Customer may contact Gentle Birth Method Ltd Customer Service: gowrimotha@gentlebirthmethod.com'),

              buildTitle('3.2 Products availability', 15),
              buildContent('The Products displayed on the Website are offered for sale within the limit of available stocks. Gentle Birth Method Ltd does not guarantee the availability of the Products. In the event of the unavailability of one or several Product(s) after an order is completed, Gentle Birth Method Ltd will inform the Customer at the earliest by email or telephone of the unavailability of the Product(s) and the partial or full cancellation of his/her order.\n\n'
                  'Should the order be totally cancelled for unavailability, the Customer’s order shall be cancelled and his/her order will be refunded in 4-5 working days.\n\n'
                  'Should the order be partially cancelled for unavailability:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list1),
              ),

              buildTitle('4. PRICE', 15),
              buildContent('All Products prices are firm. Prices are given in pounds sterling (£) all taxes included. The price in force is the one indicated for each Product on the Website. These prices include all taxes applicable on the day of the order but exclude any delivery costs, which will be charged additionally and will be specified to the Customer prior to the order being finalised.\n\n'
                  'Delivery costs will be indicated to the Customer before the validation of the order. The present General Terms and Conditions of Sale provide delivery methods, which may be modified at any time by Gentle Birth Method Ltd.\n\n'
                  'The invoiced price is the price indicated to the Customer on the order confirmation page, which appears on screen at the order confirmation and is sent by Gentle Birth Method Ltd to the Customer by email.\n\n'
                  'Gentle Birth Method Ltd reserves the right, and the Customer accepts, to modify the price of the Products at any moment, without any further formalities than to make the changes available on the Website. These changes may not affect the orders validated by the Customer prior to the coming into force of these changes, subject to the availability of the Products ordered.'),

              buildTitle('5. RESERVATION OF OWNERSHIP', 15),
              buildContent('The Products ordered shall remain the property of Gentle Birth Method Ltd until complete payment of their value, including the main value of Products, as well as any costs and taxes included in the invoice/receipt, and the applicable delivery costs.'),

              buildTitle('6. ORDERS', 15),
              buildTitle('6.1 Conditions of ordering', 15),
              buildContent('Gentle Birth Method Ltd sells Products via the Website to Consumers, it also sells Products directly to clients. Products are solely intended for the Customer personal use, excluding any connection to his/her professional capacity. As a consequence, any order exceeding five (5) units bearing the same reference shall not be accepted as it is not presumed to correspond to the consumption and personal use of a Customer.\n\n'
                  'In the event of an order of Products exceeding this maximum, the order shall be considered as null and will not be taken into account by Gentle Birth Method Ltd. The same would apply if the Customer orders more than 5 (five) units of the same product in subsequent orders over a short period of time.\n\n'
                  'To place an order on the Website, the Customer must be of legal age, have legal capacity, have a bank account and hold a credit card.'),

              buildTitle('6.2 Website order process', 15),
              buildContent('To place an order via the website, the Customer must proceed to the following steps:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list2),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 30, right: 8, bottom: 8 ),
                child: BulletList(list3),
              ),
              buildContent('Until the "Purchase" step, the Customer has the possibility to modify his/her order by clicking on the icon "Edit" on the right side of the various boxes. This allows the Customer to correct any errors he/she could have made while completing the various fields.\n\n'
                  'In case that the Customer wishes to modify his/her order, the Customer can click on the return arrow on the top left of his/her screen. The Customer will then be redirected to his/her virtual shopping bag, where he/she can modify his/her order.\n\n'
                  'As the Customer confirms his/her order by clicking on the "Purchase" icon, the Customer can no longer modify or cancel his/her order before proceeding to payment.\n\n'
                  'This does not constitute Gentle Birth Method Ltd’s acceptance of the Customer’s order and a Contract between the Parties is not formed until the order is validated by Gentle Birth Method Ltd as explained under Article 6.3 below.'),

              buildTitle('6.3 Final validation of the order – How is a Contract formed?', 15),
              buildContent('Following the validation of the payment by the Customer, a confirmation of the order will be sent by email to the Customer by Gentle Birth Method Ltd. The order confirmation includes the summary of the Products ordered, the price, the delivery costs and the order number. It mentions a hyperlink to the General Sales Conditions containing the right of cancellation.\n\n'
                  'A Contract between the Parties is formed when the Customer receives the order confirmation by email detailed above from Gentle Birth Method Ltd.'),

              buildTitle('6.4 Order refusal', 15),
              buildContent('Gentle Birth Method Ltd reserves the right to refuse any order in the event of:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list4),
              ),

              buildTitle('7. ARCHIVING AND PROOF OF THE CONTRACT', 15),
              buildContent('The details of the Contract will not be filed by Gentle Birth Method Ltd unless the order exceeds the value of £103, in which case Gentle Birth Method Ltd will archive the Contract for a period of 10 years following the date of the last delivery of the order.\n\n'
                  'Gentle Birth Method Ltd recommends that the Customer prints the ‘General Terms and Conditions of Sale’ for future reference.\n\n'
                  'The Customer may, at any time, request details of his/her order(s) by making the request via email: gowrimotha@gentlebirthmethod.com'),
              buildTitle('8. PAYMENT', 15),
              buildTitle('Payments by cards', 15),
              buildContent('Gentle Birth Method Ltd accepts payment by debit or credit card (Visa and Mastercard exclusively). The Customer enters his/her credit card number, the expiration date of the credit card, the name of the cardholder and the card security code (the last three or four numbers on the back of the credit card).\n\n'
                  'Payment is made by using the secured server of the payment service provider Stripe Payments (see below for more information) integrated into the Website. This means that none of the Customer’s bank information is processed by Gentle Birth Method Ltd on the Website. The payment by credit card is completely secured.\n\n'
                  'Any and all orders are payable in GBP (pound sterling) and are inclusive of VAT.\n\nThe credit card is charged at the time of dispatch of the order.'),

              buildTitle('Other Payments Methods', 15),
              buildContent('Cash and cheque payments are not accepted.\n\n'
                  'Payment for Products (including payment of invoices) by bank transfer are accepted, contact gowrimotha@gentlebirthmethod.com for bank details.\n\n'
                  'Private payment links for Products can be generated by the office of Gentle Birth Method Ltd. These are generally for Customers who have had several treatments and products and require a single link rather than going through the website. These are emailed to the client and are processed through the normal Website and payment service provider Stripe Payments.\n\n'
                  'Payments can also be taken by the Kailash Centre (7 Newcourt St, London NW8 7AA) for Gentle Birth Method Products received at the Centre (namely Customer treatments and products from the therapists) and through the Gentle Birth Method Practitioners phones. '),

              buildTitle('General', 15),
              buildContent('The Customer guarantees Gentle Birth Method Ltd that he/she has the authorizations required to use the chosen method of payment at the time of the order validation. In case of refusal of the bank, the order will be automatically cancelled and Gentle Birth Method Ltd will not be responsible for the Customer’s order being cancelled.\n\n'
                  'We may use a third-party payment processor, including our electronic payment server Stripe Payment, to process your payment information, including your payment card data. Be aware that you may be subject to the third-party processor’s terms and your information may be subject to their privacy practices.'),

              buildTitle('Who receives data?', 15),
              buildContent('Squarespace, Stripe, Gentle Birth Method Ltd and the Kailash Centre (when Products are paid for at the centre) are recipients of the data related to the Customer’s order. The non-transmission of the data related to the Customer’s order prevents the execution and analysis of the transaction. Please refer to Gentle Birth Method Ltd’s privacy policy for details on how Gentle Birth Method Ltd collects and processes personal data.\n\n'
                  'Should any payment incident occur in connection with a fraudulent use of a credit card or any other method of payment, the data set out on the corresponding order shall be recorded in a "payment incident" file implemented by our service providers. Any incorrect declaration or anomaly may also be subject to a specific treatment.\n\n'
                  'The Customer has, at any time, the right to access, modify and delete (and others) his/her own personal data by writing to Gentle Birth Method Ltd, via email available on the Website. For more information, please refer to Gentle Birth Method ’s Ltd privacy policy.\n\n'
                  'If at any time the server is unavailable Gentle Birth Method Ltd will be unable to accept orders through the Website and accepts no responsibility to the Customer for his/her inability to make an order.'),

              buildTitle('9. RIGHT TO CANCEL AND PRODUCTS RETURN', 15),
              buildContent('For any reason whatsoever the Customer may exercise his/her right to cancel within fourteen (14) days from the date of the Customer’s receipt of the parcel, as provided in the Consumer Contracts (Information, Cancellation and Additional Charges) Regulations 2013. If Gentle Birth Method Ltd sends to the Customer multiple products from one order in separate parcels, these fourteen (14) days will start to run on the date the Customer receives the last parcel forming part of his/her order.\n\n'
                  'To exercise his/her right to cancel, the Customer must make a clear statement to that effect by email (gowrimotha@gentlebirthmethod.com).\n\n'
                  'Gentle Birth Method Ltd shall acknowledge receipt of the cancellation without delay by sending an email to the Customer.\n\n'
                  'As from the exercise of his/her right to cancel, the Customer shall have an additional fourteen (14) days period to return the Products ordered.\n\n'
                  'All unsealed, open and/or used products shall not be accepted for return for hygiene and health protection reasons, including: '),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list5),
              ),
              buildContent('Note: Tummy Wraps can be tried on but must be unwashed.\n\n'
                  'With the above exceptions the Customer must return the Products in perfect condition and in original packaging, unopened, so that the Products can be remarketed.\n\n'
                  'If the Customer is entitled to return Products under the conditions above, the Customer may return his/her order at their own cost via their choice of courier. If the Customer does not return his/her order, Gentle Birth Method Ltd will be unable to reimburse the Customer for the cost of the returned Products, except in case of a non-conformity of the Products delivered with the ordered ones (in such case, costs of return shall be borne by Gentle Birth Method Ltd). The Customer shall be responsible for any and all risks linked to the return of the Product(s).\n\n'
                  'If the above conditions are fulfilled, Gentle Birth Method Ltd shall reimburse to the Customer the total amount paid at the order of the returned Products, using the same manner as the payment for the order, excepted the cost of delivery, within a maximum period of fourteen (14) days from receipt of the return voucher, or – at the latest – from the most recent of the following dates: '),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list6),
              ),
              buildContent('In case of a partial return of Products, the sole price of the returned Products shall be reimbursed by Gentle Birth Method Ltd excluding the delivery costs (if additional), insofar as the Customer has benefited from the delivery service for the items kept and the delivery rates do not change depending on the volume ordered.'),

              buildTitle('10. IF THERE IS A PROBLEM WITH THE PRODUCTS', 15),
              buildContent('Gentle Birth Method Ltd is under a legal duty to supply Products that are in conformity with the Contract. Below is a summary of the Customer’s key legal rights in relation to Products purchased on the Website. Nothing in these terms will affect the Customer’s statutory legal rights.\n\n'
                  'If a Product that is purchased by a Customer does not conform to the information provided about the Product on the Website, or if the Product has a defect – such as damaged packaging –such Customer may return the Product. Returns of defective products is subject to the following conditions:\n\n'
                  'The Customer must inform Gentle Birth Method Ltd beforehand of the defect and its intention to return the defective Product by emailing us at gowrimotha@gentlebirthmethod.com giving details of the alleged defect (photos, written explanations…etc).\n\n'
                  'Once rejected, the defective Product must be returned to Gentle Birth Method Ltd in its original condition, with the original labels, and accompanied by the original packaging and the delivery note.\n\n'
                  'If Gentle Birth Method Ltd deems the returned Product to be defective, two options might be offered:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list7),
              ),
              
              buildTitle('Summary of your key legal rights', 15),
              buildContent('This is a summary of your key legal rights. These are subject to certain exceptions. For detailed information please visit the Citizens Advice website www.adviceguide.org.uk or call 03454 04 05 06.\n\n'
                  'If your Product is goods, the Consumer Rights Act 2015 says goods must be as described, fit for purpose and of satisfactory quality. During the expected lifespan of your Product your legal rights entitle you to the following:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list8),
              ),
              buildTitle('11. GENTLE BIRTH METHOD LTD’S LIABILITY TO THE CUSTOMER', 15),
              buildContent('Gentle Birth Method Ltd is responsible to the Customer for foreseeable loss and damage caused by it. If Gentle Birth Method Ltd fails to comply with these General Terms and Conditions of Sale, it will be responsible for loss or damage suffered by the Customer that is a foreseeable result of Gentle Birth Method Ltd’s breach of Contract or by its failure to use reasonable care and skill.\n\n'
                  'Gentle Birth Method Ltd is not responsible for any loss or damage that is not foreseeable.\n\n'
                  'Gentle Birth Method Ltd does not exclude or limit in any way its liability to the Customer where it would be unlawful to do so. This includes liability for death or personal injury caused by Gentle Birth Method Ltd’s negligence or the negligence of Gentle Birth Method Ltd’s employees, agents or subcontractors; for fraud or fraudulent misrepresentation; or for breach of the Customer’s statutory legal rights in relation to the Products.\n\n'
                  'Gentle Birth Method Ltd is not liable for business or consequential losses. Gentle Birth Method Ltd only supplies the Products for domestic and private use. Gentle Birth Method Ltd will only supply businesses if agreed in writing beforehand. If the Customer uses the Products for any commercial, business or re-sale purpose Gentle Birth Method Ltd will have no liability to the Customer for any loss of profit, loss of business, business interruption, or loss of business opportunity.'),
              buildDefinitions('Customer Responsibility and Disclaimer: ', 'The Gentle Birth Method has been developed over 35 years by Dr Gowri Motha, a medical doctor and has been proven by thousands of mothers to work. However, the Customer is under no obligation to follow the Gentle Birth Method. The Customer is fully responsible for their health and the health of their baby/babies, and as such decide what (if any) Products that they have/use. Customers should be fully aware that some Products (e.g. herbs, supplements, oils) are traditional remedies and have not been researched in the medical scientific community. Gentle Birth Method Treatments are also not researched extensively by the conventional medical community. Gentle Birth Method Ltd accepts no responsibility for any symptoms or outcomes of pregnancies as a result of taking/having these Products.'),
              buildContent('Gentle Birth Method Ltd makes no warranties that the Website will be available on an uninterrupted, timely, secure or error-free basis. Gentle Birth Method Ltd shall not be responsible for:'),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8 ),
                child: BulletList(list9),
              ),
              buildContent('Gentle Birth Method Ltd reserves the right to suspend access to the Website at any time.'),

              buildTitle('12. COMPLAINTS INFORMATION', 15),
              buildContent('For any information, complaints or question relating to the terms and conditions of sale on the Website or to the Products, Customers may contact Gentle Birth Method, when appropriate by using their order number, via email: gowrimotha@gentlebirthmethod.com'),

              buildTitle('13. INTELLECTUAL PROPERTY RIGHTS', 15),
              buildContent('Any and all intellectual property rights attached to the Products presented for sale on the Website are and shall remain the exclusive property of Gentle Birth Method Ltd. All rights are exclusively reserved. Therefore, no one is authorised to reproduce, exploit, disseminate or use in any way, even partially, such intellectual property rights, unless Gentle Birth Method Ltd’s prior written consent has been obtained. Gentle Birth Method Ltd trademarks and logos are registered trademarks. Consequently, any reproduction is an infringement.'),

              buildTitle('14. APPLICABLE LAW AND WHERE THE CUSTOMER MAY BRING LEGAL PROCEEDINGS', 15),
              buildContent('The present General Terms and Conditions of Sale and the contractual relationship between Gentle Birth Method Ltd and the Customer shall be governed and construed in accordance with the laws of England. All disputes or differences that may arise in connection with or in relation to these General Terms and Conditions of Sale, or in connection with the relationship between the Parties, shall be first submitted to a consumer mediator. Should no amicable settlement be reached, any disputes must be submitted to and definitively settled by the Courts of England. The Courts of England shall have exclusive jurisdiction over any dispute between a Customer and Gentle Birth Method Ltd.'),

              buildTitle('15. NON-WAIVER', 15),
              buildContent('Even if Gentle Birth Method Ltd delays or does not take steps in enforcing any provision of a Contract, it can still enforce it later. If Gentle Birth Method Ltd does not insist immediately that the Customer does anything he/she is required to do under these General Terms and Conditions of Sale, or any Contract if Gentle Birth Method Ltd delays in taking steps against the Customer in respect of any breach of  a Contract, that will not mean that the Customer does not have to do those things and it will not prevent Gentle Birth Method Ltd taking steps against the Customer at a later date.'),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 22),
                child: Text('Updated: 4/7/2023',style: GoogleFonts.poppins(
                    fontSize: 13),
                  textAlign: TextAlign.justify,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContent(String content) {
    return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(content, style: GoogleFonts.poppins(
                    color: Colors.teal.shade900, fontSize: 12),textAlign: TextAlign.justify,
                ),
              ),
            );
  }

  Padding buildTitle(String title, double fontSize) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            );
  }

  Container buildDefinitions(String term, String definition) {
    return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: term,
                    style: TextStyle(color: Colors.black
                        , fontSize: 16, fontWeight: FontWeight.w500
                    ),
                    children: <TextSpan>[
                      TextSpan(text: definition,style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12,color: Colors.teal.shade900))),
                    ],
                  ),
                ),
              ),
            );
  }
}
