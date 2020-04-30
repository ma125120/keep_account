import 'package:keep_account/common/adapt.dart';
import 'package:keep_account/components/index.dart';

class MyPopMenuItem extends StatelessWidget {
  final String labelText;
  final double labelWidth;
  final String value;
  final ValueChanged<String> onChange;
  final ValueChanged<String> onSaved;
  final List list;
  final String idName;
  final String labelName;
  final String iconName;
  final Map map;
  final bool isShowBorder;
  final ValidateCallback validator;

  MyPopMenuItem({
    @required this.labelText,
    this.labelWidth,
    this.value,
    this.map = const {},
    this.list = const [],
    this.isShowBorder = true,
    this.idName = 'id',
    this.labelName = 'name',
    this.iconName = 'icon',
    this.onSaved,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return MyFormItem(
      isShowBorder: isShowBorder,
      labelText: labelText,
      child: FormField(
        builder: (FormFieldState field) {
          return GestureDetector(
            onTap: () {
              MyConst.onTapBlank(context);
            },
            child: renderPopup(primary, field),
          );
        },
        initialValue: value,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }

  PopupMenuButton<String> renderPopup(
    Color primary,
    FormFieldState field,
  ) {
    String value = field.value;

    Color color = map[value] != null ? primary : MyConst.lowTextColor;

    return PopupMenuButton<String>(
      initialValue: value,
      child: Container(
        width: double.infinity,
        alignment: AlignmentDirectional.centerEnd,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              map[value] != null ? map[value][labelName] : '请选择$labelText',
              style: TextStyle(color: color),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              // size: 16,
            ),
          ],
        ),
      ),
      onSelected: (String value) {
        field.didChange(value);
      },
      itemBuilder: (_) {
        return list
            .map((v) => PopupMenuItem<String>(
                value: v[idName],
                child: Row(
                  children: <Widget>[
                    Iconfont(
                      v[iconName],
                      color: v[idName] == value ? primary : null,
                    ),
                    Container(
                      width: Adapt.px(8),
                    ),
                    Text(v[labelName],
                        style: TextStyle(
                          color: v[idName] == value ? primary : null,
                        ))
                  ],
                )))
            .toList();
      },
    );
  }
}
