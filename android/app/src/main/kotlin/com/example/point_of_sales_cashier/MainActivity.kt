package com.lakoe.app

import android.content.ContentValues
import android.os.Build
import android.provider.MediaStore
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.OutputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.lakoe.app/media"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
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
}
