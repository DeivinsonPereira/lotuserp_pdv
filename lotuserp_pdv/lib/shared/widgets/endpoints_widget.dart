const String _baseUrl = 'http://189.126.106.71/cgi-bin/lotuserp';
const int companyId = 2;

class Endpoints {
  static String empresa() {
    return '$_baseUrl/pdvmobget01_empresa?pidEmpresa=$companyId';
  }
  static String produto() {
    return '$_baseUrl/pdvmobget05_produtos?pidEmpresa=$companyId';
  }
  static String grupo() {
    return '$_baseUrl/pdvmobget03_produtos_grupos?pidEmpresa=$companyId';
  }
  static String usuario() {
    return '$_baseUrl/pdvmobget02_usuarios?pidEmpresa=$companyId';
  }

}
