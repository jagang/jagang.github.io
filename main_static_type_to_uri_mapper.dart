library platelist.web.main.generated_type_uris;

import 'package:angular/core_dom/type_to_uri_mapper.dart';
import 'package:platelist/platelist.dart' as import_0;

/// Used when URIs have been converted to be page-relative at build time.
class _StaticTypeToUriMapper implements TypeToUriMapper {
  Uri uriForType(Type type) {
    var uri = _uriMapping[type];
    if (uri == null) {
      throw new StateError('Unable to find URI mapping for $type');
    }
    return uri;
  }
}

final typeToUriMapper = new _StaticTypeToUriMapper();

final Map<Type, Uri> _uriMapping = <Type, Uri> {
  import_0.PlateListComponent: Uri.parse(r'''package:platelist/platelist.dart'''),
};
