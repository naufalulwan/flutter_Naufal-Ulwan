import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/screens/add_tour_screen/add_tour_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddTourScreen extends StatelessWidget {
  AddTourScreen({Key? key}) : super(key: key);

  final AddTourController _addTourController = Get.put(AddTourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posting Tempat Wisata',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _addTourController.nameTourController,
                decoration: const InputDecoration(
                  focusColor: Colors.yellowAccent,
                  labelText: 'Nama tempat',
                  hintText: 'Masukan nama tempat',
                ),
                validator: (val) => null,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Foto tempat wisata',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    color: Colors.green,
                    child: const Text(
                      'Pilih File',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _addTourController.getImage(ImageSource.gallery);
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: _addTourController.statusTourController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusColor: Colors.yellowAccent,
                        labelText: 'Status',
                        hintText: 'Buka / Tutup',
                      ),
                      validator: (val) => null,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        title: const Text('Pilih status wisata'),
                        content: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: _addTourController.statusChoice
                                    .map((item) => RadioListTile(
                                        title: Text(item),
                                        value: item,
                                        groupValue: _addTourController
                                            .currentChoice.value,
                                        selected: _addTourController
                                                .currentChoice.value ==
                                            item,
                                        onChanged: (value) {
                                          if (value !=
                                              _addTourController
                                                  .currentChoice) {
                                            _addTourController
                                                .updatChoice(value.toString());
                                            Get.back();
                                          }
                                        }))
                                    .toList()),
                          ),
                        ),
                      ));
                    },
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Keterangan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: _addTourController.captTourController,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: MaterialButton(
                      color: Colors.green,
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _addTourController.postTour();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
