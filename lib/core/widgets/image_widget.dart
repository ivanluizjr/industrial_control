import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  final String? semanticsLabel;
  final Color? color;
  final bool isNetwork;
  final double? height;
  final double? width;
  final bool isSVG;
  final BoxFit? fit;

  const ImageWidget._({
    required this.path,
    this.semanticsLabel,
    this.color,
    this.isNetwork = false,
    this.height,
    this.width,
    this.isSVG = true,
    this.fit,
    super.key,
  });

  factory ImageWidget.asset({
    required String path,
    String? semanticsLabel,
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) =>
      ImageWidget._(
        path: path,
        color: color,
        semanticsLabel: semanticsLabel,
        height: height,
        width: width,
        fit: fit,
      );

  factory ImageWidget.network({
    required String path,
    String? semanticsLabel,
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) =>
      ImageWidget._(
        path: path,
        semanticsLabel: semanticsLabel,
        color: color,
        isNetwork: true,
        height: height,
        width: width,
        fit: fit,
      );

  factory ImageWidget.iconButtonCompanies({
    Color? color,
    double? height,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_button_companies.svg',
      semanticsLabel: 'Icon Companies',
      color: color,
      height: height,
      isSVG: true,
    );
  }

  factory ImageWidget.logoTractianAppBar({
    Color? color,
    double? height,
    double? width,
  }) {
    return ImageWidget._(
      path: 'assets/logos/logo_tractian.svg',
      semanticsLabel: 'Logo Tractian',
      color: color,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconBack({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_back.svg',
      semanticsLabel: 'Icon Back',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconAssets({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_assets.svg',
      semanticsLabel: 'Icon Assets',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconComponents({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_components.svg',
      semanticsLabel: 'Icon Components',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconLocations({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_locations.svg',
      semanticsLabel: 'Icon Locations',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconBolt({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_bolt.svg',
      semanticsLabel: 'Icon Bolt',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconCritical({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_critical.svg',
      semanticsLabel: 'Icon Critical',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconExpand({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_expand.svg',
      semanticsLabel: 'Icon Expand',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconCriticalButton({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_critical_button.svg',
      semanticsLabel: 'Icon Critical Button',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconBoltButton({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_bolt_button.svg',
      semanticsLabel: 'Icon Bolt Button',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  factory ImageWidget.iconSearch({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return ImageWidget._(
      path: 'assets/icons/icon_search.svg',
      semanticsLabel: 'Icon Search',
      color: color,
      fit: fit,
      height: height,
      width: width,
      isSVG: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? path.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: path,
                width: width,
                height: height,
                color: color,
                fit: fit ?? BoxFit.contain,
                placeholder: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
              )
            : const SizedBox.shrink()
        : isSVG
            ? SvgPicture.asset(
                path,
                semanticsLabel: semanticsLabel,
                // ignore: deprecated_member_use
                color: color,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
              )
            : Image.asset(
                path,
                semanticLabel: semanticsLabel,
                color: color,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              );
  }
}
