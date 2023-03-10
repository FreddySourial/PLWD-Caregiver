
//  action.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void

}
