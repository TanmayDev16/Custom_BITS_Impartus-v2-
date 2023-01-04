//
//  videomanager.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//
import Foundation
enum Query: String,CaseIterable{
    case computer,bike,car,sports,dance,shooting
}
class videomanager: ObservableObject{
    @Published private(set) var videos: [ResponseBody.Video] = []
    @Published var selectedQuery: Query
    = Query.computer{
        didSet {
            Task.init{
                await findvideos(topic: selectedQuery)
            }
        }
    }
    init(){
        Task.init{
            await findvideos(topic: selectedQuery)
        }
    }
    
    func findvideos(topic: Query) async{
        do{
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=30&orientation=portrait") else{
                fatalError("missing URL")
        
            }
                
                var urlrequest = URLRequest(url: url)
            //as it is general purpose api--pexels so it is not put in an .env file
                urlrequest.setValue("563492ad6f917000010000019c290d3e2abf46d48cbce895e0251668", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlrequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError ("Error while fetching data") }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ResponseBody.self, from: data)
            
            DispatchQueue.main.async{
                self.videos = []
                self.videos = decodedData.videos
                
            }
            
            
        }
            catch{
                print("print error fetching URL")
            }
        }
    }


//API structure copied from API docs 
struct ResponseBody: Decodable {
    var page: Int
    var perPage: Int
    var totalResults:Int
    var url: String
    var videos: [Video]
    
    struct Video: Identifiable, Decodable {
        var id: Int
        var image: String
        var duration: Int
        var user: User
        var videoFiles: [VideoFile]
        
        
        struct User: Identifiable, Decodable {
            var id: Int
            var name: String
            var url: String
        }
        struct VideoFile: Identifiable, Decodable {
            var id: Int
            var quality: String
            var fileType: String
            var link: String
            
        }
    }
}
