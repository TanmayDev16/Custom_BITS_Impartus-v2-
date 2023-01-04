//
//  videocard.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//

import SwiftUI

struct videocard: View {
    var video : ResponseBody.Video
    var body: some View {
        ZStack {
            ZStack(alignment:.topLeading){
                AsyncImage(url: URL(string: video.image)){
                    image in image.resizable()
                        .frame(width: 380, height: 150)
                        .cornerRadius (50)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width:380 , height :150)
                        .cornerRadius(50)
                    
                }
                VStack(alignment: .leading){
                    Text("\(video.duration) sec")
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading)
                    Text("\(video.user.name)")
                        .font(.caption).bold().italic()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(Color("AccentColor"))
                .padding()
                       
            }
            
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(80)
            
        }
    }
}

struct videocard_Previews: PreviewProvider {
    static var previews: some View {
        videocard(video: previewdata)
    }
}
