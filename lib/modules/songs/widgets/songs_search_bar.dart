import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/songs/songs_page_controller.dart';

class SongsSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = SongsPageController.to;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 16),
                controller: controller.tSearch,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 16),
                  border: InputBorder.none,
                  hintText: "Buscar música",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: controller.handleSearchSong,
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: controller.handleCleanSearch,
                child: Container(
                  padding: const EdgeInsets.only(right: 8),
                  child: controller.search.value.isNotEmpty
                      ? Icon(
                          Icons.close,
                          color: Colors.grey[500],
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
