//
//  TrailingIconLabelStyle.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle { // making a custom label style but system defualts can also be used
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title //config param is a LabelStyleConfiguration that contains title and icon views
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self {Self()}
}
