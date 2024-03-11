import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buku_masjid/l10n/l10n.dart';

class PhoneTextInput extends StatefulWidget {
  const PhoneTextInput({
    super.key,
    this.style,
    this.onChange,
    this.focusNode,
    this.inputAction,
    this.onSubmit,
    this.readOnly,
    this.hintText,
    this.errorText,
    this.suffix,
    this.label,
    this.isRequired,
    required this.controller,
  });

  final TextStyle? style;
  final ValueChanged<String>? onChange;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final ValueChanged<String>? onSubmit;
  final bool? readOnly;
  final String? hintText;
  final String? errorText;
  final Widget? suffix;
  final String? label;
  final bool? isRequired;
  final TextEditingController controller;

  @override
  State<PhoneTextInput> createState() => _PhoneTextInputState();
}

class _PhoneTextInputState extends State<PhoneTextInput> {
  Country _currentCountry = CountriesData.data.first;

  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _initializeFormatPhone();
    super.initState();
  }

  @override
  void setState(Function fn) {
    if (mounted) {
      super.setState(fn as void Function());
    }
  }

  @override
  void didUpdateWidget(covariant PhoneTextInput oldWidget) {
    if (getCurrentValue() != oldWidget.controller.text.replaceAll('+', '')) {
      if (widget.controller.text.isEmpty) {
        _phoneController.text = '';
      }
      _initializeFormatPhone();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _initializeFormatPhone() {
    var isFoundCountry = false;

    if (widget.controller.text.isNotEmpty) {
      for (final item in CountriesData.data) {
        final currentCountryCode = item.dialCode.replaceAll('+', '');

        final valueParam = widget.controller.text.replaceAll('+', '');

        if (valueParam.startsWith(currentCountryCode)) {
          if (valueParam != getCurrentValue()) {
            _currentCountry = item;
            _phoneController.text =
                valueParam.replaceFirst(currentCountryCode, '');
            phoneNumberControllerListener();
            isFoundCountry = true;
          }
          break;
        }
      }

      if (!isFoundCountry) {
        _phoneController.text = int.tryParse(widget.controller.text).toString();
        phoneNumberControllerListener();
      }
    }
  }

  void phoneNumberControllerListener() {
    if (mounted) {
      if (widget.onChange != null) {
        widget.onChange?.call(getCurrentValue());
      }

      widget.controller.text = getCurrentValue();
    }
  }

  String getCurrentValue() {
    final number = int.tryParse(_phoneController.text);
    return (_currentCountry.dialCode).replaceFirst('+', '') +
        (number ?? '').toString();
  }

  @override
  Widget build(BuildContext context) {
    final disabledColor = context.theme.disabledColor;
    final error = context.theme.colorScheme.error;
    final primaryColor = context.theme.primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputLabel(
          label: widget.label,
          isRequired: widget.isRequired,
        ),
        Row(
          children: [
            _buildPrefix(),
            Dimens.dp16.width,
            Expanded(
              child: RegularInput(
                style: widget.style,
                onChange: (_) => phoneNumberControllerListener(),
                prefix: _buildPrefix(),
                focusNode: widget.focusNode,
                inputAction: widget.inputAction ?? TextInputAction.done,
                inputType: TextInputType.phone,
                onSubmit: widget.onSubmit,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                readOnly: widget.readOnly ?? false,
                controller: _phoneController,
                errorText: widget.errorText,
                isRequired: widget.isRequired,
                decoration: InputDecoration(
                  filled: false,
                  counterText: '',
                  hintText: widget.hintText ?? '',
                  hintStyle: context.theme.textTheme.titleLarge?.copyWith(
                    color: context.theme.disabledColor,
                  ),
                  errorText: widget.errorText,
                  suffixIcon: widget.suffix,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: Dimens.dp14,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: disabledColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: disabledColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: disabledColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: error),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: error),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrefix() {
    return InkWell(
      onTap: (widget.readOnly ?? false) ? null : _showPickCountry,
      borderRadius: BorderRadius.circular(Dimens.dp50),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.dp12,
          vertical: Dimens.dp6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.disabledColor.withOpacity(.8),
          ),
          borderRadius: BorderRadius.circular(Dimens.dp50),
        ),
        child: _buildItemCountry(_currentCountry),
      ),
    );
  }

  Widget _buildItemCountry(Country phone) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          phone.flag,
          width: Dimens.dp18,
          height: Dimens.dp24,
        ),
        Dimens.dp4.width,
        RegularText.semiboldSolid(context, phone.dialCode),
      ],
    );
  }

  void onCountryChanged(Country v) {
    setState(() {
      _currentCountry = v;
    });
    phoneNumberControllerListener();
  }

  void _showPickCountry() {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ContentSheet(
        height: Dimens.height(context) * 0.6,
        content: _CountryList(
          key: widget.key,
          onChange: onCountryChanged,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

class _CountryList extends StatefulWidget {
  const _CountryList({super.key, this.onChange});

  final ValueChanged<Country>? onChange;

  @override
  __CountryListState createState() => __CountryListState();
}

class __CountryListState extends State<_CountryList> {
  final TextEditingController _controller = TextEditingController();
  final List<Country> _searchData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
          child: SearchTextInput(
            controller: _controller,
            hintText: '${context.l10n.search}...',
            onChanged: (value) => _onSearch(),
            onClear: () {
              _controller.clear();
              _onSearch();
            },
          ),
        ),
        if (_controller.text.isEmpty)
          _buildListCountry(CountriesData.data)
        else
          _buildListCountry(_searchData),
      ],
    );
  }

  Widget _buildListCountry(List<Country> data) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(Dimens.dp16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) {
          return ListTile(
            onTap: () {
              if (widget.onChange != null) {
                widget.onChange!(data[i]);
                Navigator.of(context).pop();
              }
            },
            leading: Image.asset(
              data[i].flag,
              width: Dimens.dp24,
              height: Dimens.dp24,
            ),
            title: SubTitleText(data[i].name),
            trailing: RegularText.semiboldSolid(context, data[i].dialCode),
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(thickness: 1, height: 0);
        },
        itemCount: data.length,
      ),
    );
  }

  void _onSearch() {
    _searchData.clear();
    for (final item in CountriesData.data) {
      if (item.name.toLowerCase().contains(_controller.text.toLowerCase()) ||
          item.dialCode.contains(_controller.text)) {
        _searchData.add(item);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
