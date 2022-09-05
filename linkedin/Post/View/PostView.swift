//
//  PostView.swift
//  linkedin


import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {

    @EnvironmentObject var sessionService: SessionServiceImpl
    var post: PostModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(width: UIScreen.main.bounds.size.width, height: 5)
                .ignoresSafeArea(.all)
                
            
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .leading)
                    .padding(10)
                   
                
                VStack(alignment: .leading) {
                    Text(" \(sessionService.userDetails?.firstName ?? " N/A") \(sessionService.userDetails?.lastName ?? " N/A")")
                        .font(.body)
                    Text(" \(sessionService.userDetails?.occupation ?? " N/A")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text((Date(timeIntervalSince1970: post.date)).timeAgo() + " ago")
                        .foregroundColor(.gray)
                        .font(.caption)
                }.padding(10)
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding([.trailing, .bottom] , 10)
                
            }
          
            
            Text(post.caption)
                .lineLimit(nil)
                .padding(.leading, 10)
            
            WebImage(url: URL(string: post.mediaURL)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width - 50, alignment: .center)
               

            
            PostCard(post: post)
               
               
                
            Divider()
        }
    }
}
