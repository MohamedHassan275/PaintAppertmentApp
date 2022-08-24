
import 'package:get/get.dart';
import 'package:pain_appertment/model/rate_client_service_model.dart';

class DetailsServiceController extends GetxController {

  bool Loading = false;

  get loading => Loading;

  setLoading(bool loading){
    loading = Loading;
    update();
  }

  List<RateClientServiceModel> rateClientServiceModel = [
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
    RateClientServiceModel('خالد حمادة','20/05/2023',2.5,'شغل طيب بما يرضي الله'),
  ];
}