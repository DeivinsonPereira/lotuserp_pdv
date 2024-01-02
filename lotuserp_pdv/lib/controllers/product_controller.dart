import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotuserp_pdv/shared/isar_service.dart';

class ProdutoController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController itensPerPageController = TextEditingController();
  IsarService service = IsarService();

  RxString valorVendaFormatted = '0,00'.obs;
  RxString saldoProdutoFormatted = '0.000'.obs;

  //variavel que define quantos itens a paginação irá mostrar
  RxInt itensPerPage = 10.obs;

  //variavel que mostra o total de páginas
  RxInt totalPages = 0.obs;

  //variavel que mostra o numero do item na páginação atual
  RxInt numPage = 0.obs;

  //variavel para definir a opção selecionada no dropdown de ProdutosPage
  RxString textOption = 'DESCRIÇÃO'.obs;

  //variavel para guardar o texto digitado no campo de pesquisa
  RxString search = ''.obs;

  //variavel para verificar se o botão de pesquisa foi executado ou não.
  RxBool searchExecuted = false.obs;

  //objeto vindo do banco de dados local (snapshot)
  var product = [].obs;

  void updateProductVariable(String value) async {
    if (value != '') {
      product.value = await service.searchProdutoByDescPaged(value);
    } else {
      for (var i = 0; i < 5; i++) {
        product.value = [];
      }
    }
  }

  //atualizar variavel SaldoProdutoFormatted que deve ser em valor int nesse formato 000.000.000
  void updateSaldoProdutoFormatted(double value) {
    String valueFormatted = value.toString();

    if (value == 0) {
      valueFormatted = '0';
      saldoProdutoFormatted.value = valueFormatted;
    } else {
      if (valueFormatted == '1.0') {
        valueFormatted = '1';
      } else if (value < 0) {
        const negativeSign = '-';
        valueFormatted = valueFormatted.replaceAll('-', '');
        final parts = valueFormatted.split('.');
        final integralPart = parts[0];
        final decimalPart = parts.length > 1 ? parts[1] : '';
        final integralPartWithDots = _addDotsToIntegralPart(integralPart);
        valueFormatted =
            '$negativeSign$integralPartWithDots${_formatDecimalPart(decimalPart)}';
      } else if (value < 1000) {
        final parts = valueFormatted.split('.');
        final integralPart = parts[0];
        final decimalPart = parts.length > 1 ? parts[1] : '';
        valueFormatted = '$integralPart${_formatDecimalPart(decimalPart)}';
      } else {
        final parts = valueFormatted.split('.');
        final integralPart = parts[0];
        final decimalPart = parts.length > 1 ? parts[1] : '';
        final integralPartWithDots = _addDotsToIntegralPart(integralPart);
        valueFormatted =
            '$integralPartWithDots${_formatDecimalPart(decimalPart)}';
      }

      saldoProdutoFormatted.value = valueFormatted;
    }
  }

  String _addDotsToIntegralPart(String integralPart) {
    final reversedIntegralPart = integralPart.split('').reversed.join();
    final integralPartWithDots = reversedIntegralPart.replaceAllMapped(
      RegExp(r'(\d{3})(?=\d)'),
      (Match match) => '${match[0]}.',
    );
    return integralPartWithDots.split('').reversed.join();
  }

  String _formatDecimalPart(String decimalPart) {
    if (decimalPart.isEmpty || decimalPart == '0') {
      return '';
    }
    return '.${decimalPart.replaceAll(',', '.')}';
  }

  //atualizar variavel ValorVendaFormatted
  void updateValorVendaFormatted(double value) {
    String valueFormatted = value.toStringAsFixed(2);
    valueFormatted = valueFormatted.replaceAll('.', ',');

    if (value == 0) {
      valueFormatted = '0,00';
      valorVendaFormatted.value = valueFormatted;
    }

    if (value > 0) {
      valueFormatted = NumberFormat('#,###.00', 'pt_BR').format(value);
      valorVendaFormatted.value = valueFormatted;
    }
  }

  //atualiza a variavel product com o valor do snapshot
  void updateProduct(List value) {
    product.value = value;
  }

  //atualiza a variavel numPage para mais
  void changeNumPagePlus() {
    if (numPage.value < totalPages.value - 1) {
      //verificar se é a ultima página ou não ####################################
      numPage.value++;
    }
  }

  //atualiza a variavel numPage para menos
  void changeNumPageMinus() {
    if (numPage.value > 0) {
      numPage.value--;
    }
  }

  //atualiza a variavel pageSize escolhido pelo usuário ou padrão
  void changePageSize() {
    itensPerPage.value = int.parse(itensPerPageController.text);
  }

  //atualiza a variavel totalPages de acordo com a quantidade de itens por página e o total de itens
  void changeTotalPages(int value) {
    totalPages.value = (value / itensPerPage.value).ceil();
  }

  //substituir valor na variavel search
  void setSearch() {
    searchController.text.runtimeType == int
        ? search.value = searchController.text.toString()
        : search.value = searchController.text;
  }

  //Muda o texto da variavel textOption
  void changeTextOption(String value) {
    textOption.value = value;
  }
}
