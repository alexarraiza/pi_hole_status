class PiHoleStatus {
  int domainsBeingBlocked;
  int dnsQueriesToday;
  int adsBlockedToday;
  double adsPercentageToday;
  int uniqueDomains;
  int queriesForwarded;
  int queriesCached;
  int clientsEverSeen;
  int uniqueClients;
  int dnsQueriesAllTypes;
  int replyNODATA;
  int replyNXDOMAIN;
  int replyCNAME;
  int replyIP;
  int privacyLevel;
  String status;
  GravityLastUpdated gravityLastUpdated;

  PiHoleStatus(
      {this.domainsBeingBlocked,
      this.dnsQueriesToday,
      this.adsBlockedToday,
      this.adsPercentageToday,
      this.uniqueDomains,
      this.queriesForwarded,
      this.queriesCached,
      this.clientsEverSeen,
      this.uniqueClients,
      this.dnsQueriesAllTypes,
      this.replyNODATA,
      this.replyNXDOMAIN,
      this.replyCNAME,
      this.replyIP,
      this.privacyLevel,
      this.status,
      this.gravityLastUpdated});

  PiHoleStatus.fromJson(Map<String, dynamic> json) {
    domainsBeingBlocked = json['domains_being_blocked'] as int;
    dnsQueriesToday = json['dns_queries_today'] as int;
    adsBlockedToday = json['ads_blocked_today'] as int;
    adsPercentageToday = json['ads_percentage_today'] as double;
    uniqueDomains = json['unique_domains'] as int;
    queriesForwarded = json['queries_forwarded'] as int;
    queriesCached = json['queries_cached'] as int;
    clientsEverSeen = json['clients_ever_seen'] as int;
    uniqueClients = json['unique_clients'] as int;
    dnsQueriesAllTypes = json['dns_queries_all_types'] as int;
    replyNODATA = json['reply_NODATA'] as int;
    replyNXDOMAIN = json['reply_NXDOMAIN'] as int;
    replyCNAME = json['reply_CNAME'] as int;
    replyIP = json['reply_IP'] as int;
    privacyLevel = json['privacy_level'] as int;
    status = json['status'] as String;
    gravityLastUpdated = json['gravity_last_updated'] != null
        ? new GravityLastUpdated.fromJson(Map.from(json['gravity_last_updated'] as Map))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domains_being_blocked'] = this.domainsBeingBlocked;
    data['dns_queries_today'] = this.dnsQueriesToday;
    data['ads_blocked_today'] = this.adsBlockedToday;
    data['ads_percentage_today'] = this.adsPercentageToday;
    data['unique_domains'] = this.uniqueDomains;
    data['queries_forwarded'] = this.queriesForwarded;
    data['queries_cached'] = this.queriesCached;
    data['clients_ever_seen'] = this.clientsEverSeen;
    data['unique_clients'] = this.uniqueClients;
    data['dns_queries_all_types'] = this.dnsQueriesAllTypes;
    data['reply_NODATA'] = this.replyNODATA;
    data['reply_NXDOMAIN'] = this.replyNXDOMAIN;
    data['reply_CNAME'] = this.replyCNAME;
    data['reply_IP'] = this.replyIP;
    data['privacy_level'] = this.privacyLevel;
    data['status'] = this.status;
    if (this.gravityLastUpdated != null) {
      data['gravity_last_updated'] = this.gravityLastUpdated.toJson();
    }
    return data;
  }
}

class GravityLastUpdated {
  bool fileExists;
  int absolute;
  Relative relative;

  GravityLastUpdated({this.fileExists, this.absolute, this.relative});

  GravityLastUpdated.fromJson(Map<String, dynamic> json) {
    fileExists = json['file_exists'] as bool;
    absolute = json['absolute'] as int;
    relative = json['relative'] != null ? new Relative.fromJson(Map.from(json['relative'] as Map)) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_exists'] = this.fileExists;
    data['absolute'] = this.absolute;
    if (this.relative != null) {
      data['relative'] = this.relative.toJson();
    }
    return data;
  }
}

class Relative {
  int days;
  int hours;
  int minutes;

  Relative({this.days, this.hours, this.minutes});

  Relative.fromJson(Map<String, dynamic> json) {
    days = json['days'] as int;
    hours = json['hours'] as int;
    minutes = json['minutes'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    return data;
  }

  @override
  String toString() {
    return '${days}d ${hours}h ${minutes}m';
  }
}
