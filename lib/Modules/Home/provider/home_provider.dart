import '../../../Services/Network/api.dart';
import '../../../Services/Network/api_endpoints.dart';
import '../model/profile_model.dart';

class HomeProvider {
  final ApiProvider _provider = ApiProvider();
  late List<ProfileModel> profileDetails;

  Future<List<ProfileModel>> fetchProfileData() async {
    final response = await _provider.get(ApiEndpoints.GET_PROFILE_DETAILS);
    profileDetails = profileModelFromJson(response);
    return profileDetails;
  }
}
