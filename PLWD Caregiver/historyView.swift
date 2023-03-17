//
//  historyView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import SwiftUI
import Firebase


struct historyView: View {
    @ObservedObject var model = ViewModel()
    
    @State var location = ""
    @State var address = ""
    @State var passwordR = ""
    @State var usernameR = ""
    
    var body: some View {
        ZStack {
          
                                  LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                                    
                                  LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                             
            VStack {
                
                           
                              
                Text (" ").bold(true)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top)
  
                Text ("List of Safe Spaces").bold(true) .foregroundColor(.white)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10.0)
               
                Spacer()
                
                List (model.list) { item in
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white)
                        .overlay(
                            HStack(alignment: .center, spacing: 0)  {
                                Text(item.location)
                                Spacer()
                                Text(item.address)
                                .buttonStyle(BorderlessButtonStyle())
                                Button(action: {
                                    model.deleteData(todoToDelete: item)
                                }, label: {
                                    Image(systemName: "minus.circle")
                                })
                                .buttonStyle(BorderlessButtonStyle())
//                                .cornerRadius(5)
                            }
                            .padding(.horizontal, 16)
                        )
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }
                .cornerRadius(7)
                .frame(height: 300.0)
                .listStyle(PlainListStyle())
                .background(
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)),
                                    Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6),
                                    Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)
                                ]
                            ),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                      
                    }
                        .blur(radius: 11)
                )
                
                Spacer()
                VStack(spacing: 5){
                  Spacer()
                    
                
                    Text ("Would you like to add a new location?").font(.title2).bold(true) .foregroundColor(.white)
                        TextField ("location", text: $location)
                            .padding(.all)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("address", text: $address)
                            .padding(.all)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            model.addData(location: location, address: address)
                        location = ""
                        address = ""
                        }, label: {
                            Text("Add safe space")
                        })
                        .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    
                   Spacer()
                }
            }
            .padding(.top, 15.0)
        }
    }
        
    init(){
        model.getData()
        model.getUsers()
    }
}

struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        historyView()
    }
}
