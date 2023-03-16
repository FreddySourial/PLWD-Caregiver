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
                
                           
                              
           
    //            List (model.list) { item in
    //                HStack {
    //                    Text(item.name)
    //                    Spacer()
    //
    //
    //                    //update button
    //                    //                    Button(action: {
    //                    //                        model.updateData(todoToUpdate: item)
    //                    //                    }, label: {
    //                    //                        Image(systemName: "pencil")
    //                    //                    })
    //
    //
    //                        .buttonStyle(BorderlessButtonStyle())
    //
    //                    Button(action: {
    //                        model.deleteData(todoToDelete: item)
    //                    }, label: {
    //                        Image(systemName: "minus.circle")
    //                    })
    //                    .buttonStyle(BorderlessButtonStyle())
    //
    //                }
    //            }
                
                ////// WORKING LIST TO SHOW OTHER COLLECTION!
    //
    //            List (model.listusers) {item in
    //                Text(item.usernameR)
    //
    //                Text (item.passwordR)
    //
    //            }
    //                /////////////////////////////////////////
       
                Text (" ").bold(true)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top)
               
                
            
                
                //         Divider() .background(Color.gray.opacity(0.1)).ignoresSafeArea()
         
               
//                .background(Color.gray.opacity(0.1))
              
                
                Text ("List of Safe Spaces").bold(true) .foregroundColor(.white)
                    .font(.title2)
                    .multilineTextAlignment(.center)
               
                
                
                List (model.list) { item in
                    
                    HStack {
                        Text(item.location)
                        Spacer()
                        
                        Text(item.address)
                        
                    
                        //update button
    //                    Button(action: {
    //                        model.updateData(todoToUpdate: item)
    //                    }, label: {
    //                        Image(systemName: "pencil")
    //                    })
                        
                        
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Button(action: {
                            model.deleteData(todoToDelete: item)
                        }, label: {
                            Image(systemName: "minus.circle")
                        })
                        .buttonStyle(BorderlessButtonStyle())

                        
                        
                        
                    }
                    //hstsck brackets
                   
                    
                    
                    
                    
                }
                .frame(height: 250.0)
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
                
                
                VStack(spacing: 5){
//                    ScrollView(.vertical) { // Add ScrollView here
//                        TextField ("location", text: $location)
//                            .padding(.all)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                        TextField("address", text: $address)
//                            .padding(.all)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                    }
                  
                
                        Text ("Would you like to add a new location?").bold(true) .foregroundColor(.white)
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
//        .background(Color.gray.opacity(0.1))
    }
        
    init(){
        model.getData()
        model.getUsers()
//        model.getUsers()
    }
  
   
}

struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        historyView()
    }
}
