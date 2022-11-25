class CategoryListModel {
  Categories? categories;
  int? status;

  CategoryListModel({this.categories, this.status});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Categories {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Categories(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Categories.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? categoryName;
  String? categoryColor;
  int? accountId;
  int? priority;
  String? createdAt;
  String? updatedAt;
  int? completedTasksCount;
  List<CompletedTasks>? completedTasks;

  Data(
      {this.id,
        this.categoryName,
        this.categoryColor,
        this.accountId,
        this.priority,
        this.createdAt,
        this.updatedAt,
        this.completedTasksCount,
        this.completedTasks});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryColor = json['category_color'];
    accountId = json['account_id'];
    priority = json['priority'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completedTasksCount = json['completed_tasks_count'];
    if (json['completed_tasks'] != null) {
      completedTasks = <CompletedTasks>[];
      json['completed_tasks'].forEach((v) {
        completedTasks!.add(new CompletedTasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_color'] = this.categoryColor;
    data['account_id'] = this.accountId;
    data['priority'] = this.priority;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['completed_tasks_count'] = this.completedTasksCount;
    if (this.completedTasks != null) {
      data['completed_tasks'] =
          this.completedTasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompletedTasks {
  int? id;
  String? taskTitle;
  String? taskDesc;
  int? taskCategoryId;
  int? taskCategoryIdTwo;
  int? taskAddedBy;
  int? taskResponsible;
  String? taskStartDate;
  String? taskDueDate;
  int? taskStatus;
  int? taskPriority;
  Null? underCategorie;
  int? accountId;
  String? createdAt;
  String? updatedAt;
  AddedBy? addedBy;
  List<Team>? team;
  Category? category;
  Category? secondCategory;

  CompletedTasks(
      {this.id,
        this.taskTitle,
        this.taskDesc,
        this.taskCategoryId,
        this.taskCategoryIdTwo,
        this.taskAddedBy,
        this.taskResponsible,
        this.taskStartDate,
        this.taskDueDate,
        this.taskStatus,
        this.taskPriority,
        this.underCategorie,
        this.accountId,
        this.createdAt,
        this.updatedAt,
        this.addedBy,
        this.team,
        this.category,
        this.secondCategory});

  CompletedTasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskTitle = json['task_title'];
    taskDesc = json['task_desc'];
    taskCategoryId = json['task_category_id'];
    taskCategoryIdTwo = json['task_category_id_two'];
    taskAddedBy = json['task_added_by'];
    taskResponsible = json['task_responsible'];
    taskStartDate = json['task_start_date'];
    taskDueDate = json['task_due_date'];
    taskStatus = json['task_status'];
    taskPriority = json['task_priority'];
    underCategorie = json['under_categorie'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedBy = json['added_by'] != null
        ? new AddedBy.fromJson(json['added_by'])
        : null;
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    secondCategory = json['second_category'] != null
        ? new Category.fromJson(json['second_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_title'] = this.taskTitle;
    data['task_desc'] = this.taskDesc;
    data['task_category_id'] = this.taskCategoryId;
    data['task_category_id_two'] = this.taskCategoryIdTwo;
    data['task_added_by'] = this.taskAddedBy;
    data['task_responsible'] = this.taskResponsible;
    data['task_start_date'] = this.taskStartDate;
    data['task_due_date'] = this.taskDueDate;
    data['task_status'] = this.taskStatus;
    data['task_priority'] = this.taskPriority;
    data['under_categorie'] = this.underCategorie;
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.addedBy != null) {
      data['added_by'] = this.addedBy!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.secondCategory != null) {
      data['second_category'] = this.secondCategory!.toJson();
    }
    return data;
  }
}

class AddedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  Null? emailVerifiedAt;
  String? image;
  int? role;
  int? userPiriority;
  int? loginStatus;
  String? loginAt;
  int? accountId;
  Null? packageId;
  int? deleted;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  AddedBy(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.emailVerifiedAt,
        this.image,
        this.role,
        this.userPiriority,
        this.loginStatus,
        this.loginAt,
        this.accountId,
        this.packageId,
        this.deleted,
        this.fcmToken,
        this.createdAt,
        this.updatedAt});

  AddedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    role = json['role'];
    userPiriority = json['user_piriority'];
    loginStatus = json['login_status'];
    loginAt = json['login_at'];
    accountId = json['account_id'];
    packageId = json['package_id'];
    deleted = json['deleted'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image'] = this.image;
    data['role'] = this.role;
    data['user_piriority'] = this.userPiriority;
    data['login_status'] = this.loginStatus;
    data['login_at'] = this.loginAt;
    data['account_id'] = this.accountId;
    data['package_id'] = this.packageId;
    data['deleted'] = this.deleted;
    data['fcm_token'] = this.fcmToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Team {
  int? id;
  int? taskId;
  int? userId;
  int? accountId;
  String? createdAt;
  String? updatedAt;
  AddedBy? user;

  Team(
      {this.id,
        this.taskId,
        this.userId,
        this.accountId,
        this.createdAt,
        this.updatedAt,
        this.user});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    userId = json['user_id'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new AddedBy.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_id'] = this.taskId;
    data['user_id'] = this.userId;
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? categoryColor;
  int? accountId;
  int? priority;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.categoryName,
        this.categoryColor,
        this.accountId,
        this.priority,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryColor = json['category_color'];
    accountId = json['account_id'];
    priority = json['priority'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_color'] = this.categoryColor;
    data['account_id'] = this.accountId;
    data['priority'] = this.priority;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
