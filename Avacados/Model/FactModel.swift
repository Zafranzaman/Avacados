//
//  Fact.swift
//  Avacados
//
//  Created by Zafran on 01/07/2024.
//


import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String 
}
