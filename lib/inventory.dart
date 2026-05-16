import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inventory extends StatefulWidget {
  const inventory({super.key});

  @override
  State<inventory> createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  final TextEditingController productUrlController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productpriceController = TextEditingController();
  final TextEditingController productAmmountController =
      TextEditingController();

  final List<Map<String, dynamic>> productList = [];

  void addProduct() {
    final productUrl = productUrlController.text.trim();
    final productName = productNameController.text.trim();
    final productPrice = int.tryParse(productpriceController.text.trim()) ?? 0;
    final productAmmount =
        int.tryParse(productAmmountController.text.trim()) ?? 0;

    if (productName.isEmpty) {
      return;
    }

    String discount = '';
    String disMessage = "";
    setState(() {
      if (productPrice <= 1000) {
        discount = "0%";
      } else if (productPrice <= 2000) {
        discount = "5";
      } else if (productPrice <= 3000) {
        discount = "10";
      } else if (productPrice <= 5000) {
        discount = "15";
      } else {
        discount = "20";
      }
      switch (discount) {
        case "0%":
          disMessage = 'Normal Price';
          break;

        case "5%":
          disMessage = 'Small Discount';
          break;

        case "10":
          disMessage = 'Good Offer';
          break;

        case "15":
          disMessage = 'Have a good day';
          break;

        case "20":
          disMessage = 'Best Deal';
          break;

        default:
          disMessage = 'Unknown';
      }
    });

    final Map<String, dynamic> product = {
      'productUrl': productUrl,
      'productName': productName,
      'productPrice': productPrice,
      'productAmmount': productAmmount,
      'discount': discount,
      'disMessage': disMessage,
    };

    setState(() {
      productList.add(product);
      productAmmountController.clear();
      productUrlController.clear();
      productNameController.clear();
      productpriceController.clear();
    });
  }

  void clearData() {
    setState(() {
      productAmmountController.clear();
      productUrlController.clear();
      productNameController.clear();
      productpriceController.clear();
    });
  }

  void removeProduct(String productName) {
    setState(() {
      productList.removeWhere(
        (product) =>
            product['productName'].toString().toLowerCase() ==
            productName.toLowerCase(),
      );
    });
  }

  @override
  void dispose() {
    productAmmountController.dispose();
    productNameController.dispose();
    productUrlController.dispose();
    productpriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: productUrlController,
              decoration: InputDecoration(
                labelText: "Product URL",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: productpriceController,
                    decoration: InputDecoration(
                      labelText: "Product Prize",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: productAmmountController,
                    decoration: InputDecoration(
                      labelText: "Product Ammount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: addProduct,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Add Product",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: ElevatedButton(
                    onPressed: clearData,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Clear All",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text("Total PRoducts: ${productList.length}"),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,

                itemCount: productList.length,

                itemBuilder: (context, index) {
                  final viewproduct = productList[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 205, 210, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          viewproduct['productUrl'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                viewproduct['productName'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text("Price: ${viewproduct['productPrice']}"),

                              Text("Amount: ${viewproduct['productAmmount']}"),

                              Text("Got Discount: ${viewproduct['discount']}"),

                              Text("${viewproduct['disMessage']}"),
                            ],
                          ),
                        ),
                        IconButton(

                          onPressed: ()=> removeProduct(viewproduct['productName'].toString()),
                          icon: Icon(Icons.delete,color: Colors.red,),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
