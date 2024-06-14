import 'package:flutter/material.dart';
import 'package:login_register/Utilities/colors.dart';

class ProductsectionItemWidget extends StatefulWidget {
  const ProductsectionItemWidget({super.key});

  @override
  State<ProductsectionItemWidget> createState() => _ProductsectionItemWidgetState();
}

class _ProductsectionItemWidgetState extends State<ProductsectionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: 266,
        width: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                width: 180,
                height: 180,
                child: Image.asset('assets/medicine.png'),
              ),
              Container(
                color: Color(0xfff4fbfa),
                width: 180,
                height: 86,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 12, left: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$100',
                            style: TextStyle(
                              color: Color(0xff5a5f8c),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff5a5f8c),
                            size: 16,
                          ),
                        ],
                      ),
                      Text('Gentle Birth Method Starter Pack', style: TextStyle(
                          color: titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
