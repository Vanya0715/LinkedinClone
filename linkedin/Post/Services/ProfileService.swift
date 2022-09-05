//
//  ProfileService.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 30/08/22.
//

import Foundation

class ProfileService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    func loadUserPost(userId: String) {
        PostService.loadUserPosts(userId: userId) { posts in
            self.posts = posts
        }
    }
}
