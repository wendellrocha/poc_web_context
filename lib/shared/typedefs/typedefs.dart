import '../enums/popup_menu_options.dart';
import '../models/menu_item_model.dart';

typedef MenuItems = List<MenuItemModel>;
typedef JSON = Map<String, dynamic>;
typedef OptionsCallback<T> = void Function(PopupMenuOptions value, T item);
