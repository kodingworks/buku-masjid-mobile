import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  const DropdownInput({
    super.key,
    this.label,
    this.isRequired,
    this.hintText,
    this.value,
    required this.items,
    required this.id,
    this.errorText,
    this.onChanged,
    required this.valueController,
  });

  final String? label;
  final bool? isRequired;
  final String? hintText;
  final String? value;
  final List<String> items;
  final List<String> id;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextEditingController valueController;

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: widget.label,
          isRequired: widget.isRequired,
        ),
        InkWell(
          onTap: _showSelectItemSheet,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: IgnorePointer(
            child: RegularInput(
              controller: widget.valueController,
              hintText: widget.hintText,
              errorText: widget.errorText,
              suffix: Icon(
                Icons.expand_more,
                color: context.theme.disabledColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSelectItemSheet() {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Dimens.dp50),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.items[index]),
                    trailing: widget.items[index] == widget.value
                        ? Icon(
                            Icons.check,
                            color: context.adaptiveTheme.primaryColor,
                          )
                        : null,
                    onTap: () {
                      Navigator.of(context).pop();
                      widget.valueController.text = widget.items[index];
                      widget.onChanged?.call(widget.id[index]);
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(
                  height: 0,
                  thickness: .2,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.items.length,
              ),
            ),
          ),
          Positioned(
            top: Dimens.dp8,
            left: (Dimens.width(context) - 80) / 2,
            child: Container(
              width: 80,
              height: 4,
              margin: const EdgeInsets.only(top: Dimens.dp16),
              decoration: BoxDecoration(
                color: context.adaptiveTheme.tertiaryColor,
                borderRadius: BorderRadius.circular(Dimens.dp4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
