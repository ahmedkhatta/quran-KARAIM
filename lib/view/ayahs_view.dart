import '../animations/bottomAnimation.dart';
import '../model/surahModel.dart';
import 'package:flutter/material.dart';

class SurahAyats extends StatelessWidget {
  final List<Ayat> ayatsList;
  final String surahName;
  final String surahEnglishName;
  final String englishMeaning;
  SurahAyats(
      {this.ayatsList,
      this.englishMeaning,
      this.surahEnglishName,
      this.surahName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[850],
              pinned: true,
              expandedHeight: height * 0.27,
              flexibleSpace: flexibleAppBar(context, height, width),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => line(height, index),
                  childCount: ayatsList.length),
            )
          ],
        ));
  }

  Widget line(double height, int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: WidgetAnimator(
        ListTile(
          trailing: CircleAvatar(
            radius: height * 0.013,
            backgroundColor: Color(0xff04364f),
            child: CircleAvatar(
                radius: height * 0.012,
                backgroundColor: Colors.white,
                child: Text(
                  ayatsList[index].number.toString(),
                  style: TextStyle(fontSize: height * 0.015),
                )),
          ),
          title: Text(ayatsList[index].text,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: height * 0.03, color: Colors.amberAccent)),
        ),
      ),
    );
  }

  Widget flexibleAppBar(BuildContext context, double width, double height) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: Text(surahEnglishName,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: height * 0.045)),
        background: Stack(
          children: <Widget>[
            quranImageAppBar(height),
            infoInAppBar(context),
          ],
        ));
  }

  Widget infoInAppBar(BuildContext context) {
    TextStyle headline1= TextStyle( fontFamily: 'Sogeo', fontSize: 42, fontWeight: FontWeight.w600,color: Colors.blue);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            surahName,
            style: headline1,
          )
        ],
      ),
    );
  }

  Widget quranImageAppBar(double height) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/quranRail.png',


          )),
    );
  }
}
