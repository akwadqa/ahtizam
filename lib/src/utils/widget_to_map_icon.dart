import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToBitmapDescriptor on Widget {
  Future<BitmapDescriptor> toBitmapDescriptor({
    double? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 300),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(textDirection: textDirection, child: this),
      ),
    );

    final pngBytes = await createImageFromWidget(
      widget,
      waitToRender: waitToRender,
      logicalSize: logicalSize ?? 100, // Default logical size
      imageSize: imageSize ?? const Size(100, 100), // Default image size
    );

    return BitmapDescriptor.fromBytes(pngBytes);
  }
}

/// **Creates an image from the given widget**
Future<Uint8List> createImageFromWidget(
  Widget widget, {
  double? logicalSize,
  required Duration waitToRender,
  Size? imageSize,
}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;

  logicalSize ??= 100; // Ensure logical size has a default
  imageSize ??= const Size(100, 100); // Ensure image size has a default

  final RenderView renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      physicalConstraints: BoxConstraints(
        maxWidth: logicalSize,
        maxHeight: logicalSize,
      ),
      logicalConstraints: BoxConstraints(
        maxWidth: logicalSize,
        maxHeight: logicalSize,
      ),
      devicePixelRatio: view.devicePixelRatio,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);
  await Future.delayed(waitToRender);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image =
      await repaintBoundary.toImage(pixelRatio: imageSize.width / logicalSize);
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
