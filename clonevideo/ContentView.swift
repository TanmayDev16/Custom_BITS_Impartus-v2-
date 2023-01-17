//
//  ContentView.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @StateObject var videoManager = videomanager()
    var repres = [GridItem(.adaptive(minimum: 400), spacing: 10)]
    var body: some View {
        var querySel = videoManager.selectedQuery
        NavigationView {
            ZStack {
                AngularGradient (gradient: Gradient (colors: [.red,.yellow,.green,.blue,.purple]), center: .center)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        ForEach(Query.allCases,id:\.self){
                            searchquery in querytag(query: searchquery, clicked: querySel == searchquery)
                                .onTapGesture{
                                    querySel = searchquery
                                }}}
        ScrollView{
            LazyVGrid(columns: repres, spacing: 20) {
                ForEach(videoManager.videos,id: \.id){ video in
                    NavigationLink{
                        videoview(video: video)
                    }
                label: {
                    videocard(video: video)}
                }}
                .padding()
                }
                }
            }
        }
}
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

