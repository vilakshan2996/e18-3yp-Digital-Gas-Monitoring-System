# Hardware Configuration:

If you are working with an ESP32 Wooover Kit and the drivers are not found in the device manager, you will need to download and install the CP2102 driver for the USB to UART bridge controller.

- [CP2102 driver](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads)

## PlatformIO Configurations:

To use the latest version of the ESPAsyncWebServer library in your project, you can add the library directly from GitHub in your platformio.ini file using the lib_deps option. Here's an example:

```
lib_deps =
    https://github.com/me-no-dev/ESPAsyncWebServer.git
```


Note that we are using the full GitHub URL of the library instead of the name ESPAsyncWebServer alone. This will ensure that the latest version of the library is downloaded and included in your project.
