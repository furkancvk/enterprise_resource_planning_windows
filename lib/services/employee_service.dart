import '../services/base_service.dart';
import '../models/employee.dart';

class EmployeeService {

  static Future<Map<String, dynamic>> addEmployee(Employee employee) async {
    var body = await BaseService.postRequest(
        path: '/api/v1/employees/addEmployee',
        data: employee
    );
    return body;
  }

  static Future<Map<String, dynamic>> getAllEmployee() async {
    var body = await BaseService.getRequest('/api/v1/employees/getAllEmployee');
    return body;
  }

}
