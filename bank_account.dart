// Abstract class defining the general structure of a bank account
abstract class BankAccount {
  // Owner of the account and the current balance
  String owner;
  double balance;

  // Constructor to initialize the account owner and balance
  BankAccount(this.owner, this.balance);

  // Abstract method to define the type of account (must be implemented by subclasses)
  void accountType();

  // Abstract method to apply fees (must be implemented by subclasses)
  void applyFees();

  // Concrete method to check the current balance (inherited by all subclasses)
  void checkBalance() {
    print("Owner: $owner, Balance: R$balance");
  }
}

// Subclass: SavingsAccount
class SavingsAccount extends BankAccount {
  // Interest rate specific to savings accounts
  double interestRate;

  // Constructor to initialize savings account with owner, balance, and interest rate
  SavingsAccount(String owner, double balance, this.interestRate)
      : super(owner, balance);

  // Implementing abstract method: defining account type
  @override
  void accountType() {
    print("Savings Account with interest rate: $interestRate%");
  }

  // Implementing abstract method: applying fees specific to a savings account
  @override
  void applyFees() {
    print("No monthly fees for savings account.");
  }

  // Method to apply interest based on the balance
  void applyInterest() {
    double interest = balance * interestRate / 100;
    balance += interest;
    print('Interest of R$interest applied. New balance: R$balance');
  }
}

// Subclass: CheckingAccount
class CheckingAccount extends BankAccount {
  // Transaction fee specific to checking accounts
  double transactionFee;

  // Constructor to initialize checking account with owner, balance, and transaction fee
  CheckingAccount(String owner, double balance, this.transactionFee)
      : super(owner, balance);

  // Implementing abstract method: defining account type
  @override
  void accountType() {
    print("Checking Account with transaction fee: R${transactionFee}");
  }

  // Implementing abstract method: applying transaction fees
  @override
  void applyFees() {
    balance -= transactionFee;
    print("Transaction fee of R${transactionFee} applied. New balance: R$balance");
  }
}

// Main function to demonstrate abstraction and polymorphism
void main() {
  // Create a SavingsAccount and a CheckingAccount
  BankAccount savings = SavingsAccount('Senyamo', 5000, 5.0);
  BankAccount checking = CheckingAccount('Molefe', 3000, 50.0); // Transaction fee in Rands

  // Demonstrate polymorphism: calling the overridden methods
  savings.accountType(); 
  checking.accountType(); 

  // Apply fees to both accounts
  savings.applyFees(); 
  checking.applyFees();

  // Check balance for both accounts
  savings.checkBalance(); 
  checking.checkBalance(); 

  // Apply interest to the savings account
  (savings as SavingsAccount).applyInterest();
}
