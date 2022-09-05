//
//  JobsView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 26/07/22.
//

import SwiftUI

struct JobsView: View {
    var body: some View {
        VStack {
            SearchBar()
                .padding(.bottom, 5)
            Divider()
            HStack(spacing: 70) {
                HStack {
                    Image(systemName: "bookmark")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                    Text("My jobs")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                    Text("Post a job")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }.padding(.vertical, 8)
            Divider()
            List {
            
            }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView()
    }
}
