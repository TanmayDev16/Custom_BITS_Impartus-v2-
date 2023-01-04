//
//  loginview.swift
//  clonevideo
//
//  Created by Tanmay on 04/01/23.
//

import SwiftUI
import Firebase

struct loginview: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            VStack(spacing :20){
 
                TextField("Email",text:$email)
                    .foregroundColor(.black)
                    .bold()
                Rectangle()
                    .frame(width: 350,height:1)
                    .foregroundColor(.black)
                SecureField("Password",text:$password)
                    .foregroundColor(.black)
                    .bold()
                Rectangle()
                    .frame(width: 350,height:1)
                    .foregroundColor(.black)
                
                
                Button{
                    register()
                } label:{
                    NavigationLink(destination: ContentView()){
                        Text("Sign UP")
                            .bold()
                            .frame(width:200,height:40)
                            .foregroundColor(.black)
                    }
                }
                
                Button{
                    login()
                } label:{
                    Text("Already have an account? Login")
                        
                        .frame(width:200,height:40)
                        .foregroundColor(.blue)
                }
                
            }
            
            .navigationTitle("BITS-Course-Viewer")
            .padding()
            
            
            
            
        }
    
            

            
        }
    
    
func register() {
    Auth.auth().createUser(withEmail: email, password: password)
    { result, error in
        if error != nil {
            
            print(error!.localizedDescription)
        }}}
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result,error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    
}
        


struct loginview_Previews: PreviewProvider {
    static var previews: some View {
        loginview()
    }
}
