//
//  StorageService.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 16/08/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import SwiftUI


class StorageService {
    
    static var storage = Storage.storage()
    static var storageRoot = storage.reference()
    static var storageProfile = storageRoot.child("profile")
    static var storagePost = storageRoot.child("Posts")
    
    static func storagePostId(postId: String) -> StorageReference {
        return storageProfile.child(postId)
    }
    
    static func savePostImage(userId: String, caption: String, postId: String, imageData: Data, metadata: StorageMetadata, storagePostImageref: StorageReference, onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
        
        storagePostImageref.putData(imageData, metadata: metadata) { (StorageMetadata, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storagePostImageref.downloadURL { url, error in
                if let metaImageUrl = url?.absoluteString {
                    let firestorePostRef = PostService.PostsUserId(userId: userId).collection("posts").document(postId)
                    
                    let post = PostModel.init(caption: caption,likes: [:], postId: postId, ownerId: userId, mediaURL: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
                    
                    guard let dict = try? post.asDict() else {return}
                    
                    firestorePostRef.setData(dict){
                        (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                        PostService.timelineUserId(userId: userId).collection("timeLine").document(postId).setData(dict)
                        PostService.AllPosts.document(postId).setData(dict)
                        onSuccess()
                    }
                
                }
            }
            
        }
    }
}
