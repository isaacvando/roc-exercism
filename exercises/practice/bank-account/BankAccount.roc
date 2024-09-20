module [open, close, deposit, withdraw, balance]

Account : { isOpen: Bool, balance: Money }
Money : Dec

open : Account -> Result Account _
open = \account ->
    crash "Please implement 'open'"

close : Account -> Result Account _
close = \account ->
    crash "Please implement 'close'"

deposit : Account, Money -> Result Account _
deposit = \account, amount ->
    crash "Please implement 'deposit'"

withdraw : Account, Money -> Result Account _
withdraw = \account, amount ->
    crash "Please implement 'withdraw'"

balance : Account -> Result Money _
balance = \account ->
    crash "Please implement 'balance'"
