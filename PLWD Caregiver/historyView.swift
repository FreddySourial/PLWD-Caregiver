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
            
            VStack {
                Spacer()
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
                Spacer()
                Text (" ").bold(true)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                Text ("List of Safe Spaces").bold(true)
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

                        
                        
                        
                    }  //hstsck brackets
                    
                }
                .background(Color.gray.opacity(0.1))
                
                
                //         Divider() .background(Color.gray.opacity(0.1)).ignoresSafeArea()
                VStack(spacing: 5){
                    
                    Text ("Would you like to add a new location?").bold(true)
                    TextField ("location", text: $location)
                        .padding(.all) .foregroundColor(Color.gray.opacity(0.1))
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
                }
//                .background(Color.gray.opacity(0.1))
              
                
                

            }
        }.background(Color.gray.opacity(0.1))
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
