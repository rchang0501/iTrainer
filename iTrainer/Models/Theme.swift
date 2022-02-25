//
//  Theme.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

enum Theme: String { // these themes are defined in the assets folder
    // enum is done by cases in swift
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case ocean
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    // choose accent color based on the base color --> this provides better contrast for the user 
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .ocean, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue) // initializes a color from the asset catalog
    }
    var name: String {
        rawValue.capitalized
    }
}
