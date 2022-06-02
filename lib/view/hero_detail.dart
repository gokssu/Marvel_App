import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/services/hero_controller.dart';
import 'package:marvel_app/view/theme/colors.dart';
import 'package:marvel_app/view/theme/padding_constant.dart';
import 'package:marvel_app/view/theme/context_extension.dart';
import 'components/background_view.dart';

class HeroItem extends StatefulWidget {
  dynamic heroModel;
  HeroItem(this.heroModel);

  @override
  State<HeroItem> createState() => _HeroItemState();
}

class _HeroItemState extends State<HeroItem> {
  List<dynamic> comicsList=[];
  bool listLoad=false;
  HeroControllers heroController = HeroControllers();

  @override
  void initState() {
    super.initState();
    getComics();
  }
  getComics()async{
    var res= await heroController.getHeroComics(widget.heroModel["id"]);
    if(res!=null){
      setState(() {
        comicsList=res["results"];
        listLoad=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        backgroundColor: Color(0x0),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BackGround(
        SafeArea(
          maintainBottomViewPadding: false,
          right: true,
          child: Padding(
            padding: PaddingConstants.instance.allMinPadding,
            child: Column(
              children: [
                Expanded(
                    flex: widget.heroModel["description"].toString().length<1
                        ?6:4,
                    child: Column(
                      children: [
                        Container(
                          height: context.dynamicMultiWidth(0.7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            child: (Image.network(
                              widget.heroModel["image"],
                              fit: BoxFit.fill,
                            )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,left: 10),
                          child: Row(
                            children: [
                              Text(
                                widget.heroModel["name"],
                                style: Theme.of(context).textTheme.headline1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                 Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Text(
                           " Description :",
                            style: Theme.of(context).textTheme.headline2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Text(
                        widget.heroModel["description"]==""?"  - ":widget.heroModel["description"],
                        style: Theme.of(context).textTheme.subtitle1,
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: widget.heroModel["description"].toString().length<1
                      ?5:3,
                  child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Comics :",
                              style: Theme.of(context).textTheme.headline2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          padding: PaddingConstants.instance.allMinPadding,
                          height: context.dynamicMultiHeight(0.28),
                          child: listLoad? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: comicsList.length,
                              itemBuilder: (context, index) {
                                var item = comicsList[index];
                                return Container(
                                  padding: PaddingConstants.instance.onlyLeft,
                                  height: context.dynamicMultiWidth(0.27),
                                  child: Card(
                                    color: ColorConstants.instance.focusColor,
                                    child:  (item["thumbnail"] != null &&
                                        item["thumbnail"]["path"] !=
                                            null)
                                        ? Image.network(
                                      item["thumbnail"]["path"]
                                          .toString() +
                                          "/portrait_medium." +
                                          item["thumbnail"]
                                          ["extension"]
                                              .toString(),
                                      fit: BoxFit.fill,
                                    )
                                        : SizedBox(),
                                  ),
                                );
                              }): Center(
                              child: CircularProgressIndicator(
                                color: ColorConstants.instance.accentColor,
                              )),
                        )

                      ],
                    )

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
