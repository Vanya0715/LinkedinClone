//
//  Post.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 09/08/22.
//

import SwiftUI

struct Post: View {
    
    @State private var postImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No"
    @State private var text = ""
    
    func loadImage() {
        guard let ImageInput = pickedImage else {return}
        postImage = ImageInput
    }
    
    func clear() {
        self.text = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "photo.on.rectangle.angled")
        
    }
    
    func uploadPost() {
        if let error = checkError() {
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
   
        //firebase
        PostService.uploatPost(Caption: text, imageData: imageData) {
            self.clear()
        } onError: { errorMessage in
            self.error = errorMessage
            self.showingAlert = true
            return
            
        }

    }
    
    func checkError() -> String? {
        if text.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty {
           return " Please add a caption and provide an image"
        }
        return nil
    }
    
    
    var body: some View {
        VStack {
            Logo()
                .padding()
                .padding(.bottom, 40)
            
            VStack {
                if postImage != nil {
                    postImage!.resizable()
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            self.showingActionSheet = true
                        }
                }
                else {
                    Image(systemName: "photo.on.rectangle.angled").font(.system(size: 100, weight: .light))
                        .foregroundColor(.black.opacity(0.6))
                        .frame(width: 200, height: 200)
                        .padding()
                        .onTapGesture {
                            self.showingActionSheet = true
                        }
                }
            }
            TextEditor(text: $text)
                .frame(height: 150)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
                .padding(.horizontal)
            
        
            ButtonView(title: "Select a photo") {
                self.showingActionSheet = true
            }
            .padding(.horizontal)
                .padding(.top, 8)
            
           
                ButtonView(title: "Upload", background: .clear, foreground: .cyan, border: .cyan) {
                 uploadPost()
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }
                .padding()
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: self.$pickedImage, isPickerShowing: self.$showingImagePicker, imageData: self.$imageData)
            }.actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text(""), buttons: [
                    .default(Text("Choose a photo")) {
                        self.sourceType = .photoLibrary
                        self.showingImagePicker = true
                    },
                    .default(Text("Take a photo")) {
                        self.sourceType = .camera
                        self.showingImagePicker = true
                    }, .cancel()
                ])
            }
        
        }
    }
}

////struct Post_Previews: PreviewProvider {
////    static var previews: some View {
////        Post()
////    }
//}
