class Account:
    def __init__(self, account_number, account_holder):
        self.account_number = account_number
        self.account_balance = 0.0
        self.account_holder = account_holder

    def deposit(self, amount):
        if amount > 0:
            self.account_balance += amount
            print(f"Amount {amount} has been deposited. New balance is {self.account_balance}")
        else:
            print("Deposit amount must be greater than 0.")

    def withdraw(self, amount):
        if amount > 0 and self.account_balance >= amount:
            self.account_balance -= amount
            print(f"Amount {amount} has been withdrawn. New balance is {self.account_balance}")
        else:
            print("Withdrawal amount must be greater than 0 and less than or equal to account balance.")

    def check_balance(self):
        return self.account_balance


# Create an instance of the Account class
my_account = Account("123456789", "John Doe")

# Deposit and withdraw money from the account
my_account.deposit(1000)
my_account.withdraw(500)

# Check the account balance
print(f"Account balance is {my_account.check_balance()}")

# Test the program by creating multiple instances of the class and performing different transactions on them
account1 = Account("111111111", "Alice")
account1.deposit(500)
account1.withdraw(200)
print(f"Account balance for account1 is {account1.check_balance()}")

account2 = Account("222222222", "Bob")
account2.deposit(1000)
account2.withdraw(700)
print(f"Account balance for account2 is {account2.check_balance()}")