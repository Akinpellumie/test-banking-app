const String tableDelegates = 'delegates';

class DelegateFields {
  static final List<String> values = [
    /// Add all fields
    id, delegateOwner, fullname, username, email, phoneNumber, acctname,
    acctnumber, bankname, maxAmount, password, createdAt
  ];

  static const String id = '_id';
  static const String delegateOwner = 'delegateOwner';
  static const String fullname = 'fullname';
  static const String username = 'username';
  static const String email = 'email';
  static const String phoneNumber = 'phoneNumber';
  static const String acctname = 'acctname';
  static const String acctnumber = 'acctnumber';
  static const String bankname = 'bankname';
  static const String maxAmount = 'maxAmount';
  static const String password = 'password';
  static const String createdAt = 'createdAt';
}
