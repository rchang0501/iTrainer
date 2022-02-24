//
//  DailyExercise.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import Foundation

struct DailyExercise {
    var title: String
    var movements: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyExercise {
    static let sampleData: [DailyExercise] =
    [
        DailyExercise(title: "Morning Chest Routine", movements: ["Dumbell Press, Dumbell Fly, Barbell Press"], lengthInMinutes: 10, theme: .ocean)
        DailyExercise(title: "Afternoon Arm Routine", movements: ["Perniated Curls, Tricept Dips, Extended Curl"], lengthInMinutes: 10, theme: .poppy)
        DailyExercise(title: "Night Abs Routine", movements: ["Alternating Leg Raises, Boat Hold, Bicycles"], lengthInMinutes: 10, theme: .yellow)
    ]
}
