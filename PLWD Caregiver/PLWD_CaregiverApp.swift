//
//  PLWD_CaregiverApp.swift
//  PLWD Caregiver
//
//  Created by Freddy Sourial on 2023-03-10.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
@main
struct PLWD_CaregiverApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
