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
        var newurl = URL(string: video.image)
        ZStack {
            ZStack(alignment:.bottomTrailing){
                AsyncImage(url: newurl){
                    image in image.resizable()
                        .frame(width: 380, height: 150)
                        .cornerRadius (250)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
}
            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.gray)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(200)
            
        }
    }
}

struct videocard_Previews: PreviewProvider {
    static var previews: some View {
        videocard(video: previewdata)
    }
}
