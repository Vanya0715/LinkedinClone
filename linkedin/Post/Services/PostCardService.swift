//
//  PostCardService.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 26/08/22.
//

import Foundation
import Firebase
import SwiftUI

class PostCardServices : ObservableObject {
    
    @Published var post: PostModel!
    @Published var isLinked = false
    
//    func hasLinkedPost() {
//        isLinked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true : false
//    }
    
    func like() {
        post.likeCount += 1
        isLinked = true
        
        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount" : post.likeCount, "\(Auth.auth().currentUser!.uid)" : true])
        
        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount" : post.likeCount, "\(Auth.auth().currentUser!.uid)" : true])
    }
    
    func unlike() {
        post.likeCount -= 1
        isLinked = false
        
        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount" : post.likeCount, "\(Auth.auth().currentUser!.uid)" : false])
        
        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount" : post.likeCount, "\(Auth.auth().currentUser!.uid)" : false])
    }
}
