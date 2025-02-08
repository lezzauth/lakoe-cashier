package com.lakoe.app

import android.content.ContentValues
import android.os.Build
import android.provider.MediaStore
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.OutputStream

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import androidx.core.content.FileProvider
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL_MEDIA = "com.lakoe.app/media"
    private val CHANNEL_WHATSAPP = "com.lakoe.app/whatsapp"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Channel method to save image to gallery
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_MEDIA).setMethodCallHandler { call, result ->
            if (call.method == "saveImageToGallery") {
                val bytes = call.argument<ByteArray>("bytes")
                val fileName = call.argument<String>("fileName")

                if (bytes != null && fileName != null) {
                    val isSaved = saveImageToGallery(bytes, fileName)
                    if (isSaved) {
                        result.success(true)
                    } else {
                        result.error("SAVE_FAILED", "Failed to save image", null)
                    }
                } else {
                    result.error("INVALID_ARGUMENTS", "Bytes or fileName is null", null)
                }
            } else {
                result.notImplemented()
            }
        }


        // Channel Method to send images to WhatsApp
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_WHATSAPP).setMethodCallHandler { call, result ->
            if (call.method == "sendWhatsAppImage") {
                val phone = call.argument<String>("phone")
                val filePath = call.argument<String>("filePath")
                val message = call.argument<String>("message") ?: ""

                if (phone != null && filePath != null) {
                    sendImageToWhatsApp(phone, filePath, message)
                    result.success("Success")
                } else {
                    result.error("ERROR", "Phone, message, or file path is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun saveImageToGallery(bytes: ByteArray, fileName: String): Boolean {
        val contentValues = ContentValues().apply {
            put(MediaStore.Images.Media.DISPLAY_NAME, fileName)
            put(MediaStore.Images.Media.MIME_TYPE, "image/png")
            put(MediaStore.Images.Media.RELATIVE_PATH, "Pictures/Lakoe")
        }

        val resolver = applicationContext.contentResolver
        val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)

        uri?.let {
            resolver.openOutputStream(it).use { outputStream ->
                outputStream?.write(bytes)
            }
            return true
        }

        return false
    }

    private fun sendImageToWhatsApp(phone: String, filePath: String, message: String) {
        val file = File(filePath)
        if (!file.exists()) {
            Log.e("WhatsApp", "File not found: $filePath")
            return
        }
        
        val uri: Uri = FileProvider.getUriForFile(this, "${applicationContext.packageName}.provider", file)

        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "image/png"
            putExtra(Intent.EXTRA_STREAM, uri)
            putExtra(Intent.EXTRA_TEXT, message) 
            putExtra("jid", "$phone@s.whatsapp.net")
            setPackage("com.whatsapp")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }

        try {
            startActivity(intent)
        } catch (e: Exception) {
            Log.e("WhatsApp", "Error sending image: ${e.message}")
        }
    }
}
