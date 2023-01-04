//
//  clonevideoApp.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//




//FireBase Integration on authentication
import SwiftUI
import Firebase

@main
struct clonevideoApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
