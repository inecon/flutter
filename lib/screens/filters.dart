import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  void _setGlutenFreeFilter(bool value) {
    setState(() {
      _glutenFreeFilterSet = value;
    });
  }

  void _setLactoseFreeFilter(bool value) {
    setState(() {
      _lactoseFreeFilterSet = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filters'),
        ),
        // drawer: MainDrawer( onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
        //   }
        // }),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFilterSet,
              Filter.vegan: _veganFilterSet,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _setGlutenFreeFilter(isChecked);
                  });
                },
                title: Text('Gluten-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include gluten-free meals',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _setLactoseFreeFilter(isChecked);
                  });
                },
                title: Text('Lactose-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include lactose-free meals',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                  });
                },
                title: Text('Vegetarian',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text(
                  'Only include vegetarian meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                  });
                },
                title: Text('Vegan',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text(
                  'Only include vegan meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              )
            ],
          ),
        ));
  }
}
