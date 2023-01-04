//
//  querytag.swift
//  clonevideo
//
//  Created by Tanmay on 03/01/23.
//

import SwiftUI

struct querytag: View {
    var query: Query
    var isSelected: Bool
    var body: some View {
        Text(query.rawValue)
            .font (.caption)
            .bold ( )
            .foregroundColor (isSelected ? .black : .gray)
            .padding (10)
            .background(.thinMaterial)
    }
}

struct querytag_Previews: PreviewProvider {
    static var previews: some View {
        querytag(query: Query.car, isSelected: true)
    }
}
