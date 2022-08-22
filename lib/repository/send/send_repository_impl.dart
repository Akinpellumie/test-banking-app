
import '../../config/api_url.dart';
import '../../config/request_helper.dart';
import '../../helpers/tuple.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import 'send_repository.dart';

class SendRepositoryImpl implements SendRepository {  
  @override
  Future<Tuple> sendMoney(String acctName, String bankCode, String amount, String acctnumber, String userId) async{
    try {
      String url = ApiUrl.transferUrl +
          "an=$acctnumber&bn=$bankCode&amt=$amount&acc_name=$acctName&uid=$userId";
      var data = await RequestHelper.getApi(
        url,
      );
      int status = getHttpStatus(data!.statusCode);
      if (status == 200) {
        //var result = registerResponseFromJson(jsonDecode(data.body));
        return Tuple(response: data.body.toString(), error: null, statusCode: 200);
      } else if (status >= 400 && status <= 409) {
        //var _error = ErrorModel.fromJson(jsonDecode(data.body));
        return Tuple(response: null, error: data, statusCode: 400);
      } else {
        return Tuple(response: null, error: kErrorMessage, statusCode: 500);
      }
    } catch (e) {
      print(e);
      return Tuple(response: null, error: kExceptionMessage, statusCode: 0);
    }
  }
  
  // @override
  // Future<Tuple> getBankList() {
  //   // TODO: implement getBankList
  // }
}
