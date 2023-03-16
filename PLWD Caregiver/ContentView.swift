//
//  ContentView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import SwiftUI
import Firebase
import FirebaseAuth
import CoreBluetooth

struct ContentView: View {
    
    
    @State private var isButtonClicked = false
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false

    
    
    var body: some View {
        NavigationView{
        
        ZStack {
           
            Color.blue
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
            VStack {
               
                
                
                
                
                Spacer()
            
                Text("Login").font(.title).fontWeight(.bold).foregroundColor(Color.white.opacity(0.88)).multilineTextAlignment(.center).bold() .padding([.top, .leading, .bottom], -13.0) .fontDesign(Font.Design.rounded)
                Spacer()
                Image("logo2")
                    .resizable()
                    .foregroundColor(Color.red)
                    .cornerRadius(200.0)
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing], -2.0/*@END_MENU_TOKEN@*/)
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                
                Button("Login") {
                    isButtonClicked = true
                    Auth.auth().signIn(withEmail: username, password: password) {
                        authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print (authResult)
                            //                            showingLoginScreen = true
                        }
                    }
                    // authenticateUser(username: username, password: password)
  
                    
                  
                    
                }

               
                
                
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
          
                
                NavigationLink(destination: createnewaccountUIView()){
                    Text ("Create account")
                }.foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    Spacer()
                
//                NavigationLink(destination: HomeView()) {
//                    Button("Login") {
//                        authenticateUser(username: username, password: password)
//
//                    }
//
//
//                           }
//                NavigationLink(destination: NavBarView(), isActive: $showingLoginScreen) {
//
//
//                               }
//
                
                
               
                
               
                    NavigationLink(destination: NavBarView(), isActive: $showingLoginScreen) {
                        // empty closure
                    }.navigationBarHidden(true)
                        .onAppear() {
                            showingLoginScreen = true
                        }
                
                
                    
                
                
            }
            
            if isButtonClicked {
                            Text("")
                                .onAppear {
                                    showingLoginScreen = true
                                    // This will be executed only once the button is clicked
                                    print("View appeared after button was clicked")
                                }
                        }
            
//            .navigationBarHidden(false)
            Spacer()
        }
        }
    }
        
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == (usernameR) {
            wrongUsername = 0
            if password.lowercased() == (passwordR) {
                wrongPassword = 0
                showingLoginScreen = true

            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
        
        
       
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





//
//  HomeView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

