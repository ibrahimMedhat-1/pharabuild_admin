import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function() search;
  final Function() addButtonOnPressed;
  final Function(String value) onChange;

  const SearchWidget({
    required this.onChange,
    required this.controller,
    required this.search,
    required this.addButtonOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(11),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Contactor Name ..',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: MaterialButton(
                        color: Color(0xFF004AAD),
                        textColor: Colors.white,
                        onPressed: () {
                          search();
                        },
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        child: const Text('Search'),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onChanged: (value) {
                      onChange(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          minWidth: 70,
          padding: const EdgeInsets.all(5),
          shape: const CircleBorder(side: BorderSide(color:Color(0xFF004AAD))),
          child: const Icon(
            Icons.add,
            color: Color(0xFF004AAD),
          ),
          onPressed: () {
            addButtonOnPressed();
          },
        ),
      ],
    );
  }
}
