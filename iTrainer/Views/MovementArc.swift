//
//  MovementArc.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-10.
//

import SwiftUI

struct MovementArc: Shape {
    let movementIndex: Int // determines which movement is active and how many segments to draw
    let totalMovements: Int // number of arc segments is based on this value
    
    // this determines the length of the arc per movement
    private var degreesPerMovement: Double {
        360.0 / Double(totalMovements)
    }
    
    // determines which angle to start drawing the arc
    // e.g. seocnd movement will start at 36 degrees (since there will be 10 movements)
    // the extra 1 degree is for visual separation between arc segments
    private var startAngle: Angle {
        Angle(degrees: degreesPerMovement * Double(movementIndex) + 1.0)
    }
    
    // the 1 degree difference is for visual separation between arcs
    // it's a structure that contains the location and dimensions of a rectangle
    // the origin by default is the bottom left corner with positive values extending to the top right
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerMovement - 1.0)
    }
    
    // CGRect is core graphics rectangle
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0 // gets the smaller between the rectangle's width and height and then subtracts 24 (units presumably) to it to define the diameter
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY) // CGRect strcuture contains x and y coordinate properties
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false) // add arc to the path using the earlier defined values
        }
    }
}

