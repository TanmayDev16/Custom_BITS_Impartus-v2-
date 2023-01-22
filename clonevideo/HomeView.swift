//
//  HomeView.swift
//  clonevideo
//
//  Created by Tanmay on 21/01/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var videoManager = videomanager()
    var repres = [GridItem(.adaptive(minimum: 400), spacing: 10)]
    var body: some View {
        NavigationView {
            ZStack {
                AngularGradient (gradient: Gradient (colors: [.red,.yellow,.green,.blue,.purple]), center: .center)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        ForEach(Query.allCases,id:\.self){
                            searchquery in querytag(query: searchquery, clicked: videoManager.selectedQuery == searchquery)
                                .onTapGesture{
                                    videoManager.selectedQuery = searchquery
                                }}}.frame(height: 10)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
