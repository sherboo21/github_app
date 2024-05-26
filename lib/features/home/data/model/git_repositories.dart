

class GitRepositoriesData {
  final int? id;
  final String? name;
  final Owner? owner;

  GitRepositoriesData({
    this.id,
    this.name,
    this.owner,
  });

  factory GitRepositoriesData.fromJson(Map<String, dynamic> json) {
    return GitRepositoriesData(
      id: json['id'],
      name: json['name'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
    );
  }
}

class Owner {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatar;
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatar
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatar: json['avatar_url'],
    );
  }
}
