import 'package:final_sprs/logic/DashBoard/bloc/dash_board_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bar_chart_sample7.dart';
import 'package:final_sprs/presentaion/widgets/percentIndicator.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/screens/Drawer.dart';
import "package:final_sprs/resource/percentIndicatorValue.dart";
import "package:final_sprs/presentaion/screens/drawer_new.dart";

class DashBoard extends StatefulWidget {
  const DashBoard({
    super.key,
  });

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashBoardBloc>(context).add(userTakeAssesment());
  }

  @override
  Widget build(context) {
    return BlocBuilder<DashBoardBloc, DashBoardBlocState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) {
        if (state is DashBoardDataLoadingState) {
          return Scaffold(
              body:
                  Container(child: Center(child: CircularProgressIndicator())));
        } else if (state is DashBoardDataErrorState) {
          return ErrorWidget.withDetails(
            message: state.error,
          );
        } else if (state is DashBoardDataLoadedState) {
          List<Map<String, dynamic>>? data = state.data;
          return Scaffold(
              extendBodyBehindAppBar: true,
              key: _scaffoldKey,
              drawer: NewDrawer(),
              body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup57),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .12,
                      ),
                      Text(
                        "Recent Value ",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Text(
                            "Know the signs. Act in time. It could save a life, maybe even your own.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyMediumErrorContainer),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      PercentDiplay(data: data),
                      SizedBox(height: 15),
                      Container(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .38,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Statistics ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text("Stroke risk",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const Divider(
                                      thickness: 1.0, color: Colors.grey),
                                  // qwertyuio

                                  MyBarChart(dataList1: data),
                                ],
                              ),
                            )),
                          )),
                    ],
                  ),
                )),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
