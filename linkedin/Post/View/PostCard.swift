//
//  PostCard.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 26/08/22.
//

import SwiftUI

struct PostCard: View {
    
    @ObservedObject var postCardService = PostCardServices()
    @State private var animate = false
    private let duration: Double = 0.3
    private var animaterScale: CGFloat {
        postCardService.isLinked ? 0.5 : 2.0
    }
    init(post:PostModel) {
        self.postCardService.post = post
//        self.postCardService.hasLinkedPost()
    }
    
    
    var body: some View {
        
            HStack(alignment: .center, spacing: 45) {
                
                socialView(image: "\((self.postCardService.isLinked) ? "hand.thumbsup.fill" : "hand.thumbsup")", title: "Like") {
                    
                }
                    .foregroundColor((self.postCardService.isLinked) ? .cyan : .black)
                    
                    .scaleEffect(animate ? animaterScale : 1)
                    .animation(.easeIn(duration: duration))
                
                socialView(image: "text.bubble", title: "Comment") {
                    
                }
                
                socialView(image: "arrow.turn.up.right", title: "Share") {
                    
                }
                
                socialView(image: "paperplane.fill", title: "Send") {
                    
                }
           
            }.padding(.vertical, 10)
            .padding(.horizontal, 30)
        

    }
}


struct socialView: View {
    
    var image: String
    var title: String
    typealias ActionHandler = () -> Void
    let handler: ActionHandler
    
    internal init(image: String, title: String, handler: @escaping socialView.ActionHandler) {
        self.image = image
        self.title = title
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Button (action: handler) {
             Image(systemName: image)
                    .font(.subheadline)
            }
            Text(title)
                .font(.subheadline)
        }
        .foregroundColor(.black.opacity(0.8))
      
    }
}
