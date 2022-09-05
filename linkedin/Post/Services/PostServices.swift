//
//  PostServices.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 16/08/22.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI


class PostService {
    
    static var Posts = RegistrationServiceImpl.storeRoot.collection("Posts")
    
    static var AllPosts = RegistrationServiceImpl.storeRoot.collection("allPosts")
    
    static var TimeLine = RegistrationServiceImpl.storeRoot.collection("timeLine")
    
    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }
    
    static func timelineUserId(userId: String) -> DocumentReference {
        return TimeLine.document(userId)
    }
    
    static func uploatPost(Caption: String, imageData: Data, onSuccess: @escaping()-> Void, onError: @escaping(_ errorMessage: String)-> Void) {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let postId = PostService.PostsUserId(userId: userId).collection("Posts").document().documentID
        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        StorageService.savePostImage(userId: userId, caption: Caption, postId: postId, imageData: imageData, metadata: metaData, storagePostImageref: storagePostRef, onSuccess: onSuccess, onError: onError)
        
    }
    
    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {
        
        PostService.PostsUserId(userId: userId).collection("posts").getDocuments { (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            var posts = [PostModel]()
            
            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? PostModel.init(fromDictionary: dict)
                else {
                    return
                }
                posts.append(decoder )
            }
            onSuccess(posts)
        }
    }
}
