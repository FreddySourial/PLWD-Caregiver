//
//  NavBarView.swift
//  ProjectCS_4thYear
//
//  Created by Freddy Sourial on 2023-03-08.
//


import SwiftUI
import UIKit
struct NavBarView: View {
    @State private var selectedIndex = 0
    let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
    let steelGray = Color(white: 0.4745)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                  
                                  LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                           .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Spacer()
                switch selectedIndex {
                case 0:
                    
                    //BLEViewWrapper()
                    bluetoothView()
                    //                Text("View 3")
                case 1:
                    
                    historyView()
                    
                case 2:
                    
                    testView()
                    
                case 3:
                    
                    viewView()
                    
                case 4:
                    
                    myProfileView()
                    
                default:
                    Text("Unknown view")
                } 
                
            
                
                
                HStack(alignment: .center, spacing: 0.0) {
                    
                    Button(action: {
                        selectedIndex = 0
                    }) {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .shadow(radius: 4)
                        
                    }.padding(.bottom)
                        .padding([.top, .leading, .bottom])
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
                    .padding(.bottom)
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
                    .padding(.bottom)
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
                    .padding(.bottom)
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
                    .padding(.bottom)
                    .foregroundColor(selectedIndex == 4 ? .blue : .blue.opacity(0.4))
                    
                    Spacer()
                    //
                    
                }
                
                .padding(.horizontal)
                .padding(.vertical, 11)
                .background(Color.gray.opacity(0.1))
                .edgesIgnoringSafeArea(.all)
                
                .shadow(radius: 5)
                //            .padding(.horizontal)
                //            .padding(.vertical, 10)
                .edgesIgnoringSafeArea(.all)
                
            }
//            .padding(.top)
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        
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
