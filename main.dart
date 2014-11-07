library plate;
import 'package:angular/angular.dart';
import 'package:angular/application_factory_static.dart';
import 'package:platelist/platelist.dart';
import 'main_generated_type_factory_maps.dart' show setStaticReflectorAsDefault;
import 'main_static_expressions.dart' as generated_static_expressions;
import 'main_static_metadata.dart' as generated_static_metadata;
import 'main_static_type_to_uri_mapper.dart' as generated_static_type_to_uri_mapper;

class AnprModule extends Module {
  AnprModule() {
    bind(PlateListComponent);
  }
}

void main() {
  setStaticReflectorAsDefault();
  staticApplicationFactory(generated_static_metadata.typeAnnotations, generated_static_expressions.getters, generated_static_expressions.setters, generated_static_expressions.symbols, generated_static_type_to_uri_mapper.typeToUriMapper)
      .addModule(new AnprModule())
      .run();
}