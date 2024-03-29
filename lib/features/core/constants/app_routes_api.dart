class AppRoutesApi {
  static const String baseUrl = "http://10.0.2.2:8080/";

  //AUTH
  static const auth = "/auth";
  static const authLogin = "$auth/token";

  //USER
  static const user = "/user";
  static var userFindAll = "$user/all";
  static var userRegister = "$user/v1/register";
  static var userUpdateProfile = "$user/v1/update-profile";
  static var userActiveInative = "$user/v1/active-inative";

  //EXPENSE
  static const expense = "/expense";
  static var expenseFindAll = "$expense/all";
  static var expenseGetAllOfTypeExpense =
      "$expense/v1/find-all-of-type-expense";

  //FINANCE CONTROL
  static const financeControl = "/finance-control";
  static var financeControlFindAll = "$financeControl/all";
  static var financeControlInitialize = "$financeControl/v1/initialize";
  static var financeControlMetrics = "$financeControl/v1/metrics";

  //MONTHLY CONTRIBUTION
  static const monthlyContribution = "/monthly-contribution";
  static var monthlyContributionFindAll = "$monthlyContribution/all";

  //REMUNERATION
  static const remuneration = "/monthly-contribution";
  static var remunerationFindAll = "$remuneration/all";

  //TYPE EXPENSE
  static const typeExpense = "/type-expense";
  static var typeExpenseFindAll = "$typeExpense/all";
  static var typeExpenseRemoveExpense = "$typeExpense/v1/remove-expense";
}
