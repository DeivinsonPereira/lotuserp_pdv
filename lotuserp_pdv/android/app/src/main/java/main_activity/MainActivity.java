package com.example.lotuserp_pdv;

import android.content.Intent;
import org.json.JSONObject;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.lotuserp_pdv/tef";
    private static final int TEF_REQUEST_CODE = 1234;
    private Result pendingResult;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
       new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("startTEF")) {
                        // Armazenar o resultado para uso posterior
                        pendingResult = result;

                        String funcao = call.argument("funcao");
                        String valor = call.argument("valor");
                        String parcelas = call.argument("parcelas"); // Pode ser null para débito
                        String financiamento = call.argument("financiamento"); // Pode ser null para débito

                        Intent intent = new Intent("com.elgin.e1.digitalhub.TEF");
                        intent.putExtra("funcao", funcao);
                        intent.putExtra("valor", valor);
                        if(parcelas != null) intent.putExtra("parcelas", parcelas);
                        if(financiamento != null) intent.putExtra("financiamento", financiamento);

                        startActivityForResult(intent, TEF_REQUEST_CODE);
                    }
                }
            );
    }

     @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == TEF_REQUEST_CODE) {
            if (resultCode == RESULT_OK && data != null) {
                try {
                    JSONObject response = new JSONObject();

                    response.put("COD_AUTORIZACAO" , data.getStringExtra("COD_AUTORIZACAO"));
                    response.put("VIA_ESTABELECIMENTO" , data.getStringExtra("VIA_ESTABELECIMENTO"));
                    response.put("COMP_DADOS_CONF" , data.getStringExtra("COMP_DADOS_CONF"));
                    response.put("BANDEIRA" , data.getStringExtra("BANDEIRA"));
                    response.put("NUM_PARC" , data.getStringExtra("NUM_PARC"));
                    response.put("RELATORIO_TRANS" , data.getStringExtra("RELATORIO_TRANS"));
                    response.put("REDE_AUT" , data.getStringExtra("REDE_AUT"));
                    response.put("NSU_SITEF" , data.getStringExtra("NSU_SITEF"));
                    response.put("VIA_CLIENTE" , data.getStringExtra("VIA_CLIENTE"));
                    response.put("TIPO_PARC" , data.getStringExtra("TIPO_PARC"));
                    response.put("CODRESP" , data.getStringExtra("CODRESP"));
                    response.put("NSU_HOST" , data.getStringExtra("NSU_HOST"));

                    if (pendingResult != null) {
                        pendingResult.success(response.toString());
                    }
                } catch (Exception e) {
                    if (pendingResult != null) {
                        pendingResult.error("TEF_ERROR", "Erro ao processar resposta do TEF", null);
                    }
                }
            } else {
                if (pendingResult != null) {
                    pendingResult.error("TEF_ERROR", "Erro na transação TEF", null);
                }
            }
            // Reset pendingResult para evitar referências antigas
            pendingResult = null;
        }
    }
    }

