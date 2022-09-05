//
//  Ocassion.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 29/07/22.
//

import SwiftUI

struct Ocassion: View {
    var body: some View {
        VStack(alignment: .leading) {
            Logo()
                .padding()
            Text("Select an option")
                .font(.system(size: 22, weight: .semibold, design: .serif))
                .foregroundColor(.black.opacity(0.8))
                .padding()
          List {
                ocassions(title: "Welcome to the Team", subtitle: "Celebrate a new colleague joining your team")
                ocassions(title: "Give Kudos", subtitle: "show appreciation to your colleague")
                ocassions(title: "Project Launch", subtitle: "Share a new project milestone")
                ocassions(title: "Work Anniversary", subtitle: "Celebrate a career milestone")
                ocassions(title: "New Position", subtitle: "Share a job update")
          }.listStyle(.inset)
                .onTapGesture {

                }

            }
        }
       
        
    }


struct Ocassion_Previews: PreviewProvider {
    static var previews: some View {
        Ocassion()
    }
}

struct ocassions: View {
    @State var title: String
    @State var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .foregroundColor(.black.opacity(0.8))
            Text(subtitle)
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundColor(.gray)
        }
    }
}
