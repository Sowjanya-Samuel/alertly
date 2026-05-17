import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/alert_controller.dart';

class CreateAlertScreen extends StatelessWidget {

  CreateAlertScreen({super.key});

  final AlertController controller =
      Get.put(AlertController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: true,

      body: SafeArea(

        child: SingleChildScrollView(

          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 40,

            bottom:
                MediaQuery.of(context)
                        .viewInsets
                        .bottom +
                    30,
          ),

          child: ConstrainedBox(

            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context)
                          .size
                          .height -
                      100,
            ),

            child: IntrinsicHeight(

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // LOGO + TITLE
                  Row(
                    children: [

                      Container(
                        height: 60,
                        width: 60,

                        decoration: BoxDecoration(

                          borderRadius:
                              BorderRadius.circular(
                                  18),

                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(0xff8B5CF6),
                              Color(0xffEC4899),
                              Color(0xffF59E0B),
                            ],
                          ),
                        ),

                        child: const Icon(
                          Icons
                              .notifications_active_rounded,

                          color: Colors.white,

                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 16),

                      const Expanded(
                        child: Text(
                          "Alertly",

                          overflow:
                              TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize: 34,
                            fontWeight:
                                FontWeight.bold,

                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Never miss what matters most.",

                    style: TextStyle(
                      color:
                          Colors.white.withOpacity(
                              .7),

                      fontSize: 16,
                    ),
                  ),

                  SizedBox(
                    height:
                        MediaQuery.of(context)
                                .size
                                .height *
                            0.08,
                  ),

                  const Text(
                    "Create New Alert",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TEXTFIELD
                  Container(

                    decoration: BoxDecoration(
                      color:
                          const Color(0xff151B2D),

                      borderRadius:
                          BorderRadius.circular(
                              24),

                      border: Border.all(
                        color:
                            Colors.white.withOpacity(
                                .05),
                      ),
                    ),

                    child: TextField(

                      controller:
                          controller.alertController,

                      maxLines: 5,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),

                      decoration: InputDecoration(

                        hintText:
                            "What would you like to be alerted about?",

                        hintStyle: TextStyle(
                          color: Colors.white
                              .withOpacity(.4),
                        ),

                        border: InputBorder.none,

                        contentPadding:
                            const EdgeInsets.all(
                                22),
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    height:
                        MediaQuery.of(context)
                                .size
                                .height *
                            0.05,
                  ),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 60,

                    child: ElevatedButton(

                      onPressed: () async {

                        if (!controller
                            .isLoading.value) {

                          FocusScope.of(context)
                              .unfocus();

                          await controller
                              .createAlert();
                        }
                      },

                      style: ElevatedButton
                          .styleFrom(
                        backgroundColor:
                            Colors.transparent,

                        shadowColor:
                            Colors.transparent,

                        padding:
                            EdgeInsets.zero,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  22),
                        ),
                      ),

                      child: Ink(

                        decoration: BoxDecoration(

                          borderRadius:
                              BorderRadius.circular(
                                  22),

                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(0xff8B5CF6),
                              Color(0xffEC4899),
                              Color(0xffF59E0B),
                            ],
                          ),
                        ),

                        child: Container(

                          alignment:
                              Alignment.center,

                          child: Obx(() {

                            return controller
                                    .isLoading
                                    .value

                                ? const SizedBox(
                                    height: 24,
                                    width: 24,

                                    child:
                                        CircularProgressIndicator(
                                      color:
                                          Colors
                                              .white,

                                      strokeWidth:
                                          2.5,
                                    ),
                                  )

                                : const Text(
                                    "Schedule Alert",

                                    style:
                                        TextStyle(
                                      fontSize:
                                          18,

                                      fontWeight:
                                          FontWeight
                                              .bold,

                                      color: Colors
                                          .white,
                                    ),
                                  );
                          }),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}