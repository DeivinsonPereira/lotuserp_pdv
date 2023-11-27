const String _baseUrl = 'http://189.126.106.71/cgi-bin/lotuserp';
const int companyId = 2;

class Endpoints {
  static String Empresa() {
    return '$_baseUrl/pdvmobget01_empresa?pidEmpresa=$companyId';
  }
}
