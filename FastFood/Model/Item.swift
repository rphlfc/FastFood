//
//  Item.swift
//  FoodDelivery
//
//  Created by Raphael Cerqueira on 03/06/21.
//

import SwiftUI

struct Item {
    var color: Color
    var logo: String
    var image: String
    var title: String
    var meal: String
}

var data = [
    Item(color: Color(#colorLiteral(red: 0.7952908874, green: 0.0002264413197, blue: 0.02012459747, alpha: 1)), logo: "mcdonalds", image: "mcdonalds-image", title: "McDonald's", meal: "Burgers, American"),
    Item(color: Color(#colorLiteral(red: 0.1239108816, green: 0.5254474282, blue: 0.001638587331, alpha: 1)), logo: "subway", image: "subway-image", title: "Subway", meal: "Sandwich, Healthy"),
    Item(color: Color(#colorLiteral(red: 0.05888551474, green: 0.3181492388, blue: 0.5006856918, alpha: 1)), logo: "dominos", image: "dominos-image", title: "Domino's", meal: "Pizza, Italian"),
    Item(color: Color(#colorLiteral(red: 0.1011027768, green: 0.3836654425, blue: 0.2656644881, alpha: 1)), logo: "starbucks", image: "starbucks-image", title: "Starbucks", meal: "Coffee, Beverage"),
    Item(color: Color(#colorLiteral(red: 0.9863083959, green: 0.6689484119, blue: 0.3309106827, alpha: 1)), logo: "pizzahut", image: "pizzahut-image", title: "Pizza Hut", meal: "Pizza, Italian")
]
