///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-11-01 02:05
///
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker_demo/customs/pickers/directory_file_asset_picker.dart';

import '../constants/custom_pick_method.dart';
import '../constants/extensions.dart';

class CustomPickersPage extends StatefulWidget {
  @override
  _CustomPickerPageState createState() => _CustomPickerPageState();
}

class _CustomPickerPageState extends State<CustomPickersPage>
    with AutomaticKeepAliveClientMixin {
  ThemeData get currentTheme => context.themeData;

  List<CustomPickMethod> get pickMethods {
    return <CustomPickMethod>[
      CustomPickMethod(
        icon: '🗄',
        name: 'Directory+File picker',
        description: 'The picker is built with `Directory` and `File` '
            'as entities, which allows users to display/select `File` '
            'through `Directory`.',
        method: (BuildContext context) => Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (_) => const DirectoryFileAssetPicker(),
          ),
        ),
      ),
    ];
  }

  Widget methodItemBuilder(BuildContext _, int index) {
    final CustomPickMethod model = pickMethods[index];
    return InkWell(
      onTap: () => model.method(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(2.0),
              width: 48,
              height: 48,
              child: Center(
                child: Text(
                  model.icon,
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model.description,
                    style: context.themeData.textTheme.caption,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget get methodListView {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemCount: pickMethods.length,
        itemBuilder: methodItemBuilder,
      ),
    );
  }

  Widget get tips {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'This page contains customized pickers with different asset types, '
        'different UI layouts, or some use case for specific apps. '
        'Contribute to add your custom picker are welcomed.',
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: <Widget>[tips, methodListView]);
  }
}
