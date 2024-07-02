//
//  Header.swift
//  Avacados
//
//  Created by Zafran on 01/07/2024.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
