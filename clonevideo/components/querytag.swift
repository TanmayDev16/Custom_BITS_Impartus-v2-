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
        Text(query.rawValue)
            .font (.caption)
            .foregroundColor(clicked ? Color(.darkGray) : .gray)
            .padding()
            .background(Color(.lightGray))
    }
}

struct querytag_Previews: PreviewProvider {
    static var previews: some View {
        querytag(query: Query.car, clicked: true)
    }
}
