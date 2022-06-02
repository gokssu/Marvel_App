import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/services/hero_controller.dart';
import 'package:marvel_app/view/theme/colors.dart';
import 'package:marvel_app/view/theme/padding_constant.dart';
import 'package:marvel_app/view/theme/context_extension.dart';
import 'components/background_view.dart';
import 'hero_detail.dart';

class HeroList extends StatefulWidget {
  const HeroList();

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  int scrollVariable = 0;
  bool pageLoad = false;
  bool listLoad = false;

  ScrollController scrollController = ScrollController();
  HeroControllers heroController = HeroControllers();
  List<dynamic> marvelModel = [];

  @override
  void initState() {
    super.initState();
    getList();
    scrollController.addListener(_scrollListener);
  }

  _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        scrollVariable = scrollVariable + 30;
        listLoad = true;
        getList();
      });
    }
  }

  getList() async {
    var res = await heroController.getHeroList(scrollVariable.toString());
    setState(() {
      if (res != null) {
        if (scrollVariable > 0) {
          marvelModel.addAll(res["results"]);
        } else {
          marvelModel = res["results"];
        }
        listLoad = false;
        pageLoad = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackGround(
        SafeArea(
          maintainBottomViewPadding: false,
          right: true,
          child: Padding(
            padding: PaddingConstants.instance.allPadding,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/marvel_studios_logo.png",
                            height: context.dynamicMultiHeight(0.1),
                            width: context.dynamicMultiWidth(0.3),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: PaddingConstants.instance.onlyTopMin,
                          child: Text(
                            "Heroes Catalogue",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 15,
                  child: Container(
                    width: context.dynamicMultiWidth(2),
                    child: pageLoad
                        ? ListView.builder(
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: marvelModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = marvelModel[index];
                              return Container(
                                margin: EdgeInsets.only(
                                    right: context.dynamicMultiWidth(0.18),
                                    left: context.dynamicMultiWidth(0.18),
                                    top: 10,
                                    bottom: 10),
                                height: context.dynamicMultiWidth(0.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      ColorConstants.instance.graStart,
                                      ColorConstants.instance.graEnd
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    if (item["id"] != null) {
                                      dynamic model = {
                                        "id": item["id"].toString(),
                                        "name":
                                            (item["name"] ?? "-").toString(),
                                        "image": item["thumbnail"]["path"]
                                                .toString() +
                                            "/landscape_xlarge." +
                                            item["thumbnail"]["extension"]
                                                .toString(),
                                        "description":
                                            (item["description"] ?? "-")
                                                .toString()
                                      };
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HeroItem(
                                                  model)));
                                    }

                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: context.dynamicMultiWidth(0.43),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                            ),
                                            child: (item["thumbnail"] != null &&
                                                    item["thumbnail"]["path"] !=
                                                        null)
                                                ? Image.network(
                                                    item["thumbnail"]["path"]
                                                            .toString() +
                                                        "/standard_fantastic." +
                                                        item["thumbnail"]
                                                                ["extension"]
                                                            .toString(),
                                                    fit: BoxFit.fill,
                                                  )
                                                : SizedBox()),
                                      ),
                                      Padding(
                                        padding: PaddingConstants
                                            .instance.onlyTopMin,
                                        child: Text(
                                          (item["name"] ?? "-").toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(
                            color: ColorConstants.instance.accentColor,
                          )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: listLoad
                      ? Center(
                          child: CircularProgressIndicator(
                          color: ColorConstants.instance.accentColor,
                        ))
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
