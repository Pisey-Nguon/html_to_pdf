package com.digitaltalend.html_to_pdf

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** HtmlToPdfPlugin */
class HtmlToPdfPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "html_to_pdf")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call!!.method == "convertHtmlToPdf") {
      convertHtmlToPdf(call, result)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun convertHtmlToPdf(call: MethodCall, result: Result) {
    val htmlFilePath = call.argument<String>("htmlFilePath")

    HtmlToPdfConverter().convert(htmlFilePath!!, applicationContext, object : HtmlToPdfConverter.Callback {
      override fun onSuccess(filePath: String) {
        result.success(filePath)
      }

      override fun onFailure() {
        result.error("ERROR", "Unable to convert html to pdf document!", "")
      }
    })
  }
}
