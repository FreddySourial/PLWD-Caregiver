//
//  NavBarView.swift
//  ProjectCS_4thYear
//
//  Created by Freddy Sourial on 2023-03-08.
//


import SwiftUI

struct NavBarView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()
            switch selectedIndex {
            case 0:
                // Replace this with the view you want to navigate to for button 1
                bluetoothView()
//                Text("View 3")
            case 1:
                // Replace this with the view you want to navigate to for button 2
                testView()
            case 2:
                // Replace this with the view you want to navigate to for button 3
                Text("View 3")
            case 3:
                // Replace this with the view you want to navigate to for button 4
                Text("View 4")
            default:
                Text("Unknown view")
            }
            
            Spacer()
            
            
            HStack {
        
                Button(action: {
                    selectedIndex = 0
                }) {
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(selectedIndex == 0 ? .blue : .gray)
                
                Spacer()
                
                Button(action: {
                    selectedIndex = 1
                }) {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(selectedIndex == 1 ? .blue : .gray)
                
                Spacer()
                
                Button(action: {
                    selectedIndex = 2
                }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(selectedIndex == 2 ? .blue : .gray)
                
                Spacer()
                
                Button(action: {
                    selectedIndex = 3
                }) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(selectedIndex == 3 ? .blue : .gray)
                
                Spacer()
            }
            
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .edgesIgnoringSafeArea(.all)
            
            Spacer()
            
         
            
            Spacer()
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}




//import SwiftUI
//
//struct NavBarView: View {
//    var body: some View {
//        NavigationView {
//            Text("Welcome to NavBarView!")
//                .navigationTitle("NavBarView")
//        }
//    }
//}
//struct NavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarView()
//    }
//}
