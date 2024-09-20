# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/bank-account/canonical-data.json
# File last updated on 2024-09-20
app [main] {
    pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br"
}

main =
    Task.ok {}

import BankAccount exposing [open, close, deposit, withdraw, balance]

# Newly opened account has zero balance
expectResult1 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> balance

expect
    expectResult1 == Ok 0

# Single deposit
expectResult2 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> balance

expect
    expectResult2 == Ok 100

# Multiple deposits
expectResult3 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> deposit? 50
    |> balance

expect
    expectResult3 == Ok 150

# Withdraw once
expectResult4 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> withdraw? 75
    |> balance

expect
    expectResult4 == Ok 25

# Withdraw twice
expectResult5 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> withdraw? 80
    |> withdraw? 20
    |> balance

expect
    expectResult5 == Ok 0

# Can do multiple operations sequentially
expectResult6 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> deposit? 110
    |> withdraw? 200
    |> deposit? 60
    |> withdraw? 50
    |> balance

expect
    expectResult6 == Ok 20

# Cannot check balance of closed account
expectResult7 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> close?
    |> balance

expect
    Result.isErr expectResult7

# Cannot deposit into closed account
expectResult8 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> close?
    |> deposit 50

expect
    Result.isErr expectResult8

# Cannot deposit into unopened account
expectResult9 =
    { isOpen: Bool.false, balance: 0 }
    |> deposit 50

expect
    Result.isErr expectResult9

# Cannot withdraw from closed account
expectResult10 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> close?
    |> withdraw 50

expect
    Result.isErr expectResult10

# Cannot close an account that was not opened
expectResult11 =
    { isOpen: Bool.false, balance: 0 }
    |> close

expect
    Result.isErr expectResult11

# Cannot open an already opened account
expectResult12 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> open

expect
    Result.isErr expectResult12

# Reopened account does not retain balance
expectResult13 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 50
    |> close?
    |> open?
    |> balance

expect
    expectResult13 == Ok 0

# Cannot withdraw more than deposited
expectResult14 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 25
    |> withdraw 50

expect
    Result.isErr expectResult14

# Cannot withdraw negative
expectResult15 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit? 100
    |> withdraw -50

expect
    Result.isErr expectResult15

# Cannot deposit negative
expectResult16 =
    { isOpen: Bool.false, balance: 0 }
    |> open?
    |> deposit -50

expect
    Result.isErr expectResult16
