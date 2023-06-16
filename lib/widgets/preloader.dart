import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';

typedef ErrorEvent = void Function(Exception e);
typedef SuccessEvent = void Function();

class Preloader extends StatefulWidget {
  final List<Reference>? firebaseRefs;
  final List<String>? imageAssets;
  final List<String>? imageUrls;
  final Widget child;
  final ErrorEvent? onError;
  final SuccessEvent? onSuccess;

  const Preloader({
    Key? key,
    this.firebaseRefs,
    this.imageAssets,
    this.imageUrls,
    required this.child,
    this.onError,
    this.onSuccess,
  }) : super(key: key);

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  int _total = 0;
  int _finished = 0;
  bool _showLoader = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> preloadRef(Reference ref) async {
    final ListResult results = await ref.listAll();
    for (var ref in results.prefixes) {
      await preloadRef(ref);
    }
    for (var item in results.items) {
      await preloadFromUrl(await item.getDownloadURL());
    }
  }

  Future<void> precacheItem(ImageProvider<Object> provider) async {
    try {
      await precacheImage(provider, context);
    } catch (e) {
      if (widget.onError != null) {
        widget.onError!(Exception(e));
      }
    }
  }

  Future<void> preloadFromUrl(String url) async {
    await precacheItem(NetworkImage(url));
  }

  Future<void> preloadAsset(String asset) async {
    await precacheItem(AssetImage(asset));
  }

  Future<void> preload() async {
    final List<Reference> refs = widget.firebaseRefs ?? [];
    final List<String> assets = widget.imageAssets ?? [];
    final List<String> urls = widget.imageUrls ?? [];
    setState(() {
      _total = refs.length + assets.length + urls.length;
    });
    for (Reference ref in refs) {
      await preloadRef(ref);
      setState(() {
        _finished++;
      });
    }
    for (String asset in assets) {
      await preloadAsset(asset);
      setState(() {
        _finished++;
      });
    }
    for (String url in urls) {
      await preloadFromUrl(url);
      setState(() {
        _finished++;
      });
    }
    setState(() {
      _showLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    preload();
    if (_showLoader) {
      double? progressIndicator = (_total == 0) ? null : _finished / _total;
      return ProgressIndicator(
        value: progressIndicator,
      );
    } else {
      if (widget.onSuccess != null) {
        widget.onSuccess!();
      }
      return widget.child;
    }
  }
}

class ProgressIndicator extends StatelessWidget {
  final double? value;

  const ProgressIndicator({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: CircularProgressIndicator(
              value: value,
            ),
          ),
          Text("Chargement en cours...",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
