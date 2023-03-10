//
//  NavBarView.swift
//  ProjectCS_4thYear
//
//  Created by Freddy Sourial on 2023-03-08.
//


import SwiftUI

struct NavBarView: View {
    @State private var selectedIndex = 0
    let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
    let steelGray = Color(white: 0.4745)
    var body: some View {
        
        VStack(spacing: 0) {
            
            switch selectedIndex {
            case 0:
                // Replace this with the view you want to navigate to for button 1
                bluetoothView()
//                Text("View 3")
            case 1:
                // Replace this with the view you want to navigate to for button 2
                historyView()
                
            case 2:
                // Replace this with the view you want to navigate to for button 3
                testView()
                
            case 3:
                // Replace this with the view you want to navigate to for button 4
                viewView()
                
            case 4:
                // Replace this with the view you want to navigate to for button 3
                myProfileView()
                
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
                        .frame(width: 35, height: 35)
                        .shadow(radius: 4)
                        
                }
                .padding(.leading)
                .foregroundColor(selectedIndex == 0 ? .blue : .blue.opacity(0.4))
                
                Spacer()
                
                //
                Button(action: {
                    selectedIndex = 1
                }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .shadow(radius: 4)
                }
                .foregroundColor(selectedIndex == 1 ? .blue : .blue.opacity(0.4))
                
                Spacer()
                //
                Button(action: {
                    selectedIndex = 2
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .shadow(radius: 4)
                }
                .foregroundColor(selectedIndex == 2 ? .blue : .blue.opacity(0.4))
                
                Spacer()
                //
                Button(action: {
                    selectedIndex = 3
                }) {
                    Image(systemName: "map.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .shadow(radius: 4)
                }
                .foregroundColor(selectedIndex == 3 ? .blue : .blue.opacity(0.4))
                
                Spacer()
              //
                //
                Button(action: {
                    selectedIndex = 4
                }) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .fontWeight(.bold)
                        .shadow(radius: 4)
                }
                .foregroundColor(selectedIndex == 4 ? .blue : .blue.opacity(0.4))
                
                Spacer()
            //
                
            }
            
            .padding(.horizontal)
            .padding(.vertical, 11)
            .background(Color.gray.opacity(0.1))
            
            .shadow(radius: 5)
//            .padding(.horizontal)
//            .padding(.vertical, 10)
            .edgesIgnoringSafeArea(.all)
            
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
