//
//  main.swift
//  week1_hw1-berxwashere
//
//  Created by HS on 25.09.2022.
//

import Foundation

enum Gender {
    case male
    case female
    case unknown
}

enum Job {
    case warrior
    case herbalist
    case wizard
    case butcher
    case unknown
}

enum ProductType {
    case sword
    case spear
    case shield
    case knife
    case pork
    case bunny
    case daisy
    case wolfsbane
    case tea
    case book
    case elixir
    case wand
    case unknown
}

enum PaymentType {
    case online
    case coin
}

class Product {
    var seller: Seller?
    var price: Double = 0.0
    var rate: Double = 0.0
    var comments: [String]?
    var type: ProductType! = .unknown
    var stock: Int = 3
}

class Person {
    var name: String = ""
    var age: Int = -1
}

class Seller: Person {
    var from: String = ""
    var rate: Double = 0.0
}

class Customer: Person {
    var gender: Gender?
    var job: Job!
    var purchasableProducts: [Product] = []
    var favorites: [Product] = []
    var basket: [Product] = []
    var paymentType: PaymentType?
    var wallet: Double = 111.0
}

print("Welcome to Medieval Shopping Yard")
print("Please enter your name: ", terminator: "")
let name = readLine()
var gender: Gender = .unknown
selectGender()

func selectGender() {
    print("Please choose your gender: 1 for Male - 2 for Female: ", terminator: "")
    let choice = readLine()
    switch choice {
    case "1":
        gender = Gender.male
    case "2":
        gender = Gender.female
    default:
        print("     ERROR: Please select a valid gender!\n")
        selectGender()
    }
}

var age = Int()
enterAge()

func enterAge() {
    print("Please enter your age: ", terminator: "")
    let stringAge = readLine()
    age = Int(stringAge!) ?? -1
    if age % 1 != 0 || age < 1 {
        print("     ERROR: Please enter a valid age value!\n")
        enterAge()
    }
}

var job: Job = .unknown
selectJob()

func selectJob() {
    print("Please choose your job: 1 for Warrior - 2 for Herbalist - 3 for Wizard - 4 for Butcher: ", terminator: "")
    let choice = readLine()
    switch choice {
    case "1":
        job = Job.warrior
    case "2":
        job = Job.herbalist
    case "3":
        job = Job.wizard
    case "4":
        job = Job.butcher
    default:
        print("     ERROR: Please select a valid job!\n")
        selectJob()
    }
}

var seller: Seller = Seller()
seller.name = "Pazarama"
seller.age = 35
seller.rate = 99.9

var sword: Product = Product()
sword.rate = 79.0
sword.seller = seller
sword.comments = ["coment1", "comment2", "comment3"]
sword.price = 50.0
sword.type = .sword

var spear: Product = Product()
spear.rate = 79.0
spear.seller = seller
spear.comments = ["coment1", "comment2", "comment3"]
spear.price = 50.0
spear.type = .spear

var shield: Product = Product()
shield.rate = 79.0
shield.seller = seller
shield.comments = ["coment1", "comment2", "comment3"]
shield.price = 50.0
shield.type = .shield

var book: Product = Product()
book.rate = 79.0
book.seller = seller
book.comments = ["coment1", "comment2", "comment3"]
book.price = 50.0
book.type = .book

var bunny: Product = Product()
bunny.rate = 79.0
bunny.seller = seller
bunny.comments = ["coment1", "comment2", "comment3"]
bunny.price = 50.0
bunny.type = .bunny

var daisy: Product = Product()
daisy.rate = 79.0
daisy.seller = seller
daisy.comments = ["coment1", "comment2", "comment3"]
daisy.price = 50.0
daisy.type = .daisy

var elixir: Product = Product()
elixir.rate = 79.0
elixir.seller = seller
elixir.comments = ["coment1", "comment2", "comment3"]
elixir.price = 50.0
elixir.type = .elixir

var knife: Product = Product()
knife.rate = 79.0
knife.seller = seller
knife.comments = ["coment1", "comment2", "comment3"]
knife.price = 50.0
knife.type = .knife

var pork: Product = Product()
pork.rate = 79.0
pork.seller = seller
pork.comments = ["coment1", "comment2", "comment3"]
pork.price = 50.0
pork.type = .pork

var tea: Product = Product()
tea.rate = 79.0
tea.seller = seller
tea.comments = ["coment1", "comment2", "comment3"]
tea.price = 50.0
tea.type = .tea

var wand: Product = Product()
wand.rate = 79.0
wand.seller = seller
wand.comments = ["coment1", "comment2", "comment3"]
wand.price = 50.0
wand.type = .wand

var wolfsbane: Product = Product()
wolfsbane.rate = 79.0
wolfsbane.seller = seller
wolfsbane.comments = ["coment1", "comment2", "comment3"]
wolfsbane.price = 50.0
wolfsbane.type = .wolfsbane

var currentCustomer: Customer = Customer()
currentCustomer.name = name ?? ""
currentCustomer.gender = gender
currentCustomer.age = age
currentCustomer.job = job

if currentCustomer.job == .warrior {
    currentCustomer.purchasableProducts = [sword, shield, spear]
} else if currentCustomer.job == .butcher {
    currentCustomer.purchasableProducts = [knife, pork, bunny]
} else if currentCustomer.job == .wizard {
    currentCustomer.purchasableProducts = [book, wand, elixir]
} else {
    currentCustomer.purchasableProducts = [tea, wolfsbane, daisy]
}

showMainMenu()

func showMainMenu() {
    print("\n     *** MAIN MENU ***\nPurchasable Products: ", terminator: "")
    for (index, product) in currentCustomer.purchasableProducts.enumerated() {
        print("\(index + 1).\(product.type ?? .unknown)  ", terminator: "")
    }
    print("     4.Profile  5.My Basket\nSelect your desired product or go to profile/your basket: ", terminator: "")
    let menuChoice = readLine()
    switch menuChoice {
    case "1", "2", "3":
        let index = (Int(menuChoice ?? "") ?? 0) - 1
        showProductDetail(index: index)
    case "4":
        print("Here are your favorite items: ", terminator: "")
        for favorite in currentCustomer.favorites {
            print("  \(favorite.type ?? .unknown)", terminator: "")
        }
        showMainMenu()
    case "5":
        showMyBasket()
    default:
        print("Please enter a valid item!")
        showMainMenu()
    }
}

func showMyBasket() {
    var totalAmount: Double = 0.0
            print("Here are your items in the basket: ", terminator: "")
    for (index, basketItem) in currentCustomer.basket.enumerated() {
        print("\(index + 1).\(basketItem.type ?? .unknown)  ", terminator: "")
                totalAmount += basketItem.price
            }
    if currentCustomer.basket.count == 0 {
        print("You don't have any products in your basket!")
    }
    print("\n  Total Amount: \(totalAmount),  Wallet: \(currentCustomer.wallet),    1. Continue to Payment  2. Clear Basket   3. Return to Main Menu: ", terminator: "")
            let basketMenuChoice = readLine()
            switch basketMenuChoice {
            case "1":
                if totalAmount != 0.0 {
                    paymentStep(totalAmount: totalAmount)
                } else {
                    print("Please add any product to your basket!\n")
                    showMainMenu()
                }
            case "2":
                currentCustomer.basket.removeAll()
                showMyBasket()
            case "3":
                showMainMenu()
            default:
                print("Please enter a valid process!")
                showMyBasket()
            }
}

func paymentStep(totalAmount: Double) {
    if currentCustomer.paymentType == nil {
        print("Please choose payment type:  1.\(PaymentType.coin)  2.\(PaymentType.online)")
        let paymentChoice = readLine()
        switch paymentChoice {
        case "1":
            currentCustomer.paymentType = .coin
        case "2":
            currentCustomer.paymentType = .online
        default:
            print("ERROR: Please select a valid payment type\n")
            paymentStep(totalAmount: totalAmount)
        }
    }
    if isWalletEnoughToBuy(totalAmount: totalAmount) {
        currentCustomer.wallet -= totalAmount
        for basketItem in currentCustomer.basket {
            basketItem.stock -= 1
        }
        print("* * * * * * * ** YOU BOUGHT SUCCESFULLY * * ** * * ** * * ** ")
        showMainMenu()
    } else {
        print("You have insufficient balance. Please add money to the wallet\nEnter the amount you prefer: ", terminator: "")
        guard let stringAmount = readLine() else { return }
        currentCustomer.wallet += Double(stringAmount) ?? 0.0
        showMyBasket()
    }
}

func isWalletEnoughToBuy(totalAmount: Double) -> Bool {
    let isBuyable = totalAmount <= currentCustomer.wallet ? true : false
    return isBuyable
}

func showProductDetail(index: Int) {
    print("     \(currentCustomer.purchasableProducts[index].type ?? .unknown)\n".uppercased() + "Seller Informations: \(currentCustomer.purchasableProducts[index].seller?.name ?? "") - \(currentCustomer.purchasableProducts[index].seller?.rate ?? -1) - \(currentCustomer.purchasableProducts[index].seller?.age ?? -1)\nProduct Rate: \(currentCustomer.purchasableProducts[index].rate )\nComments: \(currentCustomer.purchasableProducts[index].comments ?? []) \n Please add desired product to your basket/favorites : 1.Add to Favorites  2.Add to Your Basket 3.Exit to Main Menu: ", terminator: "")
    
    let menuChoice = readLine()
    switch menuChoice {
    case "1":
        currentCustomer.favorites.append(currentCustomer.purchasableProducts[index])
        print("This item is added to your Favorites...")
        showMainMenu()
    case "2":
        if currentCustomer.purchasableProducts[index].stock >= 1 {
            currentCustomer.basket.append(currentCustomer.purchasableProducts[index])
            print("This item is added to your Basket...")
            showMainMenu()
        } else {
            print("Out of Stock!")
            showMainMenu()
        }
    case "3":
        showMainMenu()
    default:
        print("ERROR: Please enter a valid selection!\n")
        showProductDetail(index: index)
    }
}



