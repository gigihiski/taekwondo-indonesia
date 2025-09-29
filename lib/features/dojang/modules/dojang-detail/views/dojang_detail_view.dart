import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class DojangDetailView extends StatefulWidget {
  const DojangDetailView({super.key, required this.dojang});

  final Dojang dojang;

  @override
  DojangDetailViewState createState() => DojangDetailViewState();
}

class DojangDetailViewState extends State<DojangDetailView> {
  double latitude = -7.298505009386118;
  double longitude = 112.7618459666079;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late CameraPosition kGooglePlex;

  @override
  void initState() {
    latitude = widget.dojang.latitude ?? latitude;
    longitude = widget.dojang.longitude ?? longitude;
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
    Widget item(IconData icon, String value) {
      return InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            SizedBox(width: 4),
            AppTextCaption(text: value),
          ],
        ),
      );
    }

    final image = SizedBox(
      height: 223,
      child: Center(
        child: CachedNetworkImage(
          height: 223,
          width: 223,
          imageUrl: widget.dojang.logoUrl ?? "",
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
          },
          errorWidget: (context, url, error) {
            return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
          },
        ),
      ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextParagraphSemiBold(text: widget.dojang.address),
                SizedBox(height: 4),
                AppTextParagraphSemiBold(
                  text: "${widget.dojang.city}, ${widget.dojang.province}",
                ),
              ],
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

    final information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextParagraphSemiBold(text: "Kontak"),
        SizedBox(height: 12),
        item(Icons.phone, widget.dojang.phoneNumber ?? ""),
        SizedBox(height: 6),
        item(Icons.email, widget.dojang.email ?? ""),
        SizedBox(height: 6),
        item(Icons.public, widget.dojang.website ?? ""),
      ],
    );

    final galleries = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppTextParagraphSemiBold(text: "Galleries"),
        SizedBox(height: 12),
        SizedBox(
          height: 134,
          child: ListView.separated(
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: 3,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                width: 198,
                imageUrl: widget.dojang.logoUrl ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
                },
                errorWidget: (context, url, error) {
                  return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ),
      ],
    );

    final description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppTextParagraphSemiBold(text: "Latar Belakang"),
        SizedBox(height: 12),
        AppTextCaption(text: widget.dojang.description ?? ""),
      ],
    );

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image,
            SizedBox(height: 31),
            AppTextH3SemiBold(text: widget.dojang.name),
            SizedBox(height: 12),
            description,
            SizedBox(height: 25),
            information,
            SizedBox(height: 25),
            galleries,
            SizedBox(height: 25),
            location,
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
