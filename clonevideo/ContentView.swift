//
//  ContentView.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = videomanager()
    
    
    var repres = [GridItem(.adaptive(minimum: 500), spacing: 10)]
    var body: some View {
        
        NavigationView {
            VStack {
                HStack{
                    ForEach(Query.allCases,id:\.self){
                        searchquery in querytag(query: searchquery, isSelected: videoManager.selectedQuery == searchquery)
                            .onTapGesture{
                                videoManager.selectedQuery = searchquery
                            }
                    }
                }
                ScrollView{

                        LazyVGrid(columns: repres, spacing: 20) {
                        
                        ForEach(videoManager.videos,id: \.id){
                            video in
                            NavigationLink{
                                videoview(video: video)
                            } label: {
                                videocard(video: video)
                            }
                        }
                    }
                        .padding()
                  
            }
            .frame(maxWidth: .infinity)
            
        }
        .background(Color("AccentColor"))
        .navigationBarHidden(true)
        
    }
}
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

