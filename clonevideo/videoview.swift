//
//  videoview.swift
//  clonevideo
//
//  Created by Tanmay on 04/01/23.
//

import SwiftUI
import AVKit

struct videoview: View {
    var video: ResponseBody.Video
    @State private var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear{
                if let link = video.videoFiles.first?.link {
                    player = AVPlayer (url: URL(string: link)!)
                }
            }
    }
    
    struct videoview_Previews: PreviewProvider {
        static var previews: some View {
            videoview(video: previewdata)
        }
    }
}
