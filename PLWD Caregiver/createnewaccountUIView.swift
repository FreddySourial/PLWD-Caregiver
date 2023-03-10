//
//  createnewaccountUIView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-03.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct createnewaccountUIView: View {
    @ObservedObject var model = ViewModel()
    
    @State var password = ""
    @State var username = ""
    @State var showingalert: Bool = false
    @State var showingalert1: Bool = false
    @State private var text: String = ""
    @State private var color: Color = Color.gray
    @State private var color2: Color = Color.gray
    @State private var count: Int = 0
    @State private var count2: Int = 0
    
    var body: some View {
        
        VStack {
           
            VStack(spacing: 11.0){
                Text("Create New Account ")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                HStack {
                    TextField ("username ", text: $username) .overlay(RoundedRectangle(cornerRadius:5) .stroke(color,lineWidth:1))
                        .foregroundColor(color)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all)
                        .onChange(of: usernameR) { text in
                            let letters = text.trimmingCharacters(in: .whitespaces).count
                            self.count = letters
                            
                            switch letters {
                            case 1..<5:
                                self.color = .red
                            case 5..<8:
                                self.color = .orange
                            case 8...:
                                self.color = .green
                            default:
                                self.color = .gray
                                
                            }
                        }

//                    Text("\(count)")
                }
               
                SecureField("password", text: $password) .overlay(RoundedRectangle(cornerRadius:5) .stroke(color2,lineWidth:1))
                    .foregroundColor(color2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all)
                    .onChange(of: passwordR) { text1 in
                        let letters2 = text1.trimmingCharacters(in: .whitespaces).count
                        self.count2 = letters2
                        
                        switch letters2{
                        case 1..<5:
                            self.color2 = .red
                        case 5..<8:
                            self.color2 = .orange
                        case 8...:
                            self.color2 = .green
                        default:
                            self.color2 = .gray
                            
                        }
                    }
                Button(action: {
                    
                    Auth.auth().createUser(withEmail: username, password: password) {
                        authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print (authResult)
                        }
                    }
                    
                    
//                    model.addUser(username1: username1, password1: password1)
//                    username1 = ""
//                    password1 = ""
                    showingalert = true
                }, label: {
                    Text("Create New Account")
                })
                .padding(.all)
                .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                    .alert(isPresented: $showingalert){
                        Alert(
                            title: Text("Create New Account?"),
                    message: Text ("Are you sure you want to create a new account?"),
                            primaryButton: .default(Text("Yes")){
                                Auth.auth().createUser(withEmail: username, password: password) {
                                    authResult, error in
                                    if let error = error {
                                        print(error)
                                        return
                                    }
                                    if let authResult = authResult {
                                        print (authResult)
                                    }
                                }
//                                Auth.auth().createUser(withEmail: usernameR, password: passwordR)
                                model.addUser(usernameR: usernameR, passwordR: passwordR)
                                usernameR = ""
                                passwordR = ""
                                showingalert1 = true
                            },
                            secondaryButton: .cancel(){}
                            )
                    }
                
                
                    .alert("Congrats! Your new account has been created! Please go back and login!", isPresented: $showingalert1, actions:{})
//                        Alert(
//                            title: Text("Congrats! "),
//                    message: Text ("Your new account has been created! Please go back and Login"))
                    
                    .padding()
            }.padding(.all) .overlay(RoundedRectangle(cornerRadius:5) .stroke(.gray,lineWidth:2))
        } .padding(.all, 20.0)
    }
}

struct createnewaccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        createnewaccountUIView()
    }
}
