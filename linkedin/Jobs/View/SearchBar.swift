//
//  SearchBar.swift
//  linkedin

import SwiftUI

struct SearchBar: View {
    
    @State private var showMenu: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.circle")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.gray)
            
            //SearchView
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.blue.opacity(0.1))
                .frame(width: 270, height: 30)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        Spacer()
                    }.padding()
                )
            
            //MessageBox
            Image(systemName: "ellipsis.bubble.fill")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.gray)

        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
