import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_healthify/provider/nearest_gym_provider.dart';
import 'package:wtf_healthify/utils/shared_preference.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NearestGymProvider>(context, listen: false).callGetCities();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left_square,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context); // Handle back arrow press to navigate back
          },
        ),
        title: const Text('Pick Location',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
        actions: [
          InkWell(
            onTap: () {
              // Handle clickable text pressed
              // Show dropdown or perform any action
            },
            child: const Row(
              children: [
                Text(
                  'Noida',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body:Consumer<NearestGymProvider>(
        builder: (context, provider, _) {
          final location = provider.listOfCities;
          if (provider.isCityLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search location',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      sharedPrefs.removeKey(sharedPrefs.keySelectedLocation);
                      Provider.of<NearestGymProvider>(context, listen: false).callGetNearestGym(refresh: true);
                      Navigator.pop(context);
                    },
                    child: Card(
                      color: Colors.grey.shade100,
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.gps_fixed),
                            const SizedBox(width: 8.0),
                            const Expanded(child: Text('Around your location',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),)),
                            Icon(Icons.arrow_forward,color: Colors.red.shade800,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  child: IconButton(
                    icon: const Icon(Icons.edit_location),
                    onPressed: () {
                      // Handle edit location icon pressed
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  'AREA',
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' (No. of Gyms)',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  // Rest of the body content goes here
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: location.length,
                itemBuilder: (context, index) {
                  final locations = location[index];
                  return InkWell(
                    onTap: (){
                      sharedPrefs.selectedLocation =locations.location;
                      Provider.of<NearestGymProvider>(context, listen: false).callGetNearestGym(refresh: true);
                      Navigator.pop(context);
                    },
                    child: Card(
                      color: Colors.grey.shade100,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 12.0),
                            Expanded(child: Text(locations.address2!,style: const TextStyle(
                              fontSize: 16.0,
                            ),))
                            // ListTile(
                            //   leading: Icon(Icons.location_on),
                            //   title: Text(location.name),
                            //   onTap: () {
                            //     // Handle location card pressed
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );}),
    );
  }

}
