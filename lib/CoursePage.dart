import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Login-Discover.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,


      debugShowCheckedModeBanner: false, // to remove the debug banner on top of the screen
      theme: ThemeData(fontFamily:'head'),



      home: coursePage(),
    );
  }
}

class coursePage extends StatefulWidget {
  @override
  _coursePageState createState() => _coursePageState();
}








class _coursePageState extends State<coursePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff6930c3) ,
      body: Container(
        padding: EdgeInsets.only(top:30,left:30, right:40),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text('مرحبا بك..',
            //
            //       style: TextStyle(
            //           fontSize: 20,
            //
            //           color: Colors.white
            //       ),),
            //     Container(
            //         margin :EdgeInsets.only(top:5),
            //
            //         width: 100,
            //         child:
            //
            //         Image.asset('images/logo.png')
            //     ),
            //
            //
            //   ],
            //
            // ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(right:74),
              child:   Text('مسارات وسيلة ',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900

                ) ,),
            ),
            SizedBox(height: 6,),

            Divider(height: 20,color: Colors.white,),


            Text('يتطلب احتراف التصميم العديد من المعلومات والتدريبات التي عليك اتقانها لتكون فريدًا بين أقرانك.',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white

              ) ,),

            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,


                        children: <Widget>[
                          SizedBox(height: 10,),

                          CourseGraphicD('دورة الجرافيك ديزاين', 'كريم علي   ', 'graphic', Color(0xffff6a65), Color(0xffff5954)),
                          SizedBox(height: 20,),
                          ConceptArt(' دورة الكونسبت آرت', ' أحمد البستكي', 'concept', Color(0xffe9eefa), Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(height: 50,),


                          motionGraphic('دورة الموشن جرافيك', 'محمد علي ', 'motion', Color(0xffe9eefa), Colors.white),
                          SizedBox(height: 20,),

                          artD('دورة الثري دي آرت', 'محمد علي', '3d1', Color(0xffff6a65),  Color(0xffff5954)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),










          ],
        ),
      ),
    );
  }








///////////////////////////////// COURSES CARDS///////////////////////////


  Container CourseGraphicD( String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(

        padding: EdgeInsets.only(top:10,left:10, right:10, bottom:10),
        decoration: BoxDecoration(
          color:bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),



        child:InkWell(
            onTap:(){
              // _graphic(context);
              _bottomSheet(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:BoxDecoration(
                    color:categoryColor,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('$category', style:TextStyle(
                      color:(categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) :Colors.white),
                    fontSize: 17,


                  )),
                ),

                Container(
                  padding: EdgeInsets.only(right:45),
                  child:   Text('$title' ,style:TextStyle(
                    color:(bgColor == Color(0xffff5954) ? Colors.white :Colors.black),
                    fontSize: 15,

                  ))
                ),


                Hero(
                  tag:'$img',
                      child:Container(
                    height: 100,
                        decoration: BoxDecoration(
image:DecorationImage(

  image: AssetImage('images/$img.jpg'),
),
                          borderRadius:BorderRadius.all(Radius.circular(30)),


                        ),
                )

                )


              ],

            )
        )

    );
  }

  Container ConceptArt( String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(

        padding: EdgeInsets.only(top:10,left:10, right:10, bottom:10),
        decoration: BoxDecoration(
          color:bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),



        child:InkWell(
            onTap:(){
              _artC(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:BoxDecoration(
                    color:categoryColor,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('$category', style:TextStyle(
                      color:(categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) :Colors.white),
                    fontSize: 17,

                  )),
                ),

                Container(
                               padding: EdgeInsets.only(right:25),

                    child:   Text('$title' ,style:TextStyle(
                      color:(bgColor == Color(0xffff5954) ? Colors.white :Colors.black),
                      fontSize: 15,

                    ))
                ),

                SizedBox(height:10 ,),

                Hero(
                    tag:'$img',
                    child:Container(
                      height: 80,
                      decoration: BoxDecoration(
                          image:DecorationImage(
                            image: AssetImage('images/$img.jpg'),

                          ),
                          borderRadius:BorderRadius.all(Radius.circular(30)),


                      ),

                    )

                )


              ],

            )
        )

    );
  }


  Container motionGraphic( String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(

        padding: EdgeInsets.only(top:10,left:10, right:10, bottom:10),
        decoration: BoxDecoration(
          color:bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),



        child:InkWell(
            onTap:(){

              _motionSheet(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:BoxDecoration(
                    color:categoryColor,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('$category', style:TextStyle(
                    color:(categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) :Colors.white),
                    fontSize: 17,

                  )),
                ),

                Container(
                    padding: EdgeInsets.only(right:40),

                    child:   Text('$title' ,style:TextStyle(
                      color:(bgColor == Color(0xffff5954) ? Colors.white :Colors.black),
                      fontSize: 15,

                    ))
                ),

                SizedBox(height:10 ,),

                Hero(
                    tag:'$img',
                    child:Container(
                      height: 80,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage('images/$img.jpg'),

                        ),
                        borderRadius:BorderRadius.all(Radius.circular(30)),


                      ),

                    )

                )


              ],

            )
        )

    );
  }

  Container artD( String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(

        padding: EdgeInsets.only(top:10,left:10, right:10, bottom:10),
        decoration: BoxDecoration(
          color:bgColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),



        child:InkWell(
            onTap:(){

              _Art(context);

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:BoxDecoration(
                    color:categoryColor,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('$category', style:TextStyle(
                    color:(categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) :Colors.white),
                    fontSize: 17,

                  )),
                ),

                Container(
                    padding: EdgeInsets.only(right:40),

                    child:   Text('$title' ,style:TextStyle(
                      color:(bgColor == Color(0xffff5954) ? Colors.white :Colors.black),
                      fontSize: 15,

                    ))
                ),

                SizedBox(height:10 ,),

                Hero(
                    tag:'$img',
                    child:Container(
                      height: 80,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage('images/$img.jpg'),

                        ),
                        borderRadius:BorderRadius.all(Radius.circular(30)),


                      ),

                    )

                )


              ],

            )
        )

    );
  }

///////////////////////////////// COURSES CARDS///////////////////////////







///////////////////////////////// bottom sheets for courses details///////////////////////////

  _bottomSheet(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){
          return Container(

              height: 500.0,
              child:
              //     new Container(
              //     decoration: new BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: new BorderRadius.only(
              //     topLeft: const Radius.circular(10.0),
              // topRight: const Radius.circular(10.0))),
              // child:

              Container(

                decoration: new BoxDecoration(
                  color: Color(0xff6930c3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child:

                Expanded(
                  child: SingleChildScrollView(

                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[


                          Container(
                            padding: EdgeInsets.only(left: 40),
                            child:   Text(' دورة الجرافيك ديزاين ',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700

                              ) ,),
                          ),


                          Container(                padding: EdgeInsets.only(top:30,left:30, right:40),

                              child: Divider(height: 10, color: Colors.white,)),

                          SizedBox(height: 30,),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('images/karim.jpg', height: 150,)
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child:   Text(' كريم علي ',
                              style: TextStyle(
                                fontSize: 20,
                                color:  Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w300,

                              ) ,),
                          ),

                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Center(
                              child: Text('مدرب معتمد من شركة ادوبى و مصمم جرافيك و موشن جرافيك خبرة اكثر من 15 سنة فى مجال الجرافيك والموشن جرافيك و عمل فى كبري المراكز التعليمية و باحث فى مجال التصميم',
                                style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                            ),

                          ),



Container(
  padding: EdgeInsets.only(top:30,left:30, right:40),
  child: Text('تصميم الجرافيك من المجالات التى لا غنى عنها فى حياتنا اليومية ، فنراه فى كل مكان حولنا ، سواء على الشاشات أو فى الطباعة ، فهو يعتمد على استخدام الصورة والاشكال والكتابات …. وغيرها من عناصر التصميم ، لتوصيل معلومة او رساله محدده ، ويكون هدفه الاتصال بين المعلن أو صاحب الرسالة والمستقبلين لهذه الرسالة لعرضها بإسلوب جذاب وممتع للنظر ، ففى هذه الدورة سوف تتعلم المهارات والمفاهيم والأدوات التي تساعدك على تحقيق ذلك .',
    style: TextStyle(color: Colors.white.withOpacity(0.6)),),

),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('البرامج التى سوف يتم استخدامها :',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Row(

                    children: <Widget> [
                      SizedBox(width: 20,),

                              Container(
                                  child: Image.asset('images/Ai.png', height: 50,)),
                      SizedBox(width: 10,),


                      Container(
                          child: Image.asset('images/Id.png', height: 50,)),
                      SizedBox(width: 10,),


                      Container(
                          child: Image.asset('images/Br.png', height: 50,)),

                      SizedBox(width: 10,),

                      Container(
                          child: Image.asset('images/Dn.png', height: 50,)),

                      SizedBox(width: 10,),

                      Container(
                          child: Image.asset('images/Ps.png', height: 50,)),

                            ]),

                          ),
                          SizedBox(height: 30,),









                        ],


                    ),

                  ),
                ),
              )
          );
        }

    );
  }

  _motionSheet(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){
          return Container(
              height: 500.0,
              child:
              //     new Container(
              //     decoration: new BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: new BorderRadius.only(
              //     topLeft: const Radius.circular(10.0),
              // topRight: const Radius.circular(10.0))),
              // child:

              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff6930c3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child:

                Expanded(
                  child: SingleChildScrollView(

                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.only(left: 40),
                            child:   Text(' دورة الموشن جرافيك ',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700

                              ) ,),
                          ),
                          Container(                padding: EdgeInsets.only(top:30,left:30, right:40),

                              child: Divider(height: 10, color: Colors.white,)),
                          SizedBox(height: 30,),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('images/mohamed.jpg', height: 150,)
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child:   Text(' محمد علي ',
                              style: TextStyle(
                                fontSize: 20,
                                color:  Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w300,

                              ) ,),
                          ),

                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Center(
                              child: Text('مدرب معتمد من شركة ادوبى و مصمم جرافيك وMotion Artist خبرة 10 سنين فى مجال الجرافيك والموشن جرافيك عمل فى كبري المراكز التعليمية ، art director',
                                style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                            ),

                          ),



                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('أصبح مجال motion graphics او mograph من المجالات المطلوبة حاليا فى سوق العمل إلى حد كبير ، فيمكنك أن ترى الاعمال التى يقوم بها مصممى الموشن جرافيك فى الإعلانات التجارية على التلفزيون أو في مقدمات الافلام او فى الرسوم المتحركة أو على السوشيال ميديا او اليوتيوب … وغيرها ، فإذا كنت تبحث عن مهنة ممتعة و مجزية ماديا ، فابدأ الآن وإتعلم واستكشف مجال الموشن جرافيك .',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('البرامج التى سوف يتم استخدامها :',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Row(

                                children: <Widget> [

                                  Container(
                                      child: Image.asset('images/Ai.png', height: 50,)),
                                  SizedBox(width: 5,),

                                  Container(
                                      child: Image.asset('images/Ps.png', height: 50,)),
                                  SizedBox(width: 5,),

                                  Container(
                                      child: Image.asset('images/pr.png', height: 50,)),
                                  SizedBox(width: 5,),


                                  Container(
                                      child: Image.asset('images/au.png', height: 50,)),

                                  SizedBox(width: 5,),

                                  Container(
                                      child: Image.asset('images/ae.png', height: 50,)),

                                  SizedBox(width: 5,),

                                  Container(
                                      child: Image.asset('images/me.png', height: 50,)),


                                ]),

                          ),
                          SizedBox(height: 30,),









                        ],









                    ),
                  ),
                ),
              )
          );
        }

    );
  }

  _Art(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){
          return Container(
              height: 500.0,
              child:
              //     new Container(
              //     decoration: new BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: new BorderRadius.only(
              //     topLeft: const Radius.circular(10.0),
              // topRight: const Radius.circular(10.0))),
              // child:

              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff6930c3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child:

                Expanded(
                  child: SingleChildScrollView(

                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.only(left: 40),
                            child:   Text(' دورة الثري دي ارت',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700

                              ) ,),
                          ),
                          Container(                padding: EdgeInsets.only(top:30,left:30, right:40),

                              child: Divider(height: 10, color: Colors.white,)),
                          SizedBox(height: 30,),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('images/mohamed.jpg', height: 150,)
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child:   Text(' محمد علي ',
                              style: TextStyle(
                                fontSize: 20,
                                color:  Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w300,

                              ) ,),
                          ),

                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Center(
                              child: Text('مدرب معتمد من شركة ادوبى و مصمم جرافيك وMotion Artist خبرة 10 سنين فى مجال الجرافيك والموشن جرافيك عمل فى كبري المراكز التعليمية ، art director',
                                style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                            ),

                          ),



                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('التراك ده عبارة عن تعاملك واستخدامك للتقنيات ثلاثية الابعاد لزيادة قيمة الجودة فتصبح الاشياء كأنها واقعية بشكل اكبر وايضا انتاج الرسوم المتحركة المعقدة وفي مثل هذا النوع من التراكس بالحديث عن الانترفيو نفسه طبعا انت مطلوب منك اساسيات بس لكن بيطلبوا منك تاسك لتصميم لعبة لازم تكون بتتعامل مع تقنيات ثلاثية الابعاد كويس جدا وفاهم جدا وبتتخيل تصاميمك بشكل منفتح.',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('البرامج التى سوف يتم استخدامها :',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Row(

                                children: <Widget> [
                                  SizedBox(width: 20,),

                                  Container(
                                      child: Image.asset('images/Ai.png', height: 50,)),
                                  SizedBox(width: 10,),


                                  Container(
                                      child: Image.asset('images/Id.png', height: 50,)),
                                  SizedBox(width: 10,),


                                  Container(
                                      child: Image.asset('images/Br.png', height: 50,)),

                                  SizedBox(width: 10,),

                                  Container(
                                      child: Image.asset('images/Dn.png', height: 50,)),

                                  SizedBox(width: 10,),

                                  Container(
                                      child: Image.asset('images/Ps.png', height: 50,)),

                                ]),

                          ),
                          SizedBox(height: 30,),






                        ]
                    ),
                  ),
                ),
              )
          );
        }

    );
  }

  _artC(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){
          return Container(
              height: 500.0,
              child:
              //     new Container(
              //     decoration: new BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: new BorderRadius.only(
              //     topLeft: const Radius.circular(10.0),
              // topRight: const Radius.circular(10.0))),
              // child:

              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff6930c3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child:

                Expanded(
                  child: SingleChildScrollView(

                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.only(left: 40),
                            child:   Text(' دورة الكونسبت آرت',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700

                              ) ,),
                          ),
                          Container(                padding: EdgeInsets.only(top:30,left:30, right:40),

                              child: Divider(height: 10, color: Colors.white,)),
                          SizedBox(height: 30,),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('images/ahmed.jpg', height: 150,)
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child:   Text('أحمد البستكي',
                              style: TextStyle(
                                fontSize: 20,
                                color:  Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w300,

                              ) ,),
                          ),

                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Center(
                              child: Text('مدرب معتمد من شركة ادوبى و مصمم جرافيك و موشن جرافيك خبرة اكثر من 15 سنة فى مجال الجرافيك والموشن جرافيك و عمل فى كبري المراكز التعليمية و باحث فى مجال التصميم',
                                style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                            ),

                          ),



                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('فن الفكرة Concept Art ترجمة لأحاسيس وفكرة أو واقع لكن معتمد على خيال الفنان ..يستوحي الفكرة من ذاكرته التصويرية التي تختزن معلومات كثيرة ..ويترجمها على لوحة ممكن أن تكون واقعية أو خيالية، نجد هذا الفن في صناعة الأفلام والألعاب والكارتون والدعاية والإعلان وكل ماله علاقة بالإبداع والإختراع.',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:40),
                            child: Text('البرامج التى سوف يتم استخدامها :',
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),),

                          ),
                          Container(
                            padding: EdgeInsets.only(top:30,left:30, right:100),
                            child: Row(

                                children: <Widget> [
                                  SizedBox(width: 20,),

                                  Container(
                                      child: Image.asset('images/Ai.png', height: 50,)),
                                  SizedBox(width: 10,),




                                  Container(
                                      child: Image.asset('images/Br.png', height: 50,)),

                                  SizedBox(width: 10,),



                                  Container(
                                      child: Image.asset('images/Ps.png', height: 50,)),

                                ]),

                          ),
                          SizedBox(height: 30,),






                        ]
                    ),
                  ),
                ),
              )
          );
        }

    );
  }


///////////////////////////////// bottom sheets for courses details///////////////////////////




  _motionSheett(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

              padding: EdgeInsets.only(left:30, right:40),

              child: Expanded(

                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 40),
                        child:   Text(' دورة الموشن جرافيك ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w900

                          ) ,),
                      ),

                      SizedBox(height: 20,),














                    ],
                  ),
                ),
              ),
            ),
          );
          //
          //
          //
          //
          //
          //
          //
          //


          // return Container(
          //     height: 500.0,
          //     child:
          //     //     new Container(
          //     //     decoration: new BoxDecoration(
          //     //     color: Colors.white,
          //     //     borderRadius: new BorderRadius.only(
          //     //     topLeft: const Radius.circular(10.0),
          //     // topRight: const Radius.circular(10.0))),
          //     // child:
          //
          //     Container(
          //       decoration: new BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //
          //       child: Column(
          //
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Padding(
          //               padding:  EdgeInsets.all(12.0),
          //               child: Text('تسجيل الدخول', style: TextStyle(fontSize: 20),),
          //             ),
          //             Divider(
          //               height: 20,
          //             ),
          //             ListTile(
          //               leading: Image.asset('images/google.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر جوجل', style: TextStyle(fontSize:14) ),
          //             ),
          //
          //
          //             Divider(
          //               height: 20,
          //             ),
          //
          //             ListTile(
          //               leading: Image.asset('images/facebookk.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر فيسبوك', style: TextStyle(fontSize:14) ),
          //             ),
          //           ]
          //       ),
          //     )
          // );
        }

    );
  }
  //
  _Artt(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){

          return Scaffold(
            backgroundColor:Color(0xff6930c3) ,
            body: Container(
              padding: EdgeInsets.only(left:30, right:40),

              child: Expanded(

                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 60),
                        child:   Text(' دورة  الثري دي آرت ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900

                          ) ,),
                      ),

                      SizedBox(height: 20,),














                    ],
                  ),
                ),
              ),
            ),
          );
          //
          //
          //
          //
          //
          //
          //
          //


          // return Container(
          //     height: 500.0,
          //     child:
          //     //     new Container(
          //     //     decoration: new BoxDecoration(
          //     //     color: Colors.white,
          //     //     borderRadius: new BorderRadius.only(
          //     //     topLeft: const Radius.circular(10.0),
          //     // topRight: const Radius.circular(10.0))),
          //     // child:
          //
          //     Container(
          //       decoration: new BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //
          //       child: Column(
          //
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Padding(
          //               padding:  EdgeInsets.all(12.0),
          //               child: Text('تسجيل الدخول', style: TextStyle(fontSize: 20),),
          //             ),
          //             Divider(
          //               height: 20,
          //             ),
          //             ListTile(
          //               leading: Image.asset('images/google.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر جوجل', style: TextStyle(fontSize:14) ),
          //             ),
          //
          //
          //             Divider(
          //               height: 20,
          //             ),
          //
          //             ListTile(
          //               leading: Image.asset('images/facebookk.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر فيسبوك', style: TextStyle(fontSize:14) ),
          //             ),
          //           ]
          //       ),
          //     )
          // );
        }

    );
  }

  _graphic(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){

          return Scaffold(
            backgroundColor:Color(0xff6930c3) ,
            body: Container(
              padding: EdgeInsets.only(left:30, right:40),

              child: Expanded(

                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 60),
                        child:   Text(' دورة الجرافيك ديزاين ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900

                          ) ,),
                      ),

                      SizedBox(height: 20,),














                    ],
                  ),
                ),
              ),
            ),
          );
          //
          //
          //
          //
          //
          //
          //
          //


          // return Container(
          //     height: 500.0,
          //     child:
          //     //     new Container(
          //     //     decoration: new BoxDecoration(
          //     //     color: Colors.white,
          //     //     borderRadius: new BorderRadius.only(
          //     //     topLeft: const Radius.circular(10.0),
          //     // topRight: const Radius.circular(10.0))),
          //     // child:
          //
          //     Container(
          //       decoration: new BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //
          //       child: Column(
          //
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Padding(
          //               padding:  EdgeInsets.all(12.0),
          //               child: Text('تسجيل الدخول', style: TextStyle(fontSize: 20),),
          //             ),
          //             Divider(
          //               height: 20,
          //             ),
          //             ListTile(
          //               leading: Image.asset('images/google.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر جوجل', style: TextStyle(fontSize:14) ),
          //             ),
          //
          //
          //             Divider(
          //               height: 20,
          //             ),
          //
          //             ListTile(
          //               leading: Image.asset('images/facebookk.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر فيسبوك', style: TextStyle(fontSize:14) ),
          //             ),
          //           ]
          //       ),
          //     )
          // );
        }

    );
  }

  _artCC(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (BuildContext c){

          return Scaffold(
            backgroundColor:Color(0xff6930c3) ,
            body: Container(
              padding: EdgeInsets.only(left:30, right:40),

              child: Expanded(

                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 60),
                        child:   Text(' دورة الكونسبت آرت ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900

                          ) ,),
                      ),

                      SizedBox(height: 20,),














                    ],
                  ),
                ),
              ),
            ),
          );
          //
          //
          //
          //
          //
          //
          //
          //


          // return Container(
          //     height: 500.0,
          //     child:
          //     //     new Container(
          //     //     decoration: new BoxDecoration(
          //     //     color: Colors.white,
          //     //     borderRadius: new BorderRadius.only(
          //     //     topLeft: const Radius.circular(10.0),
          //     // topRight: const Radius.circular(10.0))),
          //     // child:
          //
          //     Container(
          //       decoration: new BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //
          //       child: Column(
          //
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Padding(
          //               padding:  EdgeInsets.all(12.0),
          //               child: Text('تسجيل الدخول', style: TextStyle(fontSize: 20),),
          //             ),
          //             Divider(
          //               height: 20,
          //             ),
          //             ListTile(
          //               leading: Image.asset('images/google.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر جوجل', style: TextStyle(fontSize:14) ),
          //             ),
          //
          //
          //             Divider(
          //               height: 20,
          //             ),
          //
          //             ListTile(
          //               leading: Image.asset('images/facebookk.png',height: 40,),
          //               title: Text('تسجيل الدخول عبر فيسبوك', style: TextStyle(fontSize:14) ),
          //             ),
          //           ]
          //       ),
          //     )
          // );
        }

    );
  }


}


