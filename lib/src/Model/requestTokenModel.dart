class RequestTokenModel {
  final String type;
  final String username;
  final String application_name;
  final String client_id;
  final String token_type;
  final String access_token;
  final int expires_in;
  final String state;
  final String scope;

  RequestTokenModel({
    this.type,
    this.username,
    this.application_name,
    this.client_id,
    this.token_type,
    this.access_token,
    this.expires_in,
    this.state,
    this.scope,
  });

  RequestTokenModel.fromJson(Map<String, dynamic> parsedJson)
      : type = parsedJson['type'],
        username = parsedJson['username'],
        application_name = parsedJson['application_name'],
        client_id = parsedJson['client_id'],
        token_type = parsedJson['token_type'],
        access_token = parsedJson['access_token'],
        expires_in = parsedJson['expires_in'],
        state = parsedJson['state'],
        scope = parsedJson['scope'];
}
