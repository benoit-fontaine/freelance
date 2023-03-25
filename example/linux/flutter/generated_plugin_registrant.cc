//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <freelance/freelance_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) freelance_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FreelancePlugin");
  freelance_plugin_register_with_registrar(freelance_registrar);
}
