//
//  DailyExercise.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import Foundation

struct DailyExercise: Identifiable { // identfiable protocal ensures uniqueness between elements
    let id: UUID // necessary for hte identfiable protocal
    var title: String
    var movements: [Movement]
    var lengthInMinutes: Int
    var theme: Theme
    
    // assigned default value to id (id: UUID = UUID()) -> enables you to omit the parameter during initialization
    init(id: UUID = UUID(), title: String, movements: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.movements = movements.map {Movement(name: $0)} // creates a new collection by iterating over and applying a transforamtion to each element
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyExercise {
    struct Movement: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String){
            self.id = id
            self.name = name
        }
    }
    
    struct Data { // by nesting in an extention of DailyExercise, the Data struct remains distinct from the one in Foundation
        var title: String = "" // assign defualt values so initializing a new Data struct can be done simply with Data() rather than passing fields
        var movements: [Movement] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, movements: movements, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        movements = data.movements
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data){
        id = UUID()
        title = data.title
        movements = data.movements
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

extension DailyExercise {
    static let sampleData: [DailyExercise] =
    [
        DailyExercise(title: "Chest Routine", movements: ["Dumbell Press", "Dumbell Fly", "Diamond Push-Ups", "Barbell Press", "Dumbell Twists Press", "Dumbell Close Press", "Explosive Push-Ups", "Regular Push-Ups", "Dumbell Press", "Bench Dips"], lengthInMinutes: 10, theme: .ocean),
        DailyExercise(title: "Arm Routine", movements: ["Rear Delt Fly", "Lateral Raises", "Bench Dips", "Overhead Tricep Extension", "Skull Crushers", "Hammer Curls", "Pronated Curls", "Supinated Bicep Curls", "Pronated Wrist Curls", "Supinated Wrist Curls"], lengthInMinutes: 10, theme: .poppy),
        DailyExercise(title: "Abs Routine", movements: ["Leg Raises", "Alternating Leg Raises", "Russian Twists", "Side Plank Raises",  "Plank Open and Close", "Plank Up and Down", "Plank Side to Side Twist", "Boat Hold", "Bicycles", "Reach-Ups"], lengthInMinutes: 10, theme: .yellow)
    ]
}
