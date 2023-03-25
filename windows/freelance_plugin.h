#ifndef FLUTTER_PLUGIN_FREELANCE_PLUGIN_H_
#define FLUTTER_PLUGIN_FREELANCE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace freelance {

class FreelancePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FreelancePlugin();

  virtual ~FreelancePlugin();

  // Disallow copy and assign.
  FreelancePlugin(const FreelancePlugin&) = delete;
  FreelancePlugin& operator=(const FreelancePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace freelance

#endif  // FLUTTER_PLUGIN_FREELANCE_PLUGIN_H_
