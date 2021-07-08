import 'package:doors_tour_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PriceDetails extends StatefulWidget {
  const PriceDetails({Key? key}) : super(key: key);

  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  String companyName = "Mindspace Business Park REIT";
  String companyDetails =
      "Lorem ipsum dolor sit amet, consectetur clittewe adipiscing elit. Lectus tristique eu at turpis acbz quam vivamus debards nomasis eadjsda";
  int price = 24000;
  String label = "REIT";
  String change = "+0.56%";

  double high = 2146.46, low = 1050.20, current = 3000.02;

  List<PriceData> _chartData = [];
  @override
  void initState() {
    _chartData = getChartData();
    print(_chartData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.kPrimaryColor,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {}),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Center(
            child: Text(
              "PRICES",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Image.asset("assets/images/person.png"),
          )
        ],
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
            child: Column(
              children: [
                Text(
                  companyName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  companyDetails,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          preferredSize: Size(0.0, 3 * width / 8),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: menuBox(0, "Price"),
                  flex: 1,
                ),
                Expanded(
                  child: menuBox(1, "Price"),
                  flex: 1,
                ),
                Expanded(
                  child: menuBox(2, "Valuation"),
                  flex: 1,
                ),
                Expanded(
                  child: menuBox(3, "Future"),
                  flex: 1,
                ),
                Expanded(
                  child: menuBox(4, "Past"),
                  flex: 1,
                ),
              ],
            ),
            priceOverview(),
          ],
        ),
      ),
    );
  }

  int barIndex = 0;
  Widget menuBox(int index, String title) {
    return Container(
      margin: index == 0
          ? EdgeInsets.only(right: 2.0)
          : index == 4
              ? EdgeInsets.only(left: 2.0)
              : EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            barIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 25.0,
          decoration: BoxDecoration(
            color:
                index == barIndex ? Constants.kPrimaryColor : Colors.grey[600],
            borderRadius: index == 0
                ? BorderRadius.only(
                    topRight: Radius.circular(13.0),
                    bottomRight: Radius.circular(13.0))
                : index == 4
                    ? BorderRadius.only(
                        topLeft: Radius.circular(13.0),
                        bottomLeft: Radius.circular(13.0))
                    : BorderRadius.circular(13.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget priceOverview() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price Overview",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              priceValue("High", high),
              Text("|", style: TextStyle(fontSize: 25.0),),
              priceValue("Low", low),
              Text("|", style: TextStyle(fontSize: 25.0),),
              priceValue("Current", current),
              Text("|", style: TextStyle(fontSize: 25.0),),
              chance("Change", change),
            ],
          ),
          SizedBox(
            height: 13.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 1, child: priceOverviewMenuBox(0, "1M")),
              Expanded(flex: 1, child: priceOverviewMenuBox(1, "3M")),
              Expanded(flex: 1, child: priceOverviewMenuBox(2, "1Y")),
              Expanded(flex: 1, child: priceOverviewMenuBox(3, "3Y")),
              Expanded(flex: 1, child: priceOverviewMenuBox(4, "5Y")),
              Expanded(flex: 1, child: priceOverviewMenuBox(5, "ALL")),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<PriceData, String>>[
                  LineSeries<PriceData, String>(
                      dataSource: _chartData,
                      xValueMapper: (PriceData sales, _) => sales.month,
                      yValueMapper: (PriceData sales, _) => sales.price,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Detailed Statistics", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                statisticsData("Price to Earnings (PE) Ratio ", 55.23),
                statisticsData("Price to Earnings (PE) Ratio ", 55.23),
                statisticsData("Price to Earnings (PE) Ratio ", 55.23),
                statisticsData("Price to Earnings (PE) Ratio ", 55.23),
                statisticsData("Price to Earnings (PE) Ratio ", 55.23),
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Financials", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                statisticsData("Income Statement", -1),
                statisticsData("Income Statement", -1),
                statisticsData("Income Statement", -1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget priceValue(String str, double price) {
    return Column(
      children: [
        Text(
          str,
          style: TextStyle(fontSize: 13.0),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          "Rs. $price",
          style: TextStyle(fontSize: 13.0),
        ),
      ],
    );
  }

  Widget chance(String str, String change) {
    return Column(
      children: [
        Text(
          str,
          style: TextStyle(fontSize: 13.0),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          "$change",
          style: TextStyle(
              fontSize: 13.0,
              color: change[0] == '+' ? Colors.green : Colors.red),
        ),
      ],
    );
  }

  int priceOverviewIndex = 0;
  Widget priceOverviewMenuBox(int index, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            priceOverviewIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 25.0,
          decoration: BoxDecoration(
            color: index == priceOverviewIndex
                ? Constants.kPrimaryColor
                : Colors.grey[600],
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  List<PriceData> getChartData() {
    final List<PriceData> chartData = [
      PriceData("Sep", 100),
      PriceData("Oct", 200),
      PriceData("Nov", 50),
      PriceData("Dec", 350),
      PriceData("Jan", 260),
      PriceData("Feb", 180),
    ];
    return chartData;
  }

  Widget statisticsData(String str, double i) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 7.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[350],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(str),
          Text(i==-1 ? " " : i.toString()),
          Icon(Icons.arrow_forward_ios, size: 17.0,),
        ],
      ),
    );
  }
}

class PriceData {
  PriceData(this.month, this.price);
  final String month;
  final double price;
}
