//
//  Logo.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 01/09/22.
//

import Foundation
import SwiftUI

struct Logo: View {
    var body: some View {
        HStack(spacing: 0){
            Text("Linked ")
                .foregroundColor(.cyan)
                .font(.system(size: 30, weight: .semibold, design: .serif))
            Text("in")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .semibold, design: .serif))
                .padding(2)
                .background(.cyan)
                .cornerRadius(3)
            Spacer()
        }
        
    }
}
