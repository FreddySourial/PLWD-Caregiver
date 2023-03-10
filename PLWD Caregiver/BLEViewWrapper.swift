//
//  BLEViewWrapper.swift
//  PLWD Caregiver
//
//  Created by Freddy Sourial on 2023-03-10.
//

import SwiftUI

struct BLEViewWrapper1: View {
    var body: some View {
        BLEViewWrapper()
    }
}

struct BLEViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BLEView {
        let bleView = BLEView()
        return bleView
    }
    
    func updateUIViewController(_ uiViewController: BLEView, context: Context) {
        // No updates needed
    }
}
