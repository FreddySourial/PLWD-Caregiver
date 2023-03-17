//
//  myProfileView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import SwiftUI
extension View {
    func navigate<NewView: View>(to destination: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self.hidden()
                if binding.wrappedValue {
                    NavigationLink(destination: destination, isActive: binding) {
                        EmptyView()
                    }
                }
            }
        }
    }
}
struct myProfileView: View {
    @State var showingalert: Bool = false
    @State private var shouldShowLoggedOutView = false

    var body: some View {
        
        NavigationView{
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("")
                        .padding(.all, 21.0)
                    Text ("Patient Details")
                        .fontWeight(.black)
                        .bold(true) .foregroundColor(.white)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20.0)
                    
                    
                    HStack {
                        Text ("Name:")
                            .fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("Arnold S") .fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Age:").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("69").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Date of Birth: ").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("6/9/1969").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Height: ").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("5'9'").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Weight: ").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("169 lbs").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Allergies:").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("Peanut Allergy").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                    }
                    HStack {
                        Text ("Medications: ").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 0)
                            .padding(.vertical, 1.8)
                        Spacer ()
                        Text ("N/A").fontWeight(.heavy)
                            .bold(true) .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 1.8)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                    .padding(.horizontal)
                VStack {
                    Spacer()
                    Spacer()
                    Button(action: {
                        
                        showingalert = true
                    }, label: {
                        Text("LogOut")
                    }) .padding(.vertical, 500.0)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                        .alert(isPresented: $showingalert){
                            Alert(
                                title: Text("Logout?"),
                                message: Text ("Are you sure you want to logout of your account?"),
                                primaryButton: .default(Text("Yes")){
                                   
                                    shouldShowLoggedOutView = true
//
                                },
                                secondaryButton: .cancel(){}
                                
                            )
                            
                        }
                        
                    NavigationLink(destination: loggedOutView(), isActive: $shouldShowLoggedOutView) {
                        
                                     }.navigationBarHidden(true)
                        .padding([.leading, .bottom, .trailing], 20.0)
                    
                    Divider()
                    
                    
                    
                    
                    
                    
                }
                //zstACK brackets
                //            .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
                
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
    
    struct myProfileView_Previews: PreviewProvider {
        static var previews: some View {
            myProfileView()
                .background(Color.gray.opacity(0.1))
        }
    }
}
