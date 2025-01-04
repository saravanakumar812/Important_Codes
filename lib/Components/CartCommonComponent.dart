import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/theme.dart';


class CartCommonComponent extends StatefulWidget {
  final String productImage;

  final String productName;
  final String productQty;
  final String productPrice;
  final int counter;
  final VoidCallback OnPressed;
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;
  CartCommonComponent({
    Key? key,
    required this.productImage,

    required this.productName,
    required this.productQty,
    required this.productPrice,
    required this.OnPressed,
    required this.decrementCounter,
    required this.incrementCounter,
    this.counter = 1,
  }) : super(key: key);

  @override
  _ProductDisplayCommonComponentState createState() =>
      _ProductDisplayCommonComponentState();
}

class _ProductDisplayCommonComponentState extends State<CartCommonComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: width,
        height: height * 0.135,
        decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Container(
                width: width * 0.33,
                height: height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          '${widget.productImage}',
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.productName}',
                            style: GoogleFonts.poppins(
                              color: AppTheme.appBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                  "assets/images/Vector.png"),
                              Text(
                                '${widget.productQty}',
                                style: GoogleFonts.poppins(
                                  color: AppTheme.appBlack,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Text(
                      '${widget.productPrice}',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Container(
                      width: width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Icon(Icons.favorite_border),
                          Row(
                            children: [
                              InkWell(
                                onTap: widget.decrementCounter,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: widget.counter == 1 ?  AppTheme.IconBackground : Colors.red),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    color: widget.counter == 1 ?AppTheme.Buttoncolor : Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                widget.counter.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: widget.counter > 1 ? Colors.black : Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              InkWell(
                                onTap: widget.incrementCounter,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppTheme.Buttoncolor),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );




    //   Column(children: [
    //   SizedBox(
    //     height: MediaQuery.of(context).size.height * 0.02,
    //   ),
    //   Row(
    //     children: [
    //       Container(
    //           child: Stack(
    //         children: <Widget>[
    //           widget.productImage == null || widget.productImage.isEmpty ?
    //                Container(
    //             width: MediaQuery.of(context).size.width * 0.25,
    //             height: MediaQuery.of(context).size.height * 0.06,
    //             color: Colors.white,
    //           ) :
    //           Padding(
    //
    //             padding: const EdgeInsets.all(8.0),
    //             child: Container(
    //               width: MediaQuery.of(context).size.width * 0.25,
    //               height: MediaQuery.of(context).size.height * 0.06,
    //               color: Colors.white,
    //               child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image.network(
    //                     '${widget.productImage}',
    //                     width: MediaQuery.of(context).size.width * 0.25,
    //                     height: MediaQuery.of(context).size.height * 0.1,
    //                     fit: BoxFit.contain,
    //                   )),
    //             ),
    //           )
    //         ],
    //       )),
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width * 0.05,
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 width: MediaQuery.of(context).size.width * 0.50,
    //                  //height: MediaQuery.of(context).size.height * 0.01,
    //                 child: Text(
    //                   '${widget.productName}',
    //                   style: GoogleFonts.poppins(
    //                     color: Colors.black,
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w600,
    //                   )
    //                 ),
    //               ),
    //               InkWell(
    //                 onTap: widget.OnPressed,
    //                 child: Icon(
    //                   Icons.delete,
    //                   size: 20, color: Colors.orange,
    //                 ),
    //               ),
    //               // IconButton(
    //               //   padding: EdgeInsets.zero,
    //               //   constraints: BoxConstraints(),
    //               //   onPressed: widget.OnPressed, icon:  Icon(
    //               //   Icons.delete,
    //               //   size: 20,
    //               //   color: Colors.orange,
    //               // ),)
    //
    //             ],
    //           ),
    //           Container(
    //             width: 200,
    //             child: Text(
    //                 '${widget.productDescription}',
    //                 style: GoogleFonts.poppins(
    //                   color: Colors.black,
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.w300,
    //                 ),
    //               softWrap: true,
    //             ),
    //           ),
    //           SizedBox(height:MediaQuery.of(context).size.width * 0.02 ,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 width: MediaQuery.of(context).size.width * 0.35,
    //                 child: Row(
    //                   children: [
    //                     Text(
    //                       '₹ ${widget.productPrice}',
    //                       style:
    //                       GoogleFonts.poppins(
    //                         color: Colors.black,
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w600,
    //                       )
    //                     ),
    //                     SizedBox(width:MediaQuery.of(context).size.width * 0.02 ,),
    //                     Text(
    //                       '(${widget.productQty})',
    //                       style: GoogleFonts.poppins(
    //                         color: Colors.black,
    //                         fontSize: 9,
    //                         fontWeight: FontWeight.w400,
    //                       )
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Row(
    //                 children: [
    //                   InkWell(
    //                     onTap: widget.decrementCounter,
    //                     child: Container(
    //                       padding: EdgeInsets.all(5),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(100),
    //                           color: widget.counter == 1 ?  AppTheme.grey : Colors.red),
    //                       child: Icon(
    //                         CupertinoIcons.minus,
    //                         color: widget.counter == 1 ?AppTheme.buttonColor : Colors.white,
    //                         size: 15,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: MediaQuery.of(context).size.width * 0.02,
    //                   ),
    //                   Text(
    //                     widget.counter.toString(),
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.w400,
    //                       color: widget.counter > 1 ? Colors.black : Colors.red,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: MediaQuery.of(context).size.width * 0.02,
    //                   ),
    //                   InkWell(
    //                     onTap: widget.incrementCounter,
    //                     child: Container(
    //                       padding: EdgeInsets.all(5),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(100),
    //                           color: AppTheme.buttonColor),
    //                       child: Icon(
    //                         Icons.add,
    //                         color: Colors.white,
    //                         size: 15,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: MediaQuery.of(context).size.width * 0.03,
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    //
    // ]);
  }
}
