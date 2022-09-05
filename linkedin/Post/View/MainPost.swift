//
//  MainPost.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 30/08/22.
//

import SwiftUI
import Firebase

struct MainPost: View {
    
//    @EnvironmentObject var session: SessionSt
    @StateObject var profileService = ProfileService()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
                ForEach(self.profileService.posts, id: \.postId) {(post) in
                    PostView(post: post)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear() {
            self.profileService.loadUserPost(userId: Auth.auth().currentUser!.uid)
        }
      
    }
}

struct MainPost_Previews: PreviewProvider {
    static var previews: some View {
        MainPost()
    }
}
