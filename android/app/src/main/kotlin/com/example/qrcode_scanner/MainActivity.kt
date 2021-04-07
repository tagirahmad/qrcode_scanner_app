package com.example.qrcode_scanner

import android.content.ContentResolver
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import android.provider.Settings
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
//    @RequiresApi(Build.VERSION_CODES.M)
//    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
//        super.onCreate(savedInstanceState, persistentState)
////        println("CREATED onCreate")
//        Log.d("TAG", "CREATED onCreate")
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//            val intent = Intent(
//                    Settings.ACTION_MANAGE_WRITE_SETTINGS,
//                    Uri.parse("package:$packageName")
//            )
//            startActivity(intent)
//        }
//
//        val settingsCanWrite = Settings.System.canWrite(context)
//        val cResolver: ContentResolver = context.contentResolver
//        if (settingsCanWrite) {
//            Settings.System.putInt(
//                    cResolver,
//                    Settings.System.SCREEN_BRIGHTNESS_MODE,
//                    Settings.System.SCREEN_BRIGHTNESS_MODE_MANUAL
//            )
//
//            Settings.System.putInt(
//                    cResolver, Settings.System.SCREEN_BRIGHTNESS, 0
//            )
//        }
//
//    }
}
