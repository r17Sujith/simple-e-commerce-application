import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_healthify/enums/wtf_category_enum.dart';
import 'package:wtf_healthify/provider/nearest_gym_provider.dart';
import 'package:wtf_healthify/screens/pick_location_screen.dart';
import 'package:wtf_healthify/utils/shared_preference.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late String location;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NearestGymProvider>(context, listen: false).callGetNearestGym();
    });
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    final provider = Provider.of<NearestGymProvider>(context, listen: false);
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      provider.callGetNearestGym();
    }
  }

  void _onCategorySelected(WTFCategoryEnum category) {
    sharedPrefs.selectedSection = category.name;
    final provider = Provider.of<NearestGymProvider>(context, listen: false);
    provider.setCategory(category);
  }

  void _onSearchSubmitted(String query) {
    final provider = Provider.of<NearestGymProvider>(context, listen: false);
    provider.setSearchQuery(query);
  }

  @override
  Widget build(BuildContext context) {
    final String city = Provider.of<NearestGymProvider>(context, listen: true).city;
    final String address = Provider.of<NearestGymProvider>(context, listen: true).address;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left_square,color: Colors.black,),
          onPressed: () {
            // Handle back arrow pressed
          },
        ),
        title: Center(
          child: FittedBox(
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PickLocationScreen()));
                  },
                  icon: const Icon(Icons.location_on,color: Colors.black ,),
                  label: Row(
                   children: [
                     Text(
                       city,
                       style: const TextStyle(color: Colors.black), // Set text color to black
                     ),
                     const Icon(Icons.arrow_drop_down, color: Colors.black), // Set arrow color to black
                   ],
                      ),
                ),
                Text(
                  address,
                  style: const TextStyle(color:Colors.black54,fontSize: 16), // Set text color to black
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white, // Set app bar background color
      ),
      body:  Consumer<NearestGymProvider>(
        builder: (context, provider, _) {
          final filteredData = provider.getFilteredData();
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TextFormField(
                  onChanged: (value){
                    _onSearchSubmitted(value);
                  },
                  controller: _searchController,
                  onFieldSubmitted: _onSearchSubmitted,
                  decoration: InputDecoration(
                    hintText: 'Search by gym name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.grey[300],
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _onSearchSubmitted(_searchController.text);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.shade900,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final chip = provider.category.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        _onCategorySelected(chip);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Chip(
                          label: Text(
                            chip.name,
                            style: TextStyle(
                              color: provider.selectedCategory == chip ? Colors.white : Colors.black,
                            ),
                          ),
                          backgroundColor: provider.selectedCategory == chip ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if(provider.page==1) const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              if(filteredData.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text("No content available"),
                  ),
                ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final gymDetails = filteredData[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: gymDetails.categoryName=="Exclusive"?const LinearGradient(
                            colors: [Colors.orange, Colors.red, Colors.black],
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                          ):null,
                          color: gymDetails.categoryName!="Exclusive"?Colors.white:null,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 20, bottom: 8.0),
                                child: Text(
                                  gymDetails.categoryName!.toUpperCase(),
                                  style:  TextStyle(
                                    color: gymDetails.categoryName=="Exclusive"?Colors.white:Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: gymDetails.coverImage!=null? BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          gymDetails.coverImage!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ):
                                  gymDetails.gallery!=null&&gymDetails.gallery!.isNotEmpty&&gymDetails.gallery!.first.images!=null?
                                  BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          gymDetails.gallery!.first.images!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ):null,
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 10,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    child: ClipPath(
                                      clipper: _RightCutClipper(),
                                      child: Container(
                                        color:gymDetails.categoryName=="Exclusive"?Colors.orange.shade600: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: WhiteDivider(),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              gymDetails.gymName!,
                              style:  TextStyle(
                                  color: gymDetails.categoryName=="Exclusive"?Colors.white:Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${gymDetails.distanceText} - ${gymDetails.address1!}\n${gymDetails.address2!}",
                              style:  TextStyle(
                                color: gymDetails.categoryName=="Exclusive"?Colors.white:Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 125,
                              color: Colors.black87,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 20, 16, 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'Starting at ₹${gymDetails.planPrice ?? "Amount"}/month',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Handle free first day button press
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red
                                                      .shade900,
                                                  // Set the button background color to red
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(100),
                                                  ),
                                                ),
                                                child: const Text(
                                                    'FREE FIRST DAY',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Handle buy now button press
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey
                                                      .shade700,
                                                  // Set the button background color to grey
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(100),
                                                  ),
                                                ),
                                                child: const Text('BUY NOW',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const WhiteDivider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WhiteDivider extends StatelessWidget {
  const WhiteDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: MediaQuery.of(context).size.width * 0.25,
      child: ClipPath(
        clipper: _RightCutClipper(),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _RightCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(20, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 20, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_RightCutClipper oldClipper) => false;
}