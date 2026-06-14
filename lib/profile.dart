import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            profileCard(),
            followers(),
            editProfile(),
            highlightAdd(),
            galleryGrid(),
            posts(),
            posts(),
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage('FB_IMG_1774940215681.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(0, 0, 0, 0),
                const Color.fromARGB(88, 0, 0, 0),
                const Color.fromARGB(255, 0, 0, 0),
              ],
              stops: [.4, .6, 1],
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nazmul Islam",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "@nazmul",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                                Text("Follow"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Proifessional web and app developer , Student of Premier University , Computer Science and Engineering',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget highlightAdd() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_a_photo),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Add Highlight"),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.5,
                          color: const Color.fromARGB(255, 0, 145, 255),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.asset(
                            "454714502_1605822709983642_3052178341574807126_n.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Abir"),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.5,
                          color: const Color.fromARGB(255, 0, 145, 255),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.asset(
                            "483555508_1756483494917562_3101317641058297300_n.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Abir"),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image.asset(
                          "480738932_1739633569935888_4729460214236419955_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Abir"),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image.asset(
                          "483682713_1756867504879161_122857320582433977_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Abir"),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image.asset(
                          "539752335_1887395985159645_3608863085456590024_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text("Abir"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget followers() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset(
                                '454714502_1605822709983642_3052178341574807126_n.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100,
                                ),
                                child: Image.asset(
                                  '480738932_1739633569935888_4729460214236419955_n.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                color: const Color.fromARGB(255, 24, 24, 24),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100,
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "150k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 24, 24, 24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset(
                                'FB_IMG_1774940215681.jpg.',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100,
                                ),
                                child: Image.asset(
                                  '654299492_2064424464123462_1105435852741189062_n.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                color: const Color.fromARGB(255, 24, 24, 24),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100,
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "100k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 24),
      child: Container(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 33, 149, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.white),
              ),
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget galleryGrid() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,

                    child: Row(
                      children: [
                        Icon(Icons.grid_3x3, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "167",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 80,
                    width: 80,

                    child: Row(
                      children: [
                        Icon(Icons.camera, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "167",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 80,
                    width: 80,

                    child: Row(
                      children: [
                        Icon(Icons.video_camera_back, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "167",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Row(
                      children: [
                        Icon(Icons.save, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "167",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(
                              '628225991_2024501181449124_6444500452461940511_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(
                              '622277020_2014844255748150_320985913547186696_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(
                              '488157969_1773072689925309_2812762869401294686_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(
                              '454714502_1605822709983642_3052178341574807126_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(
                              '480738932_1739633569935888_4729460214236419955_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 160,
                          width: double.infinity,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),

                            child: Image.asset(
                              '486788704_1769497820282796_7714747672620460104_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget posts() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 12),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.public),
                      SizedBox(width: 5),
                      Text(
                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        '483682713_1756867504879161_122857320582433977_n.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(0, 255, 255, 255),
                          const Color.fromARGB(65, 0, 0, 0),
                          const Color.fromARGB(214, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [.4, .8, 1],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'A new day to enjoy with saying hello',
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                          SizedBox(height: 05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.comment,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "628225991_2024501181449124_6444500452461940511_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.public),
                      SizedBox(width: 5),
                      Text(
                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        '488157969_1773072689925309_2812762869401294686_n.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(0, 255, 255, 255),
                          const Color.fromARGB(65, 0, 0, 0),
                          const Color.fromARGB(214, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [.4, .8, 1],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'A new day to enjoy with saying hello',
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                          SizedBox(height: 05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.comment,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "628225991_2024501181449124_6444500452461940511_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.public),
                      SizedBox(width: 5),
                      Text(
                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        '539752335_1887395985159645_3608863085456590024_n.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(0, 255, 255, 255),
                          const Color.fromARGB(65, 0, 0, 0),
                          const Color.fromARGB(214, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [.4, .8, 1],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'A new day to enjoy with saying hello',
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                          SizedBox(height: 05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.comment,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "55",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "483682713_1756867504879161_122857320582433977_n.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
