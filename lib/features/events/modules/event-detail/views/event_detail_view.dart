import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' hide Marker;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/utils/extensions/date.dart';

class EventDetailView extends StatefulWidget {
  const EventDetailView({super.key, required this.event});

  final Event event;

  @override
  EventDetailViewState createState() => EventDetailViewState();
}

class EventDetailViewState extends State<EventDetailView> {
  double latitude = -7.298505009386118;
  double longitude = 112.7618459666079;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late CameraPosition kGooglePlex;

  @override
  void initState() {
    latitude = widget.event.latitude ?? latitude;
    longitude = widget.event.longitude ?? longitude;
    kGooglePlex = CameraPosition(target: LatLng(latitude, longitude), zoom: 16);
    super.initState();
  }

  @override
  void dispose() {
    controller.future.then((value) => value.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: CachedNetworkImage(
        height: 441,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withAlpha(30),
        imageUrl: widget.event.coverImg,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
        errorWidget: (context, url, error) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
      ),
    );

    final date = Row(
      children: [
        Icon(Icons.calendar_today_rounded, color: Colors.white, size: 16),
        SizedBox(width: 6),
        AppTextCaption(
          text: widget.event.date.formattedDate,
          color: Colors.white,
        ),
      ],
    );

    final place = Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
        SizedBox(width: 6),
        AppTextCaption(text: widget.event.city, color: Colors.white),
      ],
    );

    final subHeader = Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextH3SemiBold(text: widget.event.title, color: Colors.white),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [date, SizedBox(width: 12), place],
          ),
        ],
      ),
    );

    final headerContainer = Stack(
      children: [
        header,
        Positioned(bottom: 0, left: 0, right: 0, child: subHeader),
      ],
    );

    final location = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppTextParagraphSemiBold(text: "Lokasi"),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined, size: 24, color: Colors.grey),
            SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextParagraphSemiBold(text: widget.event.address),
                  SizedBox(height: 4),
                  AppTextParagraphSemiBold(
                    text: "${widget.event.city}, ${widget.event.province}",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 134,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.complete(googleMapController);
            },
            markers: {
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(latitude, longitude),
                draggable: false,
                onDragEnd: (coordinate) async {
                  setState(() {
                    latitude = coordinate.latitude;
                    longitude = coordinate.longitude;
                  });
                },
              ),
            },
          ),
        ),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          headerContainer,
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Html(data: widget.event.description),
                SizedBox(height: 12),
                location,
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
