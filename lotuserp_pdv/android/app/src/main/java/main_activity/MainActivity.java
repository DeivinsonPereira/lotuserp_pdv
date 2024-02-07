package com.example.lotuserp_pdv;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
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
import android.widget.Button;

import br.com.daruma.framework.mobile.DarumaMobile;

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

    private Handler handler = new Handler(Looper.getMainLooper());

    private DarumaMobile dmf;
    private DarumaMobile dfmD2s;
    private String strXML;

    private String centro; 
    private String deslCentro; 
    private String direita; 
    private String deslDireita; 
    private String extra; 
    private String deslExtra; 
    private String negrito; 
    private String deslNegrito; 
    private String invetImp; 
    private String desligInvert;
    private String corte;
    private String desligCorte;
    
    

    private static final int STORAGE_PERMISSION_CODE = 101;

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
            @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == YOUR_REQUEST_CODE) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                copiarImagemParaArmazenamentoInterno();
            } else {
                Log.e("Permissão:", "Permissão negada");
                Toast.makeText(MainActivity.this, "Permissão de armazenado negada", Toast.LENGTH_SHORT).show();
                // A permissão foi negada. Lide com a situação.
            }
        }
    }

   
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {

    centro = "" + ((char) 0x1B) + ((char) 0x61) + ((char) 0x31);
    deslCentro  = "" + ((char) 0x1B) + ((char) 0x61) + ((char) 0x30);
    direita  = "" + ((char) 0x1B) + ((char) 0x61) + ((char) 0x32);
    deslDireita  = "" + ((char) 0x1B) + ((char) 0x61) + ((char) 0x30);
    extra  = "" + ((char) 0x1B) + ((char) 0x21) + ((char) 0x16);
    deslExtra  = "" + ((char) 0x1B) + ((char) 0x21) + ((char) 0x00);
    negrito  = "" + ((char) 0x1B) + ((char) 0x45) + ((char) 0x31);
    deslNegrito  = "" + ((char) 0x1B) + ((char) 0x45) + ((char) 0x30);

    invetImp  = ""+((char) 0x1D) + ((char) 0x42) + ((char) 0x31);
    desligInvert = ""+ ((char) 0x1D) + ((char) 0x42) + ((char) 0x30);

    corte = ""+((char) 0x1D) + ((char) 0x56) + ((char) 0x31);
    desligCorte = ""+ ((char) 0x1D) + ((char) 0x56) + ((char) 0x30);

            
        super.onCreate(savedInstanceState);
        if (checkSelfPermission(android.Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{android.Manifest.permission.READ_EXTERNAL_STORAGE}, 0);
        }
        if (checkSelfPermission(Manifest.permission.INTERNET) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.INTERNET}, 0);
        }
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[] { Manifest.permission.WRITE_EXTERNAL_STORAGE },
                    YOUR_REQUEST_CODE);
        } else {
            
             try {
            copiarImagemParaArmazenamentoInterno();

            dmf = DarumaMobile.inicializar(MainActivity.this, "@FRAMEWORK(TRATAEXCECAO=TRUE;LOGMEMORIA=25;TIMEOUTWS=10000;);@DISPOSITIVO(NAME=D2S)");
            dfmD2s = DarumaMobile.inicializar(MainActivity.this, "@FRAMEWORK(TRATAEXCECAO=TRUE;TIMEOUTWS=10000;);@BLUETOOTH(NAME=InnerPrinter;ATTEMPTS=10;TIMEOUT=10000)");

        } catch (Exception e) {
            Toast.makeText(MainActivity.this, "Não tem permissões: " + e.getMessage(), Toast.LENGTH_LONG).show();
            Log.e("Erro:", e.getMessage());
            finish();
        }

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
                                } else if(call.method.equals("imprimirNFCE")) {
                                    strXML = call.argument("xml");
                                    String tamanhoImpressora = call.argument("tamanhoImpressora");
                                    imprimirNFCE(strXML, tamanhoImpressora);
                                    result.success(null);
                                } else if (call.method.equals("imprimirTeste")){
                                    String texto = call.argument("texto");
                                    imprimirTeste(texto);
                                    result.success(null);
                                }else if (call.method.equals("imprimirOpenRegister")){
                                    String texto1 = call.argument("texto1");
                                    String texto2 = call.argument("texto2");
                                    String texto3 = call.argument("texto3");
                                    String texto4 = call.argument("texto4");
                                    String texto5 = call.argument("texto5");
                                    String texto6 = call.argument("texto6");
                                    String texto7 = call.argument("texto7");
                                    String texto8 = call.argument("texto8");
                                    String texto9 = call.argument("texto9");
                                    imprimirOpenRegister(texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8, texto9);
                                    result.success(null);
                                }    
                                else if (call.method.equals("imprimirMovimentRegister")){
                                    String texto1 = call.argument("texto1");
                                    String texto2 = call.argument("texto2");
                                    String texto3 = call.argument("texto3");
                                    String texto4 = call.argument("texto4");
                                    String texto5 = call.argument("texto5");
                                    String texto6 = call.argument("texto6");
                                    String texto7 = call.argument("texto7");
                                    String texto8 = call.argument("texto8");
                                    String texto9 = call.argument("texto9");
                                    imprimirMovimentRegister(texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8, texto9);
                                    result.success(null);
                                }   
                                else if (call.method.equals("imprimirCloseRegister")){
                                    String texto1 = call.argument("texto1");
                                    String texto2 = call.argument("texto2");
                                    String texto3 = call.argument("texto3");
                                    String texto4 = call.argument("texto4");
                                    String texto5 = call.argument("texto5");
                                    String texto6 = call.argument("texto6");
                                    String texto7 = call.argument("texto7");
                                    String texto8 = call.argument("texto8");
                                    String texto9 = call.argument("texto9");
                                    String texto10 = call.argument("texto10");
                                    String texto11 = call.argument("texto11");
                                    List<String> texto12 = call.argument("texto12");
                                    List<String> texto13 = call.argument("texto13");
                                    String texto14 = call.argument("texto14");
                                    String texto15 = call.argument("texto15");
                                    String texto16 = call.argument("texto16");
                                    String texto17 = call.argument("texto17");
                                    String texto18 = call.argument("texto18");
                                    imprimirCloseRegister(texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8, texto9, texto10, texto11, texto12, texto13, texto14, texto15, texto16, texto17, texto18);
                                    result.success(null);
                                }   
                            } catch (Exception e) {
                                Log.e("MethodChannel", "Erro no método: " + call.method, e);
                                result.error("ERROR", "Erro no método: " + call.method, e.getMessage());
                            }
                        });
    }

    private void imprimirTeste(String texto) {
        try{
            dfmD2s.enviarComando(texto);
        } catch (Exception e) {
            Toast.makeText(MainActivity.this, "Erro na impressão: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }
    
    private void imprimirOpenRegister(String texto1, String texto2, String texto3, String texto4, String texto5, String texto6, String texto7, String texto8, String texto9) {
        try{
            String texto = centro + negrito + extra + texto1 + deslNegrito + deslExtra; 
            texto += texto2;
            texto += negrito + extra + texto3 + deslNegrito + deslExtra;
            texto += texto4 + deslCentro;
            texto += negrito + texto5 + deslNegrito;
            texto += deslCentro + texto6;
            texto += negrito + texto7 + deslNegrito;
            texto += texto8;
            texto += negrito + texto9 + deslNegrito;            
            dfmD2s.enviarComando(texto);
            
        } catch (Exception e) {
            Log.e("MethodChannel", "Erro na impressão: " + e.getMessage(), e);
        }
    }

    private void imprimirMovimentRegister(String texto1, String texto2, String texto3, String texto4, String texto5, String texto6, String texto7, String texto8, String texto9) {
        try{
            String texto = centro + negrito + extra + texto1 + deslNegrito + deslExtra; 
            texto += texto2;
            texto += negrito + extra + texto3 + deslNegrito + deslExtra;
            texto += texto4 + deslCentro;
            texto += negrito + texto5 + deslNegrito;
            texto += deslCentro + texto6;
            texto += negrito + texto7 + deslNegrito;
            texto += texto8;
            texto += negrito + texto9 + deslNegrito;            
            dfmD2s.enviarComando(texto);
        } catch (Exception e) {
            Log.e("MethodChannel", "Erro na impressão: " + e.getMessage(), e);
        }
    }

    private void imprimirCloseRegister(String texto1, String texto2, String texto3, String texto4, String texto5, String texto6, String texto7, String texto8, String texto9, String texto10, String texto11, List<String> texto12, List<String> texto13, String texto14, String texto15, String texto16, String texto17, String texto18) {
        try{
            String texto = centro + negrito + extra + texto1 + deslNegrito + deslExtra; 
            texto += texto2;
            texto += negrito + extra + texto3 + deslNegrito + deslExtra;
            texto += texto4;
            texto += deslCentro + negrito + texto5 + deslNegrito;
            texto += negrito + texto6 + deslNegrito;
            texto += texto7;
            texto += texto8;
            texto += negrito + texto9 + deslNegrito;
            texto += negrito + texto10 ;
            texto += texto11 + deslNegrito;
            //
            for(int i = 0; i < texto12.size(); i++){
                texto += texto12.get(i);
                texto += direita + texto13.get(i) + deslDireita;
            }
            //
            texto += negrito + texto14 + deslNegrito;
            texto += texto15;
            texto += direita + texto16 + deslDireita;
            texto += negrito + texto17 + deslNegrito;
            texto += texto18;
            texto += corte + desligCorte;


            dfmD2s.enviarComando(texto);
        } catch (Exception e) {
            Log.e("MethodChannel", "Erro na impressão: " + e.getMessage(), e);
        }
    }

    private void imprimirNFCE(String xml, String tamanhoImpressora ){
        try {
            dmf.RegAlterarValor_NFCe("CONFIGURACAO\\Impressora", tamanhoImpressora); // Exemplo: "Q4" ou "Q8"
            dmf.RegAlterarValor_NFCe("CONFIGURACAO\\ImpressaoCompleta", "1");// impressão completa 0-resumida(sem itens) |1- tudo.
            dmf.iCFImprimir_NFCe(xml, xml, "", 34, 1);
        } catch (Exception e) {
            Toast.makeText(MainActivity.this, "Erro na impressão: " + e.getMessage(), Toast.LENGTH_SHORT).show();
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
