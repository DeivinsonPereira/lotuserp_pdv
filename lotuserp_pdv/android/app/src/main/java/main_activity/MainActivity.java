package com.example.lotuserp_pdv;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.util.HashMap;
import java.util.Map;
import android.app.PendingIntent;
import android.content.Intent;

import android.Manifest;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.os.Environment;
import androidx.annotation.Nullable;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;
import java.util.Locale;
import android.util.Log;
import android.content.Intent;
import org.json.JSONObject;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;

import com.felhr.usbserial.UsbSerialDevice;
import com.felhr.usbserial.UsbSerialInterface;
import android.hardware.usb.UsbManager;
import android.hardware.usb.UsbDevice;

import android.hardware.usb.UsbDeviceConnection;

import android.os.Handler;
import android.os.Looper;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.lotuserp_pdv/tef";
    private static final int TEF_REQUEST_CODE = 2;
    private static final int REQUEST_CODE_CUSTOMIZACAO = 1;
    private Result pendingResult;
    private static final String PATH = "com.elgin.e1.digitalhub.TEF";
    private String caminhoImagemLogotipo;
    private static final int REQUEST_CODE_STORAGE_PERMISSION = 1;
    private static final int YOUR_REQUEST_CODE = 1;
    File downloadsPath = new File(Environment.getExternalStorageDirectory(), "Download");
    private File storagePath;
    private UsbManager usbManager;
    private UsbSerialDevice serialPort;
    private UsbDevice usbDevice;
    private static final String ACTION_USB_PERMISSION = "com.example.lotuserp_pdv.USB_PERMISSION";
    private static final int VENDOR_ID_BALANCA = 0x1A86;

    private Handler handler = new Handler(Looper.getMainLooper());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[] { Manifest.permission.WRITE_EXTERNAL_STORAGE },
                    YOUR_REQUEST_CODE);
        } else {
            copiarImagemParaArmazenamentoInterno();

        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            try {
                                if (call.method.equals("startTEF")) {
                                    pendingResult = result;

                                    String funcao = call.argument("funcao");
                                    String valor = call.argument("valor");
                                    String parcelas = call.argument("parcelas");
                                    String financiamento = call.argument("financiamento");

                                    Log.d("TEF", "Iniciando TEF com função: " + funcao + ", valor: " + valor);

                                    Intent intent = new Intent(PATH);
                                    intent.putExtra("funcao", funcao);
                                    intent.putExtra("valor", valor);
                                    if (parcelas != null)
                                        intent.putExtra("parcelas", parcelas);
                                    if (financiamento != null)
                                        intent.putExtra("financiamento", financiamento);

                                    Log.d("TEF", "Iniciando atividade TEF com requestCode: " + TEF_REQUEST_CODE);
                                    startActivityForResult(intent, TEF_REQUEST_CODE);
                                } else if (call.method.equals("customizarTEF")) {
                                    copiarImagemParaArmazenamentoInterno();
                                    customizarAplicacao();
                                    result.success(null);
                                }
                            } catch (Exception e) {
                                Log.e("MethodChannel", "Erro no método: " + call.method, e);
                                result.error("ERROR", "Erro no método: " + call.method, e.getMessage());
                            }
                        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
            @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == YOUR_REQUEST_CODE) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                copiarImagemParaArmazenamentoInterno();
            } else {
                Log.e("Permissão:", "Permissão negada");
                // A permissão foi negada. Lide com a situação.
            }
        }
    }

    private void copiarImagemParaArmazenamentoInterno() {
        File storagePath;

        // Verifique se a pasta Pictures existe
        File picturesPath = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        if (picturesPath.exists()) {
            storagePath = picturesPath;
        } else {
            // Se Pictures não existir, use DCIM
            File dcimPath = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
            if (dcimPath.exists()) {
                storagePath = dcimPath;
            } else {
                // Se nenhum dos dois existir, crie a pasta Pictures
                storagePath = picturesPath;
                storagePath.mkdirs();
            }
        }

        File newFile = new File(storagePath, "logo.png");
        Log.d("TEF", "Caminho do logotipo: " + newFile.getAbsolutePath());

        if (!newFile.exists()) {
            try {
                InputStream is = getAssets().open("Logo Nova Branco.png");
                OutputStream os = new FileOutputStream(newFile);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                is.close();
                os.flush();
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void customizarAplicacao() {
        File imagePath = new File(storagePath, "logo.png");
        Intent intent = new Intent("com.elgin.e1.digitalhub.CUSTOM");
        intent.putExtra("grupo", "application");
        intent.putExtra("logotipo", imagePath);
        intent.putExtra("background", "#2B305B");
        startActivityForResult(intent, REQUEST_CODE_CUSTOMIZACAO);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        Log.d("TEF", "onActivityResult com requestCode: " + requestCode + ", resultCode: " + resultCode);

        if (requestCode == TEF_REQUEST_CODE) {
            if (resultCode == RESULT_OK && data != null) {
                try {
                    JSONObject response = new JSONObject();

                    response.put("COD_AUTORIZACAO", data.getStringExtra("COD_AUTORIZACAO"));
                    response.put("VIA_ESTABELECIMENTO", data.getStringExtra("VIA_ESTABELECIMENTO"));
                    response.put("COMP_DADOS_CONF", data.getStringExtra("COMP_DADOS_CONF"));
                    response.put("BANDEIRA", data.getStringExtra("BANDEIRA"));
                    response.put("NUM_PARC", data.getStringExtra("NUM_PARC"));
                    response.put("RELATORIO_TRANS", data.getStringExtra("RELATORIO_TRANS"));
                    response.put("REDE_AUT", data.getStringExtra("REDE_AUT"));
                    response.put("NSU_SITEF", data.getStringExtra("NSU_SITEF"));
                    response.put("VIA_CLIENTE", data.getStringExtra("VIA_CLIENTE"));
                    response.put("TIPO_PARC", data.getStringExtra("TIPO_PARC"));
                    response.put("CODRESP", data.getStringExtra("CODRESP"));
                    response.put("NSU_HOST", data.getStringExtra("NSU_HOST"));

                    if (pendingResult != null) {
                        Log.d("TEF", "Enviando sucesso do TEF: " + response.toString());
                        pendingResult.success(response.toString());
                    }
                } catch (Exception e) {
                    Log.e("TEF", "Erro ao processar resposta do TEF", e);
                    if (pendingResult != null) {
                        pendingResult.error("TEF_ERROR", "Erro ao processar resposta do TEF", null);
                    }
                }
            } else {
                Log.e("TEF", "Erro na transação TEF");
                if (pendingResult != null) {
                    pendingResult.error("TEF_ERROR", "Erro na transação TEF", null);
                }
            }
            pendingResult = null;
        } else if (requestCode == REQUEST_CODE_CUSTOMIZACAO) {
            if (resultCode == RESULT_OK && data != null) {
                try {
                    String retorno = data.getStringExtra("retorno");
                } catch (Exception e) {
                    Log.e("Customizacao", "Erro ao processar o resultado", e);
                }
            } else {
                Log.e("Customizacao", "Resultado da customização não foi OK ou data é null");
            }
        }
    }
}
