import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:flutter/material.dart';


class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();

}

class _ProductListPageState extends State<ProductListPage> {
  bool onTap= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image and Details
            Row(
              children: [
                // Product Image on the left
                Container(
                 // width: 100,
                  height: 100,
                  child: Image.asset(
                    ImagePath.cycle,
                    fit: BoxFit.cover,
                  )
                ),
                // Product Details on the right
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Product Title
                        Text(
                          'Product Title',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Product Description
                        Text(
                          'Product Description goes here. Provide detailed information about the product.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Buttons at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
               Utils.showDialogBox(context, "why are you use", "ok");
                  },
                  child: const Text('More details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onTap = !onTap; // Toggle the value of onTap
                    });
                  },
                  child: Text(
                    onTap ? 'Surrender' : 'Request', // Set the text based on onTap state
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
