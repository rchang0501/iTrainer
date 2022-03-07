//
//  History.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-03.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var movements: [ExerciseRoutine.Movement]
    var lengthInMinutes: Int
    
    init(id: UUID = UUID(), date: Date = Date(), movements: [ExerciseRoutine.Movement], lengthInMinutes: Int = 5) {
        self.id = id
        self.date = date
        self.movements = movements
        self.lengthInMinutes = lengthInMinutes
    }
}
