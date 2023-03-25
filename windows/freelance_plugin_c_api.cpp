#include "include/freelance/freelance_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "freelance_plugin.h"

void FreelancePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  freelance::FreelancePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
