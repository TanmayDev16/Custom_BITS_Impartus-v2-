//
//  querytag.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//

import SwiftUI

struct querytag: View {
    var query: Query
    var desc: String = "Components"
    var clicked: Bool
    var body: some View {
        VStack{
            Text(query.rawValue)
                .font (.caption)
                .foregroundColor(clicked ? Color(.black) : .white)
                .padding()
                .background(Color(.lightGray))
            //            .frame(height:400)
        }
    }
}

struct querytag_Previews: PreviewProvider {
    static var previews: some View {
        querytag(query: Query.car, clicked: true)
//            .frame(height : 3)
    }
}
